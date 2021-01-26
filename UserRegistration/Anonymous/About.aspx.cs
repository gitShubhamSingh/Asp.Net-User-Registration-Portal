using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserRegistration.Anonymous
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie1 = new HttpCookie("checkCookie");
            cookie1 = Request.Cookies["cucetExam"];
            if (cookie1 != null)
            {
                Response.Redirect("~/Home.aspx");
            }
        }
    }
}