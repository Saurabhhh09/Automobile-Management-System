using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;

namespace KIA
{
    public partial class Invoice : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            //int userId = Convert.ToInt32(Request.Cookies["User"]?.Value);
            int OrderId = Convert.ToInt32(Request.QueryString["OrderId"]);
            if (OrderId != 0)
            {
                BindData(OrderId);
                //CarDetailsView.DataSource = CarDetails(carId);
                //CarDetailsView.DataBind();
                //UserDetailView.DataSource = UserDetails(userId);   
                //UserDetailView.DataBind();
            }
        }

        private void BindData(int orderId)
        {

            string query = "Select * From Orders Where Id = @orderId";
            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@orderId", orderId);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    int CarId;

                    while (dr.Read())
                    {
                        CarId = Convert.ToInt32(dr["CarId"].ToString());
                        BindCarDetail(CarId);
                        bindPrice(CarId);
                    }
                    BindUser(orderId);


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

        private void bindPrice(int carId)
        {
            string PriceQuery = "Select * from Car Where Id = @carId";
            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(PriceQuery, con);
            cmd.Parameters.AddWithValue("@carId", carId);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        decimal price = Convert.ToDecimal(dr["Price"]);
                        lblPrice.Text = price.ToString();
                        decimal total_Price = price + (price * 28 / 100);
                        lblAmount.Text = total_Price.ToString();
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                con.Close();
            }
        }

        private void BindUser(int orderId)
        {
            string query = "Select * From Orders Where Id = @orderId";
            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@orderId", orderId);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                UserDetailView.DataSource = dr;
                UserDetailView.DataBind();


            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());

            }
            finally
            {
                con.Close();
            }
        }

        private void BindCarDetail(int carId)
        {
            string query = "Select * From Car Where Id = @carId";

            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@carId", carId);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                CarDetailsView.DataSource = dr;
                CarDetailsView.DataBind();


            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());

            }
            finally
            {
                con.Close();
            }

        }

        
        protected void BtnInvoice_Click(object sender, EventArgs e)
        {
            // Get HTML content to render (modify based on your page)
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
            this.form1.RenderControl(htmlWriter);

            string htmlContent = stringWriter.ToString();

            // Convert HTML to PDF
            using (MemoryStream stream = new MemoryStream())
            {
                Document pdfDoc = new Document(PageSize.A4,50,50,50,50);
                PdfWriter writer = PdfWriter.GetInstance(pdfDoc, stream);

                pdfDoc.Open();

                // Use iTextSharp HTMLWorker for rendering HTML
                using (StringReader sr = new StringReader(htmlContent))
                {
                    //iTextSharp.text.html.simpleparser.HTMLWorker htmlParser = new iTextSharp.text.html.simpleparser.HTMLWorker(pdfDoc);
                    //htmlParser.Parse(sr);

                    XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                }

                pdfDoc.Close();

                // Send PDF as response
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=Invoice.pdf");
                Response.BinaryWrite(stream.ToArray());
                
                Response.End();
            }
        }
    }
}