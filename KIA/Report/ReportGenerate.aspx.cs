using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KIA.Report
{
    public partial class ReportGenerate : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["KIA"].ConnectionString;
        SqlConnection con = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            //    ReportViewer1.LocalReport.LoadReportDefinition(new FileStream("C:\\Users\\Saurabh\\source\\repos\\KIA Automobile Management System\\KIA\\Report\\report.rdlc", FileMode.Open));
            //}
            //catch (Exception ex)
            //{
            //    Console.WriteLine(ex.ToString());
            //}

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int orderId = Convert.ToInt32(txtId.Text);
            ReportViewer(orderId);
        }

        private void ReportViewer(int OrderId)
        {
            string query = "SELECT Orders.Id As Order_Id,Orders.Name As Name ,Contact_No,Delivery_Date,PinCode,Address,TopSpeed,Total,Date,Car.Name As Car_Name,EngineType,Price,SeatingCapacity,FuelEfficiency,FuelType,Colour,CarId FROM Orders INNER JOIN Car ON Orders.CarId = Car.Id where Orders.Id = @Id";
            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Id", OrderId);
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet1 ds = new DataSet1();
                da.Fill(ds, "DataTable_Invoice"); 

                ReportDataSource dataSource = new ReportDataSource("DataSet_Report", ds.Tables[0]);

                this.ReportViewer1.LocalReport.DataSources.Clear();
                this.ReportViewer1.LocalReport.DataSources.Add(dataSource);
                this.ReportViewer1.LocalReport.Refresh();
            }
        }
    }
}