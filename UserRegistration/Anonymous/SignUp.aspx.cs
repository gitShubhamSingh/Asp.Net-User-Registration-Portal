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
    public partial class SignUp : System.Web.UI.Page
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
            if(!IsPostBack)
            {
                tbFirstName.Text = String.Empty;
                tbLastName.Text = String.Empty;
                tbEmail.Text = String.Empty;
                tbMobile.Text = String.Empty;
                tbPassword.Text = String.Empty;
                tbConfirmPassword.Text = String.Empty;
               
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            regUser(tbFirstName.Text,tbLastName.Text,CalenderUserControl1.slectedDate,rblProgram.SelectedValue.ToString(),tbEmail.Text,(tbMobile.Text).Trim(),(tbPassword.Text).Trim());
       
           
        }

        private void regUser(string FName,string LName,string dob,string program,string Email,string Mobile,string Password)
        {
          try { 
                string EncryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(Password, "SHA1");
               SqlConnection con = new SqlConnection(cs);
                SqlParameter paraFName = new SqlParameter("@FName", FName);
                SqlParameter paraLName = new SqlParameter("@LName", LName);
                SqlParameter paraDOB = new SqlParameter("@DOB", dob);
                SqlParameter paraProgram = new SqlParameter("@Program", program);
                SqlParameter paraEmail = new SqlParameter("@Email", Email);
                SqlParameter paraMbile = new SqlParameter("@Mobile", Mobile);
                SqlParameter paraPassword = new SqlParameter("@Password", EncryptedPassword);
                SqlCommand cmd = new SqlCommand("spRegister",con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(paraFName);
                cmd.Parameters.Add(paraLName);
                cmd.Parameters.Add(paraDOB);
                cmd.Parameters.Add(paraProgram);
                cmd.Parameters.Add(paraEmail);
                cmd.Parameters.Add(paraMbile);
                cmd.Parameters.Add(paraPassword);
                con.Open();
                int check = (int)cmd.ExecuteScalar();
                con.Close();
                if (check == 1)
                {
                    tbConfirmPassword.Enabled = false;
                    tbEmail.Enabled = false;
                    tbFirstName.Enabled = false;
                    tbLastName.Enabled = false;
                    rblProgram.Enabled = false;
                    tbMobile.Enabled = false;
                    tbPassword.Enabled = false;
                    lblResult.Text = "You Are Successfully Register Please Click On Login Comlete Your Registration Proccess";

                }
                else
                {
                    lblResult.Text = "Email or MobileNumber Is Allready Registered Please Try another one";
                }
            }
            catch(Exception ex)
            {
               
               lblResult.Text = "An Exception Occures. Registration Failed...!<br/>"+ex.Message;
            }
        }

        protected void tbDateOfBirth_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void lnkbtnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Anonymous/Login.aspx");
        }

        protected void lnkbtnSignUp_Click(object sender, EventArgs e)
        {

        }   
    }
}