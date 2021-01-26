using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace UserRegistration
{
    public partial class FormPreview : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie mycookie = Request.Cookies["UserInfo"];
            if(mycookie != null)
            {
               if (!checkStatus(mycookie["Email"]))
               {
                   Response.Redirect("~/Home.aspx");
               }
               else
               {
                   //calling of retrievedata method
                   retrieveInfo(mycookie["Email"]);
               }

            }    
        }

        private void retrieveInfo(string Email)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spPriview2",con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter paraEmail = new SqlParameter("@Email", Email);
            cmd.Parameters.Add(paraEmail);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while(rdr.Read())
            { 
                lblUserId.Text = rdr["returnUserId"].ToString();
                imgPhoto.ImageUrl = "~/Photo/" + rdr["returnUserId"].ToString() + rdr["photo"].ToString();
                imgSign.ImageUrl = "~/Sign/"+rdr["returnUserId"].ToString()+rdr["sign"].ToString();
                lblName.Text = rdr["firstname"].ToString() + "&nbsp;" + rdr["lastname"].ToString();
                lblFullName.Text = rdr["firstname"].ToString() + "&nbsp;" + rdr["lastname"].ToString();
                lblDateOfBirth.Text = rdr["dob"].ToString();
                lblStream.Text = rdr["program"].ToString();
                lblProgram.Text = rdr["programcode"].ToString();
                lblMobile.Text = rdr["mobile"].ToString();
                lblEmail.Text = Email;
                lblExamCity.Text = rdr["examcity"].ToString();
                lblRollNoMatric.Text = rdr["rollnomatric"].ToString();
                lblRollNoInter.Text = rdr["rollnointer"].ToString();
                lblRollNoGraduation.Text = rdr["rollnograduation"].ToString();
                lblBUMatric.Text = rdr["bumatric"].ToString();
                lblSCMatric.Text = rdr["scmatric"].ToString();
                lblSubjectsMatric.Text = rdr["submatric"].ToString();
                lblYearMatric.Text = rdr["yearmatric"].ToString();
                lblPercentageMatric.Text = rdr["permatric"].ToString();
                lblBUInter.Text = rdr["buinter"].ToString();
                lblSCInter.Text = rdr["scinter"].ToString();
                lblSubjectsInter.Text = rdr["subinter"].ToString();
                lblYearInter.Text = rdr["yearinter"].ToString();
                lblPercentageInter.Text = rdr["perinter"].ToString();
                lblBUGraduation.Text = rdr["bugraduation"].ToString();
                lblSCGraduation.Text = rdr["scgraduation"].ToString();
                lblSubjectsGraduation.Text = rdr["subgraduation"].ToString();
                lblYearGraduation.Text = rdr["yeargraduation"].ToString();
                lblPercentageGraduation.Text = rdr["pergraduation"].ToString();
            }
            con.Close();
        }

        private bool checkStatus(string Email)
        {
            bool BOOL;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spPriview",con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter paraEmail = new SqlParameter("@Email", Email);
            cmd.Parameters.Add(paraEmail);
            con.Open();
            int check = (int)cmd.ExecuteScalar();
            con.Close();
            if(check == 1)
            {
                BOOL = true;
            }else
            {
                BOOL = false;
            }
            return BOOL;

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            HttpCookie myCookie = new HttpCookie("UserInfo");
            myCookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(myCookie);
            Session.Clear();
            Session.Abandon();
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }
    }
}