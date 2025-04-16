using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KIA.Admin
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStates();
            }
        }

        protected void BindStates()
        {
            string query = "SELECT * FROM States";
            con = new SqlConnection(cs);
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                DdState.DataSource = dr;
                DdState.DataTextField = "Name"; // Field to display
                DdState.DataValueField = "Id";  // Field for value
                DdState.DataBind();

                // Add default item
                DdState.Items.Insert(0, new ListItem("Select State", "0"));
                DdCity.Items.Insert(0, new ListItem("Select City", "0"));
              
            }
        }

        protected void DdState_SelectedIndexChanged(object sender, EventArgs e)
        {
            int StateId = Convert.ToInt32(DdState.SelectedValue);
            BindCity(StateId);
        }

        private void BindCity(int StateId)
        {
            string query = "SELECT * FROM City Where StateId = @StateId";
            con = new SqlConnection(cs);
            using (SqlCommand cmd = new SqlCommand(query, con))
            {

                cmd.Parameters.AddWithValue("@StateId", StateId);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                DdCity.DataSource = dr;
                DdCity.DataTextField = "Name";
                DdCity.DataValueField = "Id";
                DdCity.DataBind();

                DdCity.Items.Insert(0, new ListItem("Select City", "0"));
            }
        }
      
        //protected void DdCity_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int cityId = Convert.ToInt32(DdCity.SelectedValue);
            
        //}

        private void GridViewBind(int cityId)
        {
            string query = "SELECT * From Showroom Where CityId = @CityId";
            con = new SqlConnection(cs);
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@CityId", cityId);                
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        GV_ShowRoom.DataSource = dt;
                        GV_ShowRoom.DataBind();
                    }
                    else
                    {
                        //Response.Write("<script>('There is not any showroom in this city.');</script>");
                        lblMsg.Text = "There is not any showroom in this city.";
                        lblMsg.Visible = true;
                        lblMsg.ForeColor = Color.Red;
                    }
                   
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message); 
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int cityId = Convert.ToInt32(DdCity.SelectedValue);
            GridViewBind(cityId);
        }

        protected void GV_ShowRoom_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GV_ShowRoom.PageIndex = e.NewPageIndex;
            int cityId = Convert.ToInt32(DdCity.SelectedValue);
            GridViewBind(cityId);
        }
    }
}