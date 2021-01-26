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
    public partial class Home : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie mycookie = Request.Cookies["UserInfo"];
            if(mycookie != null)
            { 
                if(!IsPostBack)
                { 
                   retrievDataonPageLoad(mycookie["Email"].ToString());
                   retrievPreview(mycookie["Email"].ToString());
                }
            }
        }
        private void retrievPreview(string email)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spPriview",con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter paraUserId = new SqlParameter("@Email",email);
            cmd.Parameters.Add(paraUserId);
            con.Open();
            int check = (int)cmd.ExecuteScalar();
            con.Close();
            if(check == 1)
            {
                Response.Redirect("~/FormPreview.aspx");
            }
        }
        private void retrievDataonPageLoad(string Email)
        {
            
            try { 
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spGetRecordOnPageLoad",con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter paraEmail = new SqlParameter("@Email", Email);
            cmd.Parameters.Add(paraEmail);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
                while(rdr.Read())
                {
                    lblName.Text = rdr["fname"].ToString() + "&nbsp;" + rdr["lname"].ToString();
                    lblName1.Text = rdr["fname"].ToString() +"&nbsp;"+ rdr["lname"].ToString();
                    lblEmail.Text = Email.ToString();
                    lblDateOfBirth.Text = rdr["dob"].ToString();
                    lblProgram.Text = rdr["program"].ToString();
                    lblMobile.Text = rdr["mobile"].ToString();
                    lblUserId.Text = rdr["userid"].ToString();
                    if(rdr["countmatriculation"].ToString() == "1")
                    {
                        tblMatric.Visible = false;
                        lblMatricInfo.Visible = true;
                        btnSave.Visible = false;
                        btnSaveImages.Visible = true;
                        tblProgram.Visible = true;
                        tblImageSection.Visible = true;


                    }
                    if(rdr["countintermediate"].ToString() == "1")
                    {
                        tblIntermediate.Visible = false;
                        lblIntermediateInfo.Visible = true;
                        btnSave.Visible = false;
                        btnSaveImages.Visible = true;
                        tblProgram.Visible = true;
                        tblImageSection.Visible = true;

                    }
                    if(rdr["countgraduation"].ToString()=="1")
                    {
                        tblGraduation.Visible = false;
                        lblGraduationInfo.Visible = true;
                        btnSave.Visible = false;
                        btnSaveImages.Visible = true;
                        tblProgram.Visible = true;
                        tblImageSection.Visible = true;

                    }
              }
             con.Close();
                 DataSet dsExamCity = new DataSet();
                 dsExamCity.ReadXml(Server.MapPath("~/xmlFiles/xmlExamCity.xml"));
                 ddlExamCity.DataTextField = "Name";
                 ddlExamCity.DataValueField = "Value";
                 ddlExamCity.DataSource = dsExamCity;
                 ddlExamCity.DataBind();
           }catch(Exception ex)
            {
                lblName1.Text = ex.Message.ToString();
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                int check1 = mthSaveGIM(1,Convert.ToInt32(lblUserId.Text),tbRollNoMatriculation.Text,tbSubjectMatriculation.Text,tbSchoolCollegeMatriculation.Text,tbBoardMatriculation.Text,ddlYearOfPassingMatriculation.SelectedValue.ToString(),tbPercentageMatriculation.Text);
                if(check1 == 1)
                {
                    tblMatric.Visible = false;
                    lblMatricInfo.Visible = true;
                    btnSave.Visible = false;
                    btnSaveImages.Visible = true;
                    tblProgram.Visible = true;
                    tblImageSection.Visible = true;
                }
                else
                {
                    lblStatus.Text = "MatriculationFieldIsNotSaved";
                }
                int check2 = mthSaveGIM(2, Convert.ToInt32(lblUserId.Text), tbRollNoInterMediate.Text, tbSubjectInterMediate.Text, tbSchoolCollegeInterMediate.Text, tbBoardInterMediate.Text, ddlYearOfPassingInterMediate.SelectedValue.ToString(), tbPercentageOfMarksInterMediate.Text);
                if (check2 == 2)
                {
                    tblIntermediate.Visible = false;
                    lblIntermediateInfo.Visible = true;
                    btnSave.Visible = false;
                    btnSaveImages.Visible = true;
                    tblProgram.Visible = true;
                    tblImageSection.Visible = true;
                }
                else
                {
                    lblStatus.Text = "InterMediateFieldIsNotSaved";
                }
                int check3 = mthSaveGIM(3, Convert.ToInt32(lblUserId.Text), tbRollNoGraduation.Text, tbSubjectOfGraduation.Text, tbSchoolCollegeGraduation.Text, tbBoardUniversityGraduation.Text, ddlYearOfPassingGraduation.SelectedValue.ToString(), tbPercentageOfMarksGraduation.Text);
                if (check3 == 3)
                {
                    tblGraduation.Visible = false;
                    lblGraduationInfo.Visible = true;
                    btnSave.Visible = false;
                    btnSaveImages.Visible = true;
                    tblProgram.Visible = true;
                    tblImageSection.Visible = true;

                }
                else
                {
                    lblStatus.Text = "GraduationDataIsNotSaved";
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.Message;
            }
        }

        private int mthSaveGIM(int InfoCode,int UserId,string RegNo,string SOE,string SC,string BU,string YOP,string Percentage)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spInsertGIM",con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter paraInfoCode = new SqlParameter("@InfoCode",InfoCode);
            SqlParameter paraUserId = new SqlParameter("@UserId",UserId);
            SqlParameter paraRegNo = new SqlParameter("@RegNo",RegNo);
            SqlParameter paraSOE = new SqlParameter("@SOE",SOE);
            SqlParameter paraSC = new SqlParameter("@SC",SC);
            SqlParameter paraBU = new SqlParameter("@BU",BU);
            SqlParameter paraYOP = new SqlParameter("@YOP",YOP);
            SqlParameter paraPercentage = new SqlParameter("@Percentage",Percentage);

            cmd.Parameters.Add(paraInfoCode);
            cmd.Parameters.Add(paraUserId);
            cmd.Parameters.Add(paraRegNo);
            cmd.Parameters.Add(paraSOE);
            cmd.Parameters.Add(paraSC);
            cmd.Parameters.Add(paraBU);
            cmd.Parameters.Add(paraYOP);
            cmd.Parameters.Add(paraPercentage);
            con.Open();
            int check = (int)cmd.ExecuteScalar();
            con.Close();
            if(check == 1)
            {
                lblStatus.Text = lblStatus.Text + "<br>MatriculationDataIsSaved";
            }
            if(check == 2)
            {
                lblStatus.Text = lblStatus.Text + "<br>InterMediateDataIsSaved";
            }
            if(check == 3)
            {
                lblStatus.Text = lblStatus.Text + "<br>GraduationDataIsSaved";
            }
            return check;
        }

        protected void SqlDataSourceProgram_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

     
        private bool saveImages(string userId)
        {
            bool Bool;
            if(ImageUpload.HasFile)
            {
                ImageUpload.SaveAs(Server.MapPath("~/Photo/" + userId + ImageUpload.FileName));
                lblStatus.Text = "Photo Is Saved";
                Bool = true;
            }else
            {
                Bool = false;
            }
            return Bool;
        }
        private bool saveSign(string userId)
        {
            bool Bool;
            if(ImageUpload2.HasFile)
            {
                ImageUpload2.SaveAs(Server.MapPath("~/Sign/" + userId + ImageUpload2.FileName));
                lblStatus.Text = "Photo Is Saved";
                Bool = true;
            }else
            {
                Bool = false;
            }
            return Bool;
        }

        private bool saveOtherInfo(int userid,string program,string photo,string sign)
        {
            bool Bool;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spSaveOtherInfo",con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter paraUserId = new SqlParameter("@UserId", userid);
            SqlParameter paraProgram = new SqlParameter("@Program", ddlProgram.SelectedItem.ToString());
            SqlParameter paraPhoto = new SqlParameter("@Photo",ImageUpload.FileName.ToString());
            SqlParameter paraSign = new SqlParameter("@Sign",ImageUpload2.FileName.ToString());
            SqlParameter paraExamCity = new SqlParameter("@ExamCity", ddlExamCity.SelectedItem.ToString());
            cmd.Parameters.Add(paraExamCity);
            cmd.Parameters.Add(paraUserId);
            cmd.Parameters.Add(paraProgram);
            cmd.Parameters.Add(paraPhoto);
            cmd.Parameters.Add(paraSign);
            con.Open();
            int check = (int)cmd.ExecuteScalar();
            con.Close();
            if(check == 1)
            {
                Bool = true;
            }
            else
            {
                Bool = false;
            }
            return Bool;
        }

        protected void btnSaveImages_Click(object sender, EventArgs e)
        {
            string photoExtension = System.IO.Path.GetExtension(ImageUpload.FileName);
            string signExtension = System.IO.Path.GetExtension(ImageUpload2.FileName);
            if(photoExtension.ToLower()!=".jpg")
            {
                Response.Write("<script>alert('Photo is not valid please select jpg file')</script>");
            }
            else
            { 
                if(saveOtherInfo(Convert.ToInt32(lblUserId.Text),ddlProgram.SelectedItem.ToString(),ImageUpload.PostedFile.FileName,ImageUpload2.PostedFile.FileName))
                {
                    tblProgram.Visible = false;
                    tblImageSection.Visible = false;
                    lblStatus2.Visible = true;
                    Response.Redirect("~/FormPreview.aspx");
                }
            }
        }
    }
}