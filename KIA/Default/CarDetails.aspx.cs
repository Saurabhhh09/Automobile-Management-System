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
    public partial class WebForm3 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;
        int carId;
        protected void Page_Load(object sender, EventArgs e)
        {
             carId = Convert.ToInt32(Request.QueryString["Id"]);
            LoadCarDetails(carId);
        }

        private void LoadCarDetails(int carId)
        {
            try
            {
                string query = "Select * from Car WHERE Id=@id";
                con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", carId);
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    CarDetailsView.DataSource = dr;
                    CarDetailsView.DataBind();

                    while (dr.Read())
                    {
                        //string imgPath = dr["ImgPath"].ToString();

                        //carimage.ImageUrl = "~/UploadImage/" + imgPath;
                    }
                }
                else
                {
                    Response.Write("<script>alert('Car Is Unavailable!');</script>");
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

        //protected void CarDetailsView_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "Book")
        //    {
        //        string carId = e.CommandArgument.ToString();

        //    }
        //}

        protected void btnBook_Click(object sender, EventArgs e)
        {
            Response.Redirect($"/User/BookCar.aspx?Id={carId}");
        }
    }
}