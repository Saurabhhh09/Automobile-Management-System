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
    public partial class WebForm8 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserId = Request.Cookies["User"]?.Value;
            if (string.IsNullOrEmpty(UserId))
            {
                Response.Redirect("/Default/SignInPage.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    BindGridView();
                }
            }
           
        }
        void BindGridView()
        {
            string query = "Select * from Car";
            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    CarListGridView.DataSource = dt;
                    CarListGridView.DataBind();
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

        protected void CarListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CarListGridView.PageIndex = e.NewPageIndex;
            BindGridView();
        }

        protected void CarListGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Get the OrderID for the current row
                int CarTypeId = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "CarTypeId"));

                // Find the child GridView in the current row
                GridView CarTypeGridView = (GridView)e.Row.FindControl("CarTypeGridView");

                // Bind the child GridView with data
                CarTypeGridView.DataSource = BindCarTypeGridView(CarTypeId);
                CarTypeGridView.DataBind();
            }
        }
        protected DataTable BindCarTypeGridView(int Id)
        {
            string query = "Select * from CarType Where Id = @Id";
            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(query,con);
            cmd.Parameters.AddWithValue("@Id",Id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                con.Open();
                da.Fill(dt);

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }

            return dt;
        }
    }
}