using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KIA.Admin
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string Name = txtType.Text.Trim().ToString();
            string query = "Insert Into CarType Values(@Name)";
            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", Name);
            try
            {
                con.Open();
                int rowEffected = cmd.ExecuteNonQuery();
                if (rowEffected > 0)
                {
                    Response.Write("<script>alert('Inserted Successfully.')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Insert Failed.')</script>");
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