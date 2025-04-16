using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace KIA.Default
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowCars();
            }
        }

        void ShowCars()
        {

            lblCarType.Text = "Cars";
            try
            {
                string query = "SELECT * from Car";
                con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DL_TotalCars.DataSource = dt;
                DL_TotalCars.DataBind();

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

        protected void DL_TotalCars_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ViewMore")
            {
                string CarId = e.CommandArgument.ToString();
                Response.Redirect($"/Default/CarDetails.aspx?Id={CarId}");
            }
        }

    }
}