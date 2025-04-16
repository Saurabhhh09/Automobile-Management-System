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
    public partial class WebForm5 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrderGridView();
            }
    
        }

        private void BindOrderGridView()
        {
            string query = "Select * From Orders";
            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(query, con);
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GV_OrderDetails.DataSource = dt; 
                GV_OrderDetails.DataBind();

            }
            catch(Exception ex) 
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