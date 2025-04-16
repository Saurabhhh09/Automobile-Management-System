using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KIA.Default
{
    public partial class defaultMaster : System.Web.UI.MasterPage
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;

        SqlConnection con = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            string UserId = Request.Cookies["User"]?.Value;
            if (string.IsNullOrEmpty(UserId))
            {
                SignButton.Style["display"] = "block";
                LogOutButton.Style["display"] = "none";
                profile.Style["display"] = "none";
            }
            else
            {
                LogOutButton.Style["display"] = "block";
                SignButton.Style["display"] = "none";
                profile.Style["display"] = "block";
            }

            if (!IsPostBack)
            {
                //  LoadCarType();
                BindCarTypeDropDown();
            }
        }

        private void BindCarTypeDropDown()
        {


            // Query to fetch data
            string query = "SELECT Id, Name FROM CarType";

            using (con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    try
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        // Bind data to the DropDownList
                        DropDownCarType.DataSource = reader;
                        DropDownCarType.DataTextField = "Name"; // Field to display
                        DropDownCarType.DataValueField = "Id";  // Field for value
                        DropDownCarType.DataBind();

                        // Add default item
                        DropDownCarType.Items.Insert(0, new ListItem("Type", "0"));
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

        protected void DropDownCarType_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get selected EmployeeID
            Session["Id"] = DropDownCarType.SelectedValue.ToString();
            Session["Type"] = DropDownCarType.SelectedItem.ToString();

            if (DropDownCarType.SelectedValue != "0") // Ensure it's not the default item
            {
                Session["Id"] = DropDownCarType.SelectedValue;
                Response.Redirect("/Default/CarModelsView.aspx");
            }

        }

        protected void LogoutLink_Click(object sender, EventArgs e)
        {
            // Check if the cookie exists
            if (Request.Cookies["User"] != null)
            {
                // Create a new cookie with the same name
                HttpCookie cookie = new HttpCookie("User");

                // Set its expiration date to the past
                cookie.Expires = DateTime.Now.AddDays(-1);

                // Add the expired cookie to the response to delete it
                Response.Cookies.Add(cookie);
            }

            // Redirect to the login page
            Response.Redirect("/Default/SignInPage.aspx");
        }
    }
}