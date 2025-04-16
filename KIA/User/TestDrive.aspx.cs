using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KIA.User
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;
        string userId;   // define for user id.
        protected void Page_Load(object sender, EventArgs e)
        {
            
             userId = Request.Cookies["User"]?.Value;
            if (userId != null)
            {
                if (!IsPostBack)
                {
                    BindModelDropDown();
                    BindStates();
                }
            }
            else
            {
                string currentUrl = HttpContext.Current.Request.Url.AbsoluteUri;
                Response.Redirect($"/Default/SignInPage.aspx?ReturnUrl={Server.UrlEncode(currentUrl)}");
            }
        }

        private void BindModelDropDown()
        {
            // Query to fetch data
            string query = "SELECT Id, Name FROM Car";

            using (con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    try
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        // Bind data to the DropDownList
                        DpModel.DataSource = reader;
                        DpModel.DataTextField = "Name"; // Field to display
                        DpModel.DataValueField = "Id";  // Field for value
                        DpModel.DataBind();

                        // Add default item
                        DpModel.Items.Insert(0, new ListItem("Model", "0"));
                    }
                    catch (Exception ex)
                    {
                        // Handle exceptions
                        Response.Write($"<script>alert('{ex.Message}');</script>");
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }

        //private void BindShowroom()
        //{
        //    string query = "Select Id,Name From Showroom";
        //    using (con = new SqlConnection(cs))
        //    {
        //        SqlCommand cmd = new SqlCommand(query, con);

        //        try
        //        {
        //            con.Open();
        //            SqlDataReader dr = cmd.ExecuteReader();
        //            ChooseShowroom.DataSource = dr;
        //            ChooseShowroom.DataTextField = "Name";
        //            ChooseShowroom.DataValueField = "Id";
        //            ChooseShowroom.DataBind();

                   
        //        }
        //        catch (Exception ex)
        //        {
        //            Response.Write(ex.Message);
        //        }
        //        finally
        //        {
        //            con.Close();
        //        }
        //    }
        //}

        protected void btnRequest_Click(object sender, EventArgs e)
        {
            if (check.Checked)
            {
                if (checkSelectedValueCorrect())
                {
                    TestDriveRequest();
                }
                else
                {
                    Response.Write("<script>alert('Please Select Car or Showroom!');</script>");
                }
            }

            else
            {
                Response.Write("<script>alert(`Check Terms and Condition!`);</script>");
            }
        }

        private bool checkSelectedValueCorrect()
        {
            int showroomId = Convert.ToInt32(ChooseShowroom.SelectedValue);
            int carId = Convert.ToInt32(DpModel.SelectedValue);
            if (showroomId != 0 && carId != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        }

        private void TestDriveRequest()
        {
            
            int carId = Convert.ToInt32(DpModel.SelectedValue);
            //userId Define in global scope.
            int showroomId = Convert.ToInt32(ChooseShowroom.SelectedValue);
            DateTime dt = DateTime.Parse(txtDate.Text);     //convert into datetime datatype.

            string query = "Insert into testDrive(UserId,CarId,ShowroomId,Date,Status) Values(@UserId,@carId,@showroomId,@Date,@Status)";
            using(con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", int.Parse(userId));
                cmd.Parameters.AddWithValue("@carId",carId);
                cmd.Parameters.AddWithValue("@showroomId",showroomId);
                cmd.Parameters.AddWithValue("@Date", dt);
                cmd.Parameters.AddWithValue("@Status", "Pending");
                try
                {
                    con.Open();
                    int rowEffected = cmd.ExecuteNonQuery();
                    if (rowEffected > 0) 
                    {
                        Response.Write("<script>alert('Request send Successfully!');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Request send Failed ! Please try again.');</script>");
                    }
                }
                catch (Exception ex)
                { 
                    Response.Write($"Error: {ex.Message}");
                }
                finally 
                {
                    con.Close();
                }

            }
            
        }

        //private bool checkMemberExist()
        //{
        //    string email = txtEmail.Text.Trim().ToString();
        //    string pass = txtPass.Text.Trim().ToString();
        //    string query = "Select * From [User] Where Email = @email and Password = @pass";
        //    using (con = new SqlConnection(cs))
        //    {
        //        SqlCommand cmd = new SqlCommand(query, con);
        //        cmd.Parameters.AddWithValue("@email", email);
        //        cmd.Parameters.AddWithValue("@pass",pass);
        //        try
        //        {
        //            con.Open() ;
        //            SqlDataReader dr = cmd.ExecuteReader();
        //            if(dr.HasRows)
        //            {
        //                while(dr.Read())
        //                {
        //                    userId = Convert.ToInt32(dr["Id"]);
        //                }
        //                return true;
        //            }
        //            else
        //            {
        //                return false;
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            Response.Write(ex.Message);
        //            return false;   
        //        }
        //        finally 
        //        {
        //            con.Close(); 
        //        }
        //    }
            
        //}

        protected void BindStates()
        {
            string query = "SELECT * FROM States";
            con = new SqlConnection(cs);
            using(SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                DdState.DataSource = dr;
                DdState.DataTextField = "Name"; // Field to display
                DdState.DataValueField = "Id";  // Field for value
                DdState.DataBind();

                // Add default item
                DdState.Items.Insert(0, new ListItem("Select State", "0"));
                DdCity.Items.Insert(0, new ListItem("Select City", "0"));
                ChooseShowroom.Items.Insert(0, new ListItem("Select Showroom", "0"));
            }
        }

        protected void DdState_SelectedIndexChanged(object sender, EventArgs e)
        {
              
              int StateId = Convert.ToInt32(DdState.SelectedValue);
              BindCity(StateId);
        }

        protected void BindCity(int StateId)
        {
            string query = "SELECT * FROM City Where StateId = @StateId";
            con = new SqlConnection(cs);
            using (SqlCommand cmd = new SqlCommand(query, con))
            {

                cmd.Parameters.AddWithValue("@StateId", StateId);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                DdCity.DataSource = dr;
                DdCity.DataTextField = "Name";
                DdCity.DataValueField = "Id";
                DdCity.DataBind();

                DdCity.Items.Insert(0, new ListItem("Select City", "0"));
            }
        }

        protected void DdCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            int CityId = Convert.ToInt32(DdCity.SelectedValue);
            BindShowroom(CityId);
        }

        protected void BindShowroom(int CityId) 
        {
            string query = "SELECT * FROM Showroom Where CityId = @CityId";
            con = new SqlConnection(cs);
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@CityId", CityId);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                ChooseShowroom.DataSource = dr;
                ChooseShowroom.DataTextField = "Name";
                ChooseShowroom.DataValueField = "Id";
                ChooseShowroom.DataBind();

                ChooseShowroom.Items.Insert(0, new ListItem("Select Showroom", "0"));
            }
        }
    }
}