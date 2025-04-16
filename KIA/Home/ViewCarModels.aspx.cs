using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KIA.Home
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;                    
        SqlConnection con = null;                                                                       
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    ShowCarType();
            //}
        }

        //protected void rptCars_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "ViewMore")
        //    {
        //        string CarId = e.CommandArgument.ToString();
        //        Response.Redirect($"../User/CarDetail.aspx?Id={CarId}");
        //    }
        //}

        void ShowCarType()
        {
            if (Session["Id"] != null || Session["Type"] != null)
            {
                int CarTypeId = Convert.ToInt32(Session["Id"]);
                string TypeName = Session["Type"].ToString();
                lblCarType.Text = TypeName;
                try
                {
                    string query = "SELECT * from Car Where CarTypeId = @CarTypeId";
                    con = new SqlConnection(cs);
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@CarTypeId", CarTypeId);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    //rptCars.DataSource = dt;
                    //rptCars.DataBind();
                    DataListCarModel.DataSource = dt;
                    DataListCarModel.DataBind();

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
            else
            {
                //Response.Redirect("../MainHome.aspx");
            }
        }

        protected void DataListCarModel_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ViewMore")
            {
                string CarId = e.CommandArgument.ToString();
                Response.Redirect($"../User/CarDetail.aspx?Id={CarId}");
            }
        }
    }
}