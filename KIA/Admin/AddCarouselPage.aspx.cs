using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.AccessControl;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace KIA.Admin
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindModelDropDown();
            }
        }

        private void BindModelDropDown()
        {
            // Query to fetch data
            string query = "SELECT Id, Name FROM Car";

            using (con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    try
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        // Bind data to the DropDownList
                        DpModel.DataSource = reader;
                        DpModel.DataTextField = "Name"; // Field to display
                        DpModel.DataValueField = "Id";  // Field for value
                        DpModel.DataBind();

                        // Add default item
                        DpModel.Items.Insert(0, new ListItem("Model", "0"));
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

        protected void btnAddVdo_Click(object sender, EventArgs e)
        {
            
            if(DpModel.SelectedValue != "0")
            {
                int CarId = Convert.ToInt32(DpModel.SelectedValue);
                string Description = txtDescription.Text.Trim();
                string Title = txtTitle.Text.Trim();
                string folder = Server.MapPath("~/CarouselVideo/");
                string VideoName;
                if (UplVideo.HasFile)
                {
                    HttpPostedFile Upload = UplVideo.PostedFile;
                    //int lenght = Upload.ContentLength;
                    VideoName = Path.GetFileNameWithoutExtension(Upload.FileName) + "-" + Guid.NewGuid();
                    string extension = Path.GetExtension(Upload.FileName);
                    if (extension.ToLower() == ".mp4")
                    {
                        //if (lenght <= 1000000)
                        //{

                            using (con = new SqlConnection(cs))
                            {
                                try
                                {
                                    string query = "INSERT INTO CarouselVdo(VdoName,Description,Title,CarId) VALUES(@VideoName,@Description,@Title,@CarId)";
                                    SqlCommand cmd = new SqlCommand(query, con);
                                    cmd.Parameters.AddWithValue("@CarId", CarId);
                                    cmd.Parameters.AddWithValue("@Description", Description);
                                    cmd.Parameters.AddWithValue("@Title",Title);
                                    cmd.Parameters.AddWithValue("VideoName", VideoName + extension);
                                    con.Open();
                                    int rowEffected = cmd.ExecuteNonQuery();
                                    if (rowEffected > 0)
                                    {
                                        UplVideo.SaveAs(folder + VideoName + extension);
                                        Response.Write("<script>alert('Video Added Successfully!')</script>");                           
                                    }
                                    else
                                    {
                                        Response.Write("<script>alert('Video Added Failed!')</script>");
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
                        //}
                        //else
                        //{
                        //    Response.Write("<script>alert('Video is not not large than 1Mb!')</script>");
                        //}
                    }
                    else
                    {
                        Response.Write("<script>alert('Upload only MP4 Video.')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Please Upload Video!')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Select Car Model.')</script>");
                SetFocus(DpModel);
            }
        }

    }
}