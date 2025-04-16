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
    public partial class WebForm2 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;

        SqlConnection con = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (check.Checked)
            {
                if (checkMemberExist())
                {
                    Response.Write("<script>alert(`Email is already registered!Try with another Email.`);</script>");
                }
                else
                {
                    SignUpNewUser();
                    Response.Redirect("/Default/SignInPage.aspx", false);
                }
            }
            else
            {
                Response.Write("<script>alert(`Check Terms and Condition!`);</script>");
            }

        }

        void SignUpNewUser()
        {
            string name = txtName.Text.Trim().ToString().ToUpper();
            string email = txtEmail.Text.Trim().ToString();
            string pass = txtPass.Text.Trim().ToString();
            string contact = txtContact.Text.Trim().ToString();

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(pass) || string.IsNullOrEmpty(contact))
            {
                Response.Write("<script>alert('Fill all fields!');</script>");
                return;
            }
            else
            {
                string query = "Insert Into [User](Name,Email,Password,Contact_No) Values(@name,@email,@pass,@contact)";
                con = new SqlConnection(cs);
                try
                {
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@pass", pass);
                    cmd.Parameters.AddWithValue("@contact", contact);
                    int rowEffected = cmd.ExecuteNonQuery();
                    if (rowEffected > 0)
                    {
                        Response.Write("<script>alert('Sign Up Successfully.');</script>");
                        clear();
                    }
                    else
                    {
                        Response.Write("<script>alert('Sign Up Failed');</script>");
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

        bool checkMemberExist()
        {
            string email = txtEmail.Text.Trim().ToString();
            string query = "Select * From [User] Where Email = @email";
            con = new SqlConnection(cs);
            try
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@email", email);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
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
                return false;
            }
            finally
            {
                con.Close();
            }

        }

        void clear()
        {
            txtEmail.Text = string.Empty;
            txtName.Text = string.Empty;
            txtPass.Text = string.Empty;
            txtContact.Text = string.Empty;
            txtConfPass.Text = string.Empty;

        }
    }
}