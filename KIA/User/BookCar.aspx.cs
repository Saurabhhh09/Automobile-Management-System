using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KIA.User
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string userId;
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            userId = Request.Cookies["User"]?.Value;
            int carId = Convert.ToInt32(Request.QueryString["Id"]);
            if (userId == null)
            {
                string currentUrl = HttpContext.Current.Request.Url.AbsoluteUri;
                Response.Redirect($"/Default/SignInPage.aspx?ReturnUrl={Server.UrlEncode(currentUrl)}");
            }
            else
            {
                if (carId != 0)
                {
                    CarDetails(carId);
                    UserDetail(userId);
                }
                else
                {
                    Response.Redirect("/Default/TotalCars.aspx");
                }
                    
            }
            
        }

        private void CarDetails(int carId)
        {
            string query = "Select * from Car Where Id = @carId";
            con = new SqlConnection(cs);
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@carId", carId);

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        txtCar.Text = reader["Name"].ToString();
                        decimal price = Convert.ToDecimal(reader["Price"]);
                        txtPrice.Text = price.ToString();
                        decimal total_Price = price + (price * 28 / 100);
                        txtAmount.Text = total_Price.ToString();
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

        private void UserDetail(string userId)
        {
            string query = "Select * from [User] Where Id = @userId";
            con = new SqlConnection(cs);
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@userId", userId);
                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        txtName.Text = reader["Name"].ToString();
                        txtContact.Text= reader["Contact_No"].ToString();
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

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            int carId = Convert.ToInt32(Request.QueryString["Id"]);
            string query = "INSERT Into Orders(UserId,CarId,Total,Address,Date,Delivery_Date," +
                "PinCode,Name,Contact_No) Values(@UserId,@CarId,@Total,@Address,@Date,@Delivery_Date,@PinCode,@Name,@Contact_No);SELECT SCOPE_IDENTITY(); ";
            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId",userId);
            cmd.Parameters.AddWithValue("@CarId", carId);
            cmd.Parameters.AddWithValue("@Total",txtAmount.Text);
            cmd.Parameters.AddWithValue("@Address",txtAddress.Text);
            cmd.Parameters.AddWithValue("@Date",DateTime.Now);
            cmd.Parameters.AddWithValue("@Delivery_Date",DateTime.Parse(txtDeliveryDate.Text));
            cmd.Parameters.AddWithValue("@PinCode",txtPinCode.Text);
            cmd.Parameters.AddWithValue("@Name",txtName.Text);
            cmd.Parameters.AddWithValue("@Contact_No",txtContact.Text);
            try
            {
                con.Open();
                //int rowEffected = cmd.ExecuteNonQuery();
                object id = cmd.ExecuteScalar();
                int OrderId = Convert.ToInt32(id);
                if (id != null)
                {
                    
                    Response.Redirect($"~/Invoice.aspx?OrderId={OrderId}");
                }
                else
                {
                    Response.Write("<script>alert('Booking Failed. Retry!');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally {con.Close(); }
        }
    }
}