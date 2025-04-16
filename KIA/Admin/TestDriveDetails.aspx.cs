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
    public partial class WebForm6 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserId = Request.Cookies["User"]?.Value;
            if (UserId != null)
            {
                if (!IsPostBack)
                {
                    BindTestDriveGridView();
                }
            }
            else
            {
                Response.Redirect("/Default/SignInPage.aspx");
            }
        }

        void BindTestDriveGridView()
        {
            string query = "Select * From testDrive";
            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(query, con);
            try
            {
                con.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    TestDriveListGridView.DataSource = dt;
                    TestDriveListGridView.DataBind();
                }
                else
                {
                    lblMsg.Text = "There is not any data in database.";
                    lblMsg.Visible = true;
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


        protected void TestDriveListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            TestDriveListGridView.PageIndex = e.NewPageIndex;
            BindTestDriveGridView();
        }

        //protected void TestDriveListGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "UpdateStatus")
        //    {
        //        // Get the ID of the selected row
        //        int id = Convert.ToInt32(e.CommandArgument);

        //        // Find the row that triggered the command
        //        GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

        //        // Find the DropDownList in the row
        //        DropDownList ddStatus = (DropDownList)row.FindControl("DdStatus");

        //        if (ddStatus != null)
        //        {
        //            // Get the selected status
        //            string status = ddStatus.SelectedValue;
        //            int index = Convert.ToInt32(ddStatus.SelectedIndex);
        //            if(index != 0)
        //            {
        //                // Update the status in the database
        //                UpdateTestDriveStatus(id, status);

        //                // Refresh the GridView
        //                BindTestDriveGridView();
        //            }
        //            else
        //            {
        //                //UpdateTestDriveStatus(id, "Pending");
        //                //BindTestDriveGridView();
        //                Response.Write("<script>alert('Select Updated Value!');</script>");
        //            }

                   
        //        }
        //    }
        //}

        //private void UpdateTestDriveStatus(int id, string status)
        //{
        //    string query = "UPDATE testDrive SET Status = @Status WHERE Id = @Id";
        //    using (con = new SqlConnection(cs))
        //    {
        //        SqlCommand cmd = new SqlCommand(query, con);
        //        cmd.Parameters.AddWithValue("@Status", status);
        //        cmd.Parameters.AddWithValue("@Id", id);

        //        con.Open();
        //        int rowEffected = cmd.ExecuteNonQuery();
        //        if (rowEffected > 0)
        //        {
        //            lblMsg.Text = "<script>alert('Status Updated Successfully!');</script>";
        //            lblMsg.Visible = true;               
        //        }
        //        else
        //        {
        //            lblMsg.Text = "<script>alert('Status Updated Failed!');</script>";
        //            lblMsg.Visible = true;
        //        }
        //    }
        //}
    }
    
}