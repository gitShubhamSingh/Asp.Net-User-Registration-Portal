using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace UserRegistration.UsrControl
{
    public partial class CalenderUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            { 
               getYear();
               getMonth();
               panel1.Visible = false;
            }
        }

        private void getYear()
        {
            try 
            { 
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/xmlFiles/xmlYear.xml"));
                ddlYear.DataTextField = "Name";
                ddlYear.DataValueField = "Value";
                ddlYear.DataSource = ds;
                ddlYear.DataBind();
            }catch(Exception ex)
            {
                Response.Write("Something Happend YearHaveNot LoadedSuccessFully");
            }
        }

        private void getMonth()
        {
            try { 
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/xmlFiles/xmlMonth.xml"));
                ddlMonth.DataTextField = "Name";
                ddlMonth.DataValueField = "Value";
                ddlMonth.DataSource = ds;
                ddlMonth.DataBind();
            }
            catch (Exception ex)
            {
                
                Response.Write("Something Happend. MonthHaveNot LOadedSuccessFully  " + ex.Message.ToString());
            }
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = Convert.ToInt16(ddlYear.SelectedValue);
            int month = Convert.ToInt16(ddlMonth.SelectedValue);
            cld1.VisibleDate = new DateTime(year, month, 1);
        }

        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = Convert.ToInt16(ddlYear.SelectedValue);
            int month = Convert.ToInt16(ddlMonth.SelectedValue);
            cld1.VisibleDate = new DateTime(year, month, 1);
        }

        protected void cld1_SelectionChanged(object sender, EventArgs e)
        {
            tbDateOfBirth.Text = cld1.SelectedDate.ToShortDateString();
            panel1.Visible = false;
            
        }

        public string slectedDate
        {
            get
            {
                return tbDateOfBirth.Text;
            }
            set
            {
                tbDateOfBirth.Text = value;
            }
        }

        protected void btnSelectDate_Click(object sender, EventArgs e)
        {
            if(panel1.Visible)
            {
                panel1.Visible = false;
            }
            else
            {
                panel1.Visible = true;
            }
        }

      
    }
}