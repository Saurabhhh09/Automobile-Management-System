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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;

        SqlConnection con = null;
        int IsAdmin;
        HttpCookie cookie = new HttpCookie("User");     //this "User" is retrieve in next page.

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (CheckMemberExist())
            {
                string returUrl = Request.QueryString["ReturnUrl"];
                if (!string.IsNullOrEmpty(returUrl))
                {
                    Response.Cookies.Add(cookie);
                    Response.Redirect(Server.UrlDecode(returUrl));
                }
                else
                {
                    if (IsAdmin == 1)
                    {
                        Response.Cookies.Add(cookie);
                        Response.Write("<script>alert('Welcome Admin.')</script>");
                        Response.Redirect("/Admin/AdminDashboard.aspx");

                    }
                    else
                    {
                        Response.Cookies.Add(cookie);
                        Response.Write("<script>alert('Welcome User.')</script>");
                        Response.Redirect("/User/UserProfile.aspx");

                    }
                }

            }
            else
            {
                Response.Write("<script>alert('Incorrect Email or Password!')</script>");
            }

        }

        bool CheckMemberExist()
        {
            string email = txtEmail.Text.Trim().ToString();
            string pass = txtPass.Text.Trim().ToString();

            string query = "Select * from [User] Where Email = @email and Password = @pass";
            con = new SqlConnection(cs);
            try
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@pass", pass);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        IsAdmin = Convert.ToInt32(dr["IsAdmin"]);
                        cookie.Value = dr["Id"].ToString();
                    }
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                return true;
            }
            finally
            {
                con.Close();
            }
        }
    }
}