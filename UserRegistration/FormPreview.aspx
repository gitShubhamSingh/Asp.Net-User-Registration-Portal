<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormPreview.aspx.cs" Inherits="UserRegistration.FormPreview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FormPreview</title>
    <style>
        *{
            font-family:'Segoe UI';
        }
        #tblPersonalDetail tr td{
            padding-top:5px;
            padding-left:10px;
            padding-bottom:5px;
            padding-right:10px;
        }
        #tblEducationalInfo tr td{
            padding-top:4px;
            padding-left:5px;
            padding-bottom:4px;
            padding-right:5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <h1>Welcome :- </h1><asp:Label ID="lblName" runat="server" Text="Name" Font-Size="Large"></asp:Label><br />
            <br />
            <h3>This is the final page of your registration proccess. it seems that you have completed all steps. you can print your application here</h3>
            <br /><asp:Button ID="btnLogout" runat="server" Text="LogOut" Height="26px" OnClick="btnLogout_Click" />&nbsp;&nbsp;
            <asp:Button ID="btnPrint" runat="server" Text="Print" Height="26px" OnClientClick="javascript:window.print();" />
            <br />
            <br />
            <table id="tblPersonalDetail">
                <tr>
                    
                    <td colspan="2">Aplication No./UserId :&nbsp;<asp:Label ID="lblUserId" runat="server" ForeColor="#0000CC"></asp:Label></td>
                    <td colspan="2"><asp:Image ID="imgPhoto" runat="server" Width="150px" Height="150px" /><br /><br />
                        <asp:Image ID="imgSign" runat="server" Height="70px" Width="150px" />
                    </td>
                </tr>
                <tr>
                    <td><h2>Personal Info :</h2></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lbl1" runat="server" Text="Candidate's Name : &nbsp;"></asp:Label></td>
                    <td><asp:Label ID="lblFullName" runat="server"></asp:Label></td>
                    
                    <td><asp:Label ID="lbl2" runat="server" Text="Date Of Birth :"></asp:Label></td>
                    <td><asp:Label ID="lblDateOfBirth" runat="server"></asp:Label></td>
                  </tr>
                <tr>
                    <td><asp:Label ID="lbl3" runat="server" Text="Stream : "></asp:Label></td>
                    <td><asp:Label ID="lblStream" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lbl5" runat="server" Text="Mobile :"></asp:Label></td>
                    <td><asp:Label ID="lblMobile" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lbl4" runat="server" Text="Program"></asp:Label></td>
                    <td><asp:Label ID="lblProgram" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lbl6" runat="server" Text="Email : "></asp:Label></td>
                    <td><asp:Label ID="lblEmail" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lbl7" runat="server" Text="Examination City : "></asp:Label></td>
                    <td><asp:Label ID="lblExamCity" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><h2>Educational Info : </h2></td>
                </tr>
             </table>

            <table id="tblEducationalInfo">
                <tr>
                    <td><asp:Label ID="Label1" runat="server" Text="Reg No./Roll No"></asp:Label></td>
                    <td><asp:Label id="lbl8" runat="server" Text="Qualification"></asp:Label></td>
                    <td><asp:Label ID="lbl9" runat="server" Text="Board/University"></asp:Label></td>
                    <td><asp:Label ID="lbl10" runat="server" Text="School/collegeName"></asp:Label></td>
                    <td><asp:Label ID="lbl11" runat="server" Text="Subject/s"></asp:Label></td>
                    <td><asp:Label ID="lbl12" runat="server" Text="Year"></asp:Label></td>
                    <td><asp:Label ID="lbl13" runat="server" Text="Percentage"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblRollNoMatric" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblQualificationMatric" runat="server">10th</asp:Label></td>
                    <td><asp:Label ID="lblBUMatric" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblSCMatric" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblSubjectsMatric" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblYearMatric" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblPercentageMatric" runat="server"></asp:Label></td>                
                </tr>
                <tr>
                    <td><asp:Label ID="lblRollNoInter" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblQualificationInter" runat="server">12th</asp:Label></td>
                    <td><asp:Label ID="lblBUInter" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblSCInter" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblSubjectsInter" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblYearInter" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblPercentageInter" runat="server"></asp:Label></td>                
                </tr>
                <tr>
                    <td><asp:Label ID="lblRollNoGraduation" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblQualificationGraduation" runat="server">Graduation</asp:Label></td>
                    <td><asp:Label ID="lblBUGraduation" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblSCGraduation" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblSubjectsGraduation" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblYearGraduation" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblPercentageGraduation" runat="server"></asp:Label></td>                
                </tr>
            </table>
            <br /><br />
            <p style="width:70%">Note : I hereby declare that all the particulars stated in this application form are true to the best of my knowledge and belief. I have read and understood the Board
procedures. I shall abide by the terms and conditions thereon.</p>
         </center>
    </div>
    </form>
</body>
</html>
