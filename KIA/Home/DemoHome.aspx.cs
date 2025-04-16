using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KIA.Home
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindCarousel();
            }
        }
        private void BindCarousel()
        {
         
            // Query to fetch image data
            string query = "SELECT CarId, VdoName, Title, Description FROM CarouselVdo";

            using (con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    try
                    {
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        //SqlDataReader reader = cmd.ExecuteReader();
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        

                        // Bind data to both Repeaters
                        rptCarousel.DataSource = dt;
                        rptCarousel.DataBind();

                        rptIndicators.DataSource = dt;
                        rptIndicators.DataBind();
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

        //protected void rptIndicators_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "MoreView")
        //    {
        //        string CarId = e.CommandArgument.ToString();
        //        Response.Redirect($"../User/CarDetail.aspx?Id={CarId}");
        //    }
        //}
    }
}