<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="UserRegistration.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <style>
        *{
            font-family:'Segoe UI Historic'
        }
        table tr td{
            padding:5px;
        }
        table.tblImage tr td{
            border:0px;
        }
    </style>
    <script src="jquery/jquery-3.3.1.js"></script>
       <script>
           function showPreview(input) {
               if (input.files && input.files[0]) {
                   var ImageDir = new FileReader();
                   ImageDir.onload = function (e) {
                       $('#imgPrev').attr('src', e.target.result);
                   }
                   ImageDir.readAsDataURL(input.files[0]);
               }
           }
           function showPreview2(input) {
               if (input.files && input.files[0]) {
                   var ImageDir = new FileReader();
                   ImageDir.onload = function (e) {
                       $('#imgSign').attr('src', e.target.result);
                   }
                   ImageDir.readAsDataURL(input.files[0]);
               }
           }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <h1>Welcome :- </h1><asp:Label ID="lblName" runat="server" Text="Name" Font-Size="Large"></asp:Label><br />
            UserId :- <asp:Label ID="lblUserId" runat="server"></asp:Label><br />
            <asp:Button ID="btnLogout" runat="server" Text="LogOut" OnClick="btnLogout_Click" Height="26px" />
            <br />
        
            <br />
        
            <table>
            <tr>
                <td><asp:Label ID="lbl1" runat="server" Text="Name : "></asp:Label></td>
                <td><asp:Label ID="lblName1" runat="server" Text="Name"></asp:Label></td>
                <td><asp:Label ID="lbl2" runat="server" Text="Email : "></asp:Label></td>
                <td><asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label></td>
                <td><asp:Label ID="lbl3" runat="server" Text="DateOfBirth : "></asp:Label></td>
                <td><asp:Label ID="lblDateOfBirth" runat="server" Text="DOB"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lbl4" runat="server" Text="Program : "></asp:Label></td>
                <td><asp:Label ID="lblProgram" runat="server" Text="Program"></asp:Label></td>
                <td><asp:Label ID="lbl5" runat="server" Text="Contact : "></asp:Label></td>
                <td colspan="2"><asp:Label ID="lblMobile" runat="server" Text="Mobile"></asp:Label></td>
            </tr>
        </table>
            <br />
            <asp:Label ID="lblMatricInfo" runat="server" Text="YourMatriculationDataIsSaved" Font-Size="XX-Large" Visible="False" ForeColor="#009900"></asp:Label>
            <table id="tblMatric" runat="server">
                <tr>
                    <th>Matriculation (10th)</th>
                </tr>
                <tr>
                    <td>Roll No./Registration No. : </td>
                    <td><asp:TextBox ID="tbRollNoMatriculation" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="tbRollNoMatriculation" ValidationGroup="grp1" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>SubjectOfExamination : </td>
                    <td><asp:TextBox ID="tbSubjectMatriculation" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="tbSubjectMatriculation" ValidationGroup="grp1" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>School/CollegeName : </td>
                    <td><asp:TextBox ID="tbSchoolCollegeMatriculation" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="tbSchoolCollegeMatriculation" ValidationGroup="grp1" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>Board/UniversityName : </td>
                    <td><asp:TextBox ID="tbBoardMatriculation" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="tbBoardMatriculation" ValidationGroup="grp1" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>YearOfPassing : </td>
                    <td><asp:DropDownList ID="ddlYearOfPassingMatriculation" runat="server">
                        <asp:ListItem Selected="True">Select</asp:ListItem>
                            <asp:ListItem>2005</asp:ListItem>
                        <asp:ListItem>2006</asp:ListItem>
                        <asp:ListItem>2007</asp:ListItem>
                        <asp:ListItem>2008</asp:ListItem>
                        <asp:ListItem>2009</asp:ListItem>
                        <asp:ListItem>2010</asp:ListItem>
                        <asp:ListItem>2011</asp:ListItem>
                        <asp:ListItem>2012</asp:ListItem>
                        <asp:ListItem>2013</asp:ListItem>
                        <asp:ListItem>2014</asp:ListItem>
                        <asp:ListItem>2015</asp:ListItem>
                        </asp:DropDownList>
                       </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvddlMatriculationYear" runat="server" ControlToValidate="ddlYearOfPassingMatriculation" InitialValue="Select" ValidationGroup="grp1" ErrorMessage="*" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>%OfMarks</td>
                    <td><asp:TextBox ID="tbPercentageMatriculation" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="tbPercentageMatriculation" ValidationGroup="grp1" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
            </table>
            <br />
            <asp:Label ID="lblIntermediateInfo" runat="server" Text="IntermedateDataIsSaved" Font-Size="XX-Large" Visible="False" ForeColor="#009900"></asp:Label>
            <table id="tblIntermediate" runat="server">
                <tr>
                    <th>InterMediate (10+2 th)</th>
                </tr>
                <tr>
                    <td>Roll No./Registration No. : </td>
                    <td><asp:TextBox ID="tbRollNoInterMediate" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="tbRollNoInterMediate" ValidationGroup="grp1" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>SubjectOfExamination : </td>
                    <td><asp:TextBox ID="tbSubjectInterMediate" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="tbSubjectInterMediate" ValidationGroup="grp1" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>School/CollegeName : </td>
                    <td><asp:TextBox ID="tbSchoolCollegeInterMediate" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="tbSchoolCollegeInterMediate" ValidationGroup="grp1" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>Board/UniversityName : </td>
                    <td><asp:TextBox ID="tbBoardInterMediate" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="tbBoardInterMediate" ValidationGroup="grp1" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>YearOfPassing : </td>
                    <td><asp:DropDownList ID="ddlYearOfPassingInterMediate" runat="server">
                        <asp:ListItem Selected="True">Select</asp:ListItem>
                            <asp:ListItem>2005</asp:ListItem>
                        <asp:ListItem>2006</asp:ListItem>
                        <asp:ListItem>2007</asp:ListItem>
                        <asp:ListItem>2008</asp:ListItem>
                        <asp:ListItem>2009</asp:ListItem>
                        <asp:ListItem>2010</asp:ListItem>
                        <asp:ListItem>2011</asp:ListItem>
                        <asp:ListItem>2012</asp:ListItem>
                        <asp:ListItem>2013</asp:ListItem>
                        <asp:ListItem>2014</asp:ListItem>
                        <asp:ListItem>2015</asp:ListItem>
                        </asp:DropDownList>
                       </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvddlIntermediateYear" runat="server" ControlToValidate="ddlYearOfPassingIntermediate" InitialValue="Select" ValidationGroup="grp1" ErrorMessage="*" ForeColor="Red" FontBold="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>%OfMarks</td>
                    <td><asp:TextBox ID="tbPercentageOfMarksInterMediate" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="tbPercentageOfMarksInterMediate" ValidationGroup="grp1" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
            </table>
            <br />
            <asp:Label ID="lblGraduationInfo" runat="server" Text="GraduationDataIsSaved" Font-Size="XX-Large" Visible="False" ForeColor="#009900"></asp:Label>
            <table id="tblGraduation" runat="server">
                <tr>
                   <th>Graduation</th>
                </tr>
                <tr>
                    <td>Roll No./Registration No. : </td>
                    <td><asp:TextBox ID="tbRollNoGraduation" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="tbRollNoGraduation" ValidationGroup="grp1" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>SubjectOfExamination : </td>
                    <td><asp:TextBox ID="tbSubjectOfGraduation" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ControlToValidate="tbSubjectOfGraduation" ValidationGroup="grp1" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>School/CollegeName : </td>
                    <td><asp:TextBox ID="tbSchoolCollegeGraduation" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ControlToValidate="tbSchoolCollegeGraduation" ValidationGroup="grp1" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>Board/UniversityName : </td>
                    <td><asp:TextBox ID="tbBoardUniversityGraduation" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="tbBoardUniversityGraduation" ValidationGroup="grp1" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>YearOfPassing : </td>
                    <td><asp:DropDownList ID="ddlYearOfPassingGraduation" runat="server">
                        <asp:ListItem Selected="True">Select</asp:ListItem>
                            <asp:ListItem>2005</asp:ListItem>
                        <asp:ListItem>2006</asp:ListItem>
                        <asp:ListItem>2007</asp:ListItem>
                        <asp:ListItem>2008</asp:ListItem>
                        <asp:ListItem>2009</asp:ListItem>
                        <asp:ListItem>2010</asp:ListItem>
                        <asp:ListItem>2011</asp:ListItem>
                        <asp:ListItem>2012</asp:ListItem>
                        <asp:ListItem>2013</asp:ListItem>
                        <asp:ListItem>2014</asp:ListItem>
                        <asp:ListItem>2015</asp:ListItem>
                        </asp:DropDownList>
                       </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvddlGraduationYear" runat="server" ControlToValidate="ddlYearOfPassingGraduation" InitialValue="Select" ValidationGroup="grp1" ErrorMessage="*" ForeColor="Red" FontBold="true"></asp:RequiredFieldValidator> 
                    </td>
                </tr>
                <tr>
                    <td>%OfMarks</td>
                    <td><asp:TextBox ID="tbPercentageOfMarksGraduation" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="tbPercentageOfMarksGraduation" ValidationGroup="grp1" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
            </table>
            
            <br />
            <asp:Button ID="btnSave" runat="server" Text="Save & Next" OnClick="btnSave_Click" ValidationGroup="grp1" />
            <br />
            <br />
            <h1>Note: </h1><h4>Final Print Of Your Saved Data is Available on After Payment. Thank You</h4>
            <br />
            <br />
            <table id="tblProgram" runat="server" visible="false">
                <tr>
                    <td><asp:Label ID="lblProgramOffered" runat="server" Text="ProgramWeOffered : "></asp:Label></td>
                    <td><asp:DropDownList ID="ddlProgram" runat="server" DataSourceID="SqlDataSourceProgram" DataTextField="ProgramName" DataValueField="ProgramName">
                        <asp:ListItem Selected="True">Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceProgram" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>" OnSelecting="SqlDataSourceProgram_Selecting" SelectCommand="SELECT [ProgramName] FROM [tblProgram] WHERE ([ProgramStream] = @ProgramStream)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblProgram" DefaultValue="" Name="ProgramStream" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td><asp:Label ID="lblErrorProgram" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label></td>
                </tr>
                <tr><td>
                    <asp:Label ID="lblExamCity" runat="server" Text="ExamCity : "></asp:Label>
                </td>
                    <td>
                        <asp:DropDownList ID="ddlExamCity" runat="server"></asp:DropDownList>
                        <br />
                    </td>
                </tr>
            </table>
            <br />
            
            <table id="tblImageSection" runat="server" visible="false" class="tblImage">
                <tr>
                    <td><asp:Label ID="lblPhoto" runat="server" Text="LatestPhoto : (* should be less then 150kb)"></asp:Label></td>
                    <td><asp:Image ID="imgPrev" runat="server" Width="150px" Height="150px" BorderWidth="1px" /><br />
                        <%--<input type="file" id="ImageUpload" name="ImageUpload" onchange="showPreview(this)" style="width:90px" />--%>
                        <asp:FileUpload ID="ImageUpload" runat="server" onchange="showPreview(this)" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvImage" runat="server" ControlToValidate="ImageUpload" ErrorMessage="*" ForeColor="Red" Font-Bold="true" Font-Size="Large" ValidationGroup="grpSaveImage"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblSign" runat="server" Text="Signature(* should be less then 50kb)"></asp:Label></td>
                    <td><asp:Image ID="imgSign" runat="server" Height="80px" Width="150px" BorderWidth="1px"/><br />
                        <asp:FileUpload ID="ImageUpload2" runat="server" onchange="showPreview2(this)" />
                    </td>
                    <td><asp:RequiredFieldValidator ID="rfvSign" runat="server" ControlToValidate="ImageUpload2" ErrorMessage="*" Font-Bold="true" ForeColor="Red" Font-Size="Large" ValidationGroup="grpSaveImage"></asp:RequiredFieldValidator></td>
                </tr>
            </table>

            <br />
           
            <asp:Label ID="lblStatus2" runat="server" Font-Size="XX-Large" Visible="False" Text="Program is Saved <br>Photo is Saved<br>Signature Is Saved" ForeColor="#009933"></asp:Label><br />
            <br /><asp:Button ID="btnSaveImages" runat="server" Text="SavePhotoAndSignProgram" Visible="false" ValidationGroup="grpSaveImage" OnClick="btnSaveImages_Click" />
            <br />
            <br />
            <asp:Label ID="lblStatus" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:Label>
            <br /><br /> 
            
        </center>
    </div>
    </form>
</body>
</html>
