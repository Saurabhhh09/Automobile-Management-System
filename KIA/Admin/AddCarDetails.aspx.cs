using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Diagnostics;
using System.Xml.Linq;

namespace KIA.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserId = Request.Cookies["User"]?.Value;
            if(!IsPostBack)
            {
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
                        DdCarType.DataSource = reader;
                        DdCarType.DataTextField = "Name"; // Field to display
                        DdCarType.DataValueField = "Id";  // Field for value
                        DdCarType.DataBind();

                        // Add default item
                        DdCarType.Items.Insert(0, new ListItem("Select", "0"));
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string Name = txtName.Text.Trim().ToUpper();
            int CarType = Convert.ToInt32(DdCarType.SelectedValue);
            decimal price;
            bool isValidPrice = decimal.TryParse(txtPrice.Text.Trim(), out price);
            string FuelType = txtTypeFuel.Text.Trim().ToUpper();
            int SeatingCapacity = Convert.ToInt32(txtSeating.Text.Trim());
            string FuelEfficiency = txtFuelEffeciency.Text.Trim().ToUpper();
            int Year = Convert.ToInt32(txtYear.Text.Trim());
            string Description = txtDescription.Text.Trim().ToUpper();
            string TopSpeed = txtTopSpeed.Text.Trim().ToUpper();
            string Colour = txtColor.Text.Trim().ToUpper();
            string EngineType = txtEngineType.Text.Trim().ToUpper();
            DateTime Createdate = DateTime.Now;
            string ImgName;
            string folder = Server.MapPath("~/UploadImage/");
            if(UplImg.HasFile)
            {
                HttpPostedFile Upload = UplImg.PostedFile;
                int length = Upload.ContentLength;
                ImgName = Path.GetFileNameWithoutExtension(Upload.FileName) + "-" + Guid.NewGuid() ;
                string extension = Path.GetExtension(Upload.FileName) ;
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".pdf" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png") 
                {
                    if(length <= 1000000)
                    {
                        
                        using(con = new SqlConnection(cs))
                        {
                            try
                            {
                                string query = "INSERT INTO Car(Name, CarTypeId , FuelType, SeatingCapacity, Description, ImgPath, FuelEfficiency, Price, ReleaseYear, CreatedAt,Colour,TopSpeed,EngineType)" +
                                    " VALUES(@name,@CarTypeId, @fueltype, @seatingcapacity, @description, @imgpath, @fuelEfficiency, @Price, @ReleaseYear, @CreatedAt,@Colour,@TopSpeed,@EngineType)";
                                SqlCommand cmd = new SqlCommand(query, con);
                                cmd.Parameters.AddWithValue("@name",Name);
                                cmd.Parameters.AddWithValue("@fueltype", FuelType);
                                cmd.Parameters.AddWithValue("@CarTypeId",CarType);
                                cmd.Parameters.AddWithValue("@seatingcapacity", SeatingCapacity);
                                cmd.Parameters.AddWithValue("@description", Description);
                                cmd.Parameters.AddWithValue("@imgpath",ImgName + extension);
                                cmd.Parameters.AddWithValue("@fuelEfficiency", FuelEfficiency); // in km/l
                                cmd.Parameters.AddWithValue("@Price", price); // example price
                                cmd.Parameters.AddWithValue("@ReleaseYear", Year);
                                cmd.Parameters.AddWithValue("@Colour", Colour);
                                cmd.Parameters.AddWithValue("@TopSpeed", TopSpeed);
                                cmd.Parameters.AddWithValue("@EngineType", EngineType);
                                cmd.Parameters.AddWithValue("@CreatedAt", Createdate);
                                con.Open();
                                int rowEffected = cmd.ExecuteNonQuery();
                                if (rowEffected > 0)
                                {
                                    UplImg.SaveAs(folder + ImgName + extension);
                                    Response.Write("<script>alert('Vehicle Added Successfully!')</script>");
                                    Clear();
                                }
                                else
                                {
                                    Response.Write("<script>alert('Vehicle Added Failed!')</script>");
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
                    else
                    {
                        Response.Write("<script>alert('Image is not not large than 1Mb!')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Image is not in correct Format!')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Choose an Image!')</script>");
            }

            
        }

        private void Clear()
        {
            txtName.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtSeating.Text = string.Empty;
            txtFuelEffeciency.Text = string.Empty;
            txtYear.Text = string.Empty;
            txtColor.Text = string.Empty;
            txtEngineType.Text = string.Empty;
            txtTopSpeed.Text = string.Empty;
            DdCarType.SelectedIndex = 0;
            txtTypeFuel.Text = string.Empty ;              
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Clear();           
        }
    }
}