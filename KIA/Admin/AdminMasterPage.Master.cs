using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KIA.Admin
{
    public partial class AdminMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogoutLink_Click(object sender, EventArgs e)
        {
            // Check if the cookie exists
            if (Request.Cookies["User"] != null)
            {
                // Create a new cookie with the same name
                HttpCookie cookie = new HttpCookie("User");

                // Set its expiration date to the past
                cookie.Expires = DateTime.Now.AddDays(-1);

                // Add the expired cookie to the response to delete it
                Response.Cookies.Add(cookie);
            }

            // Redirect to the login page
            Response.Redirect("/Default/SignInPage.aspx");
        }


    }
}