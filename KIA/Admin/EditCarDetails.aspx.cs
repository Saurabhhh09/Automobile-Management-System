using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace KIA.Admin
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;
        string OldImg;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string name = txtSearch.Text.Trim().ToUpper();

            BindDataToDetailView();
        }
        void BindDataToDetailView()
        {
            string query = "Select * from Car Where Name = @name";
            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@name", txtSearch.Text.Trim().ToUpper());
            try
            {
                con.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    lblMsg.Text = string.Empty;
                    lblMsg.Visible = false;
                    dvCarDetails.DataSource = dt;
                    dvCarDetails.DataBind();
                    dvCarDetails.Visible = true;
                    OldImg = dt.Rows[0]["ImgPath"].ToString();
                    
                    //string imgPath = dvCarDetails.DataSource["hfh"];
                }
                else
                {
                    lblMsg.Text = "There is not any data in Database of this car!";
                    lblMsg.Visible = true;
                    dvCarDetails.Visible= false;

                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally { con.Close(); }
        }

       

        protected void dvCarDetails_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            int ID = Convert.ToInt32(dvCarDetails.DataKey.Value);
           
            FileUpload fileUpload = (FileUpload)dvCarDetails.FindControl("UplImg");
            string existingImagePath = e.OldValues["ImgPath"]?.ToString();


            if (fileUpload.HasFile)
            {
                HttpPostedFile Upload = fileUpload.PostedFile;
                int length = Upload.ContentLength;
                string extension = Path.GetExtension(Upload.FileName);
                // Save the uploaded file
                string folderPath = Server.MapPath("~/UploadImage/");
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".pdf" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png")
                {
                    if (length <= 1000000)
                    {
                       
                        string fileName = Guid.NewGuid().ToString() + extension;
                       
                        fileUpload.SaveAs(folderPath + fileName);
                        Update(ID, fileName);
                    }
                    else
                    {
                        Response.Write("<script>alert('Selected Image is over sized!');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Selected Image is not in correct format!');</script>");
                }
                     
            }
            else
            {
                // No new file uploaded; keep the existing image path
                Update(ID, OldImg);
            }


            // Exit edit mode and rebind data
            dvCarDetails.ChangeMode(DetailsViewMode.ReadOnly);
            BindDataToDetailView();
        }

        protected void Update(int ID , string Img)
        {
            // Find controls in EditItemTemplate
            TextBox txtName = (TextBox)dvCarDetails.FindControl("txtName");
            TextBox txtDescription = (TextBox)dvCarDetails.FindControl("txtDescription");
            TextBox txtSeatingCapacity = (TextBox)dvCarDetails.FindControl("txtSeatingCapacity");
            TextBox txtFuelType = (TextBox)dvCarDetails.FindControl("txtFuelType");
            TextBox txtFuelEfficiency = (TextBox)dvCarDetails.FindControl("txtFuelEfficiency");
            TextBox txtTopSpeed = (TextBox)dvCarDetails.FindControl("txtTopSpeed");
            TextBox txtEngineType = (TextBox)dvCarDetails.FindControl("txtEngineType");
            TextBox txtColour = (TextBox)dvCarDetails.FindControl("txtColour");
            TextBox txtReleaseYear = (TextBox)dvCarDetails.FindControl("txtReleaseYear");
            TextBox txtPrice = (TextBox)dvCarDetails.FindControl("txtPrice");


            if (!string.IsNullOrEmpty(txtName.Text) && !string.IsNullOrEmpty(txtEngineType.Text) && !string.IsNullOrEmpty(txtColour.Text) &&
                   !string.IsNullOrEmpty(txtFuelEfficiency.Text) && !string.IsNullOrEmpty(txtFuelType.Text) && !string.IsNullOrEmpty(txtReleaseYear.Text)
                   && !string.IsNullOrEmpty(txtSeatingCapacity.Text) && !string.IsNullOrEmpty(txtTopSpeed.Text) && !string.IsNullOrEmpty(txtDescription.Text) && !string.IsNullOrEmpty(txtPrice.Text))
            {
                // Save updated values
                string query = "UPDATE Car SET Name = @Name, Description = @Description, SeatingCapacity = @SeatingCapacity, " +
                           "FuelType = @FuelType, FuelEfficiency = @FuelEfficiency, TopSpeed = @TopSpeed, " +
                           "EngineType = @EngineType, Colour = @Colour, ImgPath = @ImgPath, ReleaseYear = @ReleaseYear, Price = @Price, UpdatedAt = @UpdatedAt WHERE ID = @ID";

                using (con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@ID", ID);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim().ToUpper());
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim().ToUpper());
                    cmd.Parameters.AddWithValue("@SeatingCapacity", Convert.ToInt32(txtSeatingCapacity.Text));
                    cmd.Parameters.AddWithValue("@FuelType", txtFuelType.Text.Trim().ToUpper());
                    cmd.Parameters.AddWithValue("@FuelEfficiency", txtFuelEfficiency.Text.Trim().ToUpper());
                    cmd.Parameters.AddWithValue("@TopSpeed", txtTopSpeed.Text.Trim().ToUpper());
                    cmd.Parameters.AddWithValue("@EngineType", txtEngineType.Text.Trim().ToUpper());
                    cmd.Parameters.AddWithValue("@ImgPath", Img);
                    cmd.Parameters.AddWithValue("@Colour", txtColour.Text.Trim().ToUpper());
                    cmd.Parameters.AddWithValue("@ReleaseYear", int.Parse(txtReleaseYear.Text));
                    cmd.Parameters.AddWithValue("@Price", Decimal.Parse(txtPrice.Text));
                    cmd.Parameters.AddWithValue("@UpdatedAt", DateTime.Now);

                    con.Open();
                    cmd.ExecuteNonQuery();


                }
            }
            else
            {
                Response.Write("<script>alert('Fill all fields!');</script>");
            }
        }

        protected void dvCarDetails_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(dvCarDetails.DataKey.Value);

            // Call the method to delete the record from the database
            DeleteRecord(id);
            Response.Write("<script>('Data Deleted Successfully!');</script>");
            // Refresh the DetailsView
            //BindDataToDetailView();
            dvCarDetails.Visible = false;
        }

        protected void dvCarDetails_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                dvCarDetails.ChangeMode(DetailsViewMode.Edit);
            }
            else if (e.CommandName == "Delete")
            {
                // Code to delete the record
                int id = Convert.ToInt32(dvCarDetails.DataKey.Value);
                //DeleteRecord(id);
                //BindDataToDetailView();
            }
            else if (e.CommandName == "Cancel")
            {
                dvCarDetails.ChangeMode(DetailsViewMode.ReadOnly);
            }
        }

        private void DeleteRecord(int id)
        {
            string query = "DELETE FROM Car WHERE Id = @Id";
            using (con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void dvCarDetails_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            dvCarDetails.ChangeMode(e.NewMode);
            BindDataToDetailView();
        }
    }
}