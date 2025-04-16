using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KIA.Admin
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;
        string UserId;
        protected void Page_Load(object sender, EventArgs e)
        {
             UserId = Request.Cookies["User"]?.Value;
            if(UserId != null)
            {
                if (!IsPostBack)
                {
                    BindDashBoard();
                    BindProfile(UserId);
                }
            }
            else
            {
                Response.Redirect("/Default/SignInPage.aspx");
            }
           
        }

        private void BindProfile(string UserId)
        {
            string query = "Select * From [User] Where Id = @Id";
            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Id",UserId);
            try
            {               
                con.Open();
                SqlDataReader dataReader = cmd.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        lblStatus.Text = "Admin";
                        txtName.Text = dataReader["Name"].ToString();
                        txtEmail.Text = dataReader["Email"].ToString();
                        txtPass.Text = dataReader["Password"].ToString();
                        txtCont.Text = dataReader["Contact_No"].ToString();
                        //txtAddress.Text = dataReader["Address"].ToString();
                    }
                }
                else
                {

                    Response.Redirect("../LoginPage.aspx");
                }

            }
            catch (Exception ex)
            { Response.Write(ex.Message); }
            finally { con.Close(); }    

        }

        void BindDashBoard()
        {
            
            using (con = new SqlConnection(cs))
            {
                con.Open();
                string query = "Select COUNT(*) from [User]";
                SqlCommand cmd = new SqlCommand(query, con);
                int userCount = (int)cmd.ExecuteScalar();
                if (userCount > 0)
                {
                    lblUsers.Text = userCount.ToString();
                }
                else
                {
                    lblUsers.Text = "0";
                }
                string query2 = "Select COUNT(*) from Orders";
                SqlCommand cmd2 = new SqlCommand(query2, con);
                int userCount2 = (int)cmd2.ExecuteScalar();
                if (userCount2 > 0)
                {
                    lblOrders.Text = userCount2.ToString();
                }
                else
                {
                    lblOrders.Text = "0";
                }
                string query3 = "Select COUNT(*) from Car";
                SqlCommand cmd3 = new SqlCommand(query3, con);
                int userCount3 = (int)cmd3.ExecuteScalar();
                if (userCount3 > 0)
                {
                    lblVehicles.Text = userCount3.ToString();
                }
                else
                {
                    lblVehicles.Text = "0";
                }
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string Password = ChangePass.Text.Trim();
            con = new SqlConnection(cs);
            string query = "Update [User] Set Password=@Password Where Id=@Id";
            try
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Password", Password);
                cmd.Parameters.AddWithValue("@Id", int.Parse(UserId));
                
                con.Open();
                int rowEffect = cmd.ExecuteNonQuery();
                if (rowEffect > 0)
                {
                    Response.Write("<script>alert('Password Change Succesfully!');</script>");
                    Password = string.Empty;
                    BindProfile(UserId);
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}