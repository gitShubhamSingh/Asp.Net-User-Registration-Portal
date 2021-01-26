using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

namespace UserRegistration.Anonymous
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie1 = new HttpCookie("checkCookie");
            cookie1 = Request.Cookies["cucetExam"];
            if(cookie1 != null)
            {
                Response.Redirect("~/Home.aspx");
            }
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string EncryptedPasword = FormsAuthentication.HashPasswordForStoringInConfigFile((tbPassword.Text).Trim(),"SHA1");
            try { 
                 using(SqlConnection con = new SqlConnection(cs))
                 {

                     SqlCommand cmd = new SqlCommand("spLogin",con);
                     cmd.CommandType = CommandType.StoredProcedure;

                     SqlParameter paraEmail = new SqlParameter("@Email", (tbEmail.Text).Trim());
                     SqlParameter paraPassword = new SqlParameter("@Password", EncryptedPasword);

                     cmd.Parameters.Add(paraEmail);
                     cmd.Parameters.Add(paraPassword);
                     con.Open();
                     int check = (int)cmd.ExecuteScalar();
                     if(check == 0)
                       {
                          lblStatus.Text = "Invalid Credentials.....!";
                       }
                       else
                       {
                           lblStatus.Text = "You are Successfully Login and Will be Redirected on HomePage. ThankYou.";
                           HttpCookie myCookie = new HttpCookie("UserInfo");
                           myCookie["Email"] = tbEmail.Text;
                           Response.Cookies.Add(myCookie);
                           FormsAuthentication.RedirectFromLoginPage(tbEmail.Text,chkRemember.Checked);
                       }
                   }
                }
            catch(Exception ex)
            {
                lblStatus.Text = ex.Message;
            }
        }

        protected void lnkbtnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Anonymous/SignUp.aspx");
        }

        protected void lnkbtnLogin_Click(object sender, EventArgs e)
        {

        }

        protected void lnkbtnForgetPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Anonymous/ForgetPassword.aspx");
        }
    }
}