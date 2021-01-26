using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Net.Mail;

namespace UserRegistration.Anonymous
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie1 = new HttpCookie("checkCookie");
            cookie1 = Request.Cookies["cucetExam"];
            if (cookie1 != null)
            {
                Response.Redirect("~/Home.aspx");
            }
        }

        protected void btnSendMail_Click(object sender, EventArgs e)
        {
            try
            {
              
                     using(SqlConnection con = new SqlConnection(cs))
                     {
                        SqlCommand cmd1 = new SqlCommand("spResetPassword", con);
                        cmd1.CommandType = CommandType.StoredProcedure;

                        SqlParameter paraEmail = new SqlParameter("@Email", (tbEmail.Text).Trim());
                        cmd1.Parameters.Add(paraEmail);
                        con.Open();
                        SqlDataReader rdr = cmd1.ExecuteReader();
                        while(rdr.Read())
                          {
                              if (Convert.ToBoolean(rdr["ReturnCode"]))
                              {
                                  sendPasswordResetMail(rdr["Email"].ToString(), rdr["UniqueId"].ToString(), rdr["Name"].ToString());
                                  lblStatus.Text = "An Password Reset Link is Sent On Your Email. Check Email For Further Information";
                              }
                              else
                              {
                                  lblStatus.Text = "You are Not Registered. Register First...!";
                              }
                         }
                     }
                   
                }
                catch(Exception ex)
                {
                    lblStatus.Text = ex.Message;
                }
            
        }

      

        private void sendPasswordResetMail(string Email,string UniqueId,string Name)
        {
            MailMessage mailMassage = new MailMessage("ptcsam89@gmail.com", Email);

                StringBuilder sbMailBody = new StringBuilder();
                sbMailBody.Append("Dear " + Name + " <br/>");
                sbMailBody.Append("PleaseClick On the Following Link To reset Your Password.<br/><br/>");
                sbMailBody.Append("http://localhost:56849/Anonymous/ChangePassword.aspx?uid=" + UniqueId);
                sbMailBody.Append("<br></b/>");
                sbMailBody.Append("(c)UserRegistration");

                mailMassage.IsBodyHtml = true;
                mailMassage.Body = sbMailBody.ToString();
                mailMassage.Subject = "ForResetPassword";

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.Credentials = new System.Net.NetworkCredential()
                {
                    UserName = "ptcsam89@gmail.com",
                    Password = "912505@M5!ngh"
                };
                smtpClient.EnableSsl = true;
                smtpClient.Send(mailMassage);
               
       
        }

        protected void lnkbtnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Anonymous/Login.aspx");
        }

        protected void lnkbtnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Anonymous/SignUp.aspx");
        }
    }
}