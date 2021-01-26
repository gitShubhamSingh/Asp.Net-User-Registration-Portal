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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie cookie1 = new HttpCookie("checkCookie");
                cookie1 = Request.Cookies["cucetExam"];
                /*string guid;*/
                Panel1.Visible = false;
                if (cookie1 != null)
                {
                    Response.Redirect("~/Home.aspx");
                }
                else if (!IsPasswordResetLinkIsValid())
                {
                    lblStatus.Text = "YourPasswordResetLinkIsInvalid.PleaseGenerateAnotherOne";
                    tbNewPassword.Enabled = false;
                    tbConfirmPassword.Enabled = false;
                    btnChange.Enabled = false;
                }
            }
        }

        private bool ExecuteSP(string spName,List<SqlParameter> spParameter)
        {
            string cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
            using(SqlConnection con=new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(spName, con);
                cmd.CommandType = CommandType.StoredProcedure;
                
                foreach(SqlParameter parameters in spParameter)
                {
                    cmd.Parameters.Add(parameters);

                }
                con.Open();
                return Convert.ToBoolean(cmd.ExecuteScalar());
            }
        }

        private bool IsPasswordResetLinkIsValid()
        {
            List<SqlParameter> paraList = new List<SqlParameter>()
            {
                new SqlParameter()
                {
                    ParameterName = "@Guid",
                    Value = Request.QueryString["uid"]
                }
            };
            return ExecuteSP("spCheckGuid", paraList);
        }

        private bool changePassword()
        {
            List<SqlParameter> paraList1 = new List<SqlParameter>()
            {
                new SqlParameter()
                {
                    ParameterName = "@Guid",
                    Value = Request.QueryString["uid"]
                },
                new SqlParameter()
                {
                    ParameterName = "@Password",
                    Value = FormsAuthentication.HashPasswordForStoringInConfigFile(tbConfirmPassword.Text,"SHA1")
                }
            };
            return ExecuteSP("spChangePasword", paraList1);
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            if(changePassword())
            {
                lblStatus.Text = "YourPasswordIsSuccessFullyChanged<br>";
                tbNewPassword.Enabled = false;
                tbConfirmPassword.Enabled = false;
                Panel1.Visible = true;
             
            }
            else
            {
                lblStatus.Text = "SomethingHappensVeryBadlyWeAreFixingThisProblemSorryForInconvinience.";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Anonymous/Login.aspx");
        }
    }
}