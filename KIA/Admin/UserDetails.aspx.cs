using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KIA.Admin
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewBind();
            }
        }
        void GridViewBind()
        {
            string query = "Select * from [User] Where IsAdmin=0";
            con= new SqlConnection(cs); 
            SqlCommand cmd = new SqlCommand(query, con);    
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                con.Open();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    UserGridView.DataSource = dt;
                    UserGridView.DataBind();
                }
                else
                {
                    lblMsg.Text = "Not any data in database!";
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

        protected void UserGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            UserGridView.PageIndex = e.NewPageIndex;
            GridViewBind();
        }

        protected void UserGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Id = Convert.ToInt32(UserGridView.DataKeys[e.RowIndex].Values[0]);
            string query = "Delete From [User] Where Id= @Id";
            con= new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(query,con);
            cmd.Parameters.AddWithValue("@Id", Id);
            try
            {
                con.Open() ;
                int rowEffected = cmd.ExecuteNonQuery();
                if (rowEffected > 0)
                {
                    Response.Write("<script>alert('Deleted successfully')</script>");
                    GridViewBind();

                }
                else
                {
                    lblMsg.Text = "Data not deleted!";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch(Exception ex) 
            {
                lblMsg.Text = "This User Booked Test Drive , First Delete his/her Test Drive!" + ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
                                
            }
            finally
            {
                con.Close();
            }
        }
    }
}