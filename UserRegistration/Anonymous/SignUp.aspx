<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="UserRegistration.Anonymous.SignUp" %>

<%@ Register src="../UsrControl/CalenderUserControl.ascx" tagname="CalenderUserControl" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp</title>
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
     <script src="../Bootstrap/js/bootstrap.min.js"></script>
     <script src="../jquery/jquery-3.3.1.js"></script>
       <style>
        *{
            margin:0;
            padding:0;
            font-family:'Segoe UI';
        }
        #nav{
            width:100%;
           padding-top:50px;
           padding-bottom:50px;
           text-align:center;
        }
        #menu{
            list-style-type:none;
        }
        #menu li{
            display:inline;

        }
            #menu li a {
                text-decoration:none;
                padding-left:20px;
                padding-right:20px;
            }
            table tr td{
                padding-left:10px;
                padding-right:10px;
                padding-top:5px;
                padding-bottom:5px;
            }
            #btnSignUp{
                padding:5px 10px 5px 10px;
            }
            input{
                padding-top:2px;
                padding-bottom:2px;
                padding-left:10px;
                padding-right:10px;
            }
            #Calender1{
                position:relative;
            }
            #lnkbtnLogin{color:#BDC3C7;font-size:25px;padding:10px 10px;letter-spacing:2px;}
            #lnkbtnSignUp{color:#FF5733;font-size:25px;padding:10px 10px;letter-spacing:2px;}	
		#lnkbtnLogin:hover{color:#45B39D;transition:0.5s all;text-decoration:none;}
        #lnkbtnSignUp:hover{color:#FF5733;transition:0.5s all;text-decoration:none;}
        #btnSignUp{background-color:#FF5733;padding:10px 30px;color:#fff;letter-spacing:2px;transition:0.5s all;}
        #btnSignUp:hover{text-decoration:none;transition:0.5s all;box-shadow:5px 10px 10px #000;}
        #tbFirstName,#tbLastName,#tbMobile,#tbEmail,#tbPassword,#tbConfirmPassword,#tbMobile{
                border-top:0px;
                border-left:0px;
                border-right:0px;
                border-bottom:1px solid black;
                padding-bottom:5px;
            }
         #tbFirstName:focus,#tbLastName:focus,#tbMobile:focus,#tbEmail:focus,#tbPassword:focus,#tbConfirmPassword:focus,#tbMobile:focus{outline:none;}
               
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <%--<div id="nav">
            <ul id="menu">
                <li><a href="Login.aspx">Login</a></li>
                <li><a href="SignUp.aspx">SignUp</a></li>
                <li><a href="ForgetPassword.aspx">ForgetPassword</a></li>
                <li><a href="About.aspx">About</a></li>
            </ul>
        </div>--%>
   
  <div class="container-fluid">
            <div class="row" style="width:100%;">
               <div class="col-sm-7 text-center">
			        <div style="background-color:#FF5733;padding-top:12%;padding-bottom:19%;margin-left:-12px;border-bottom-right-radius:450px;">
				        <img src="../Bootstrap/images/m-bg1.png" class=" rounded-circle img-fluid"></img>
			        </div>
		        </div>
                <div class="col-sm-5 text-center"style="margin-top:40px;">
        
           <center>
                <table>
				            <tr>
				                <td>
					                <asp:LinkButton ID="lnkbtnLogin" runat="server" OnClick="lnkbtnLogin_Click">LOGIN</asp:LinkButton>
				                </td>
				                <td>
					               <asp:LinkButton ID="lnkbtnSignUp" runat="server" OnClick="lnkbtnSignUp_Click">REGISTER</asp:LinkButton>
				                </td>
				            </tr>
			            </table>
                        <br /><br />
               <table>
                   <tr>
                       <td style="vertical-align:top">
                      <asp:TextBox ID="tbFirstName" runat="server" placeholder="First Name"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="tbFirstName" ErrorMessage="<b>*</b>" ValidationGroup="grpSignUp" ForeColor="Red"></asp:RequiredFieldValidator></td>
                   </tr>
                   <tr>
                       <td style="vertical-align:top"><asp:TextBox ID="tbLastName" runat="server" placeholder="Last Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbLastName" ErrorMessage="<b>*</b>" ValidationGroup="grpSignUp" ForeColor="Red" ></asp:RequiredFieldValidator></td>
                   </tr>
                   <tr>
                       <td style="vertical-align:top;padding-top:10px;">               
                       
                           <uc1:CalenderUserControl ID="CalenderUserControl1" runat="server" />
                       </td>
                       
                   </tr>
                   <tr>
                       <td style="vertical-align:top"><asp:RadioButtonList ID="rblProgram" runat="server">
                           <asp:ListItem Value="UG">&nbsp;UG-UnderGraduate</asp:ListItem>
                           <asp:ListItem Value="PG">&nbsp;PG-PostGraduate</asp:ListItem>
                           </asp:RadioButtonList>
                           <asp:RequiredFieldValidator ID="rfvProgram" runat="server" ControlToValidate="rblProgram" ErrorMessage="<b>PleaseSelectAnyProgram</b>" ValidationGroup="grpSignUp" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>
                   </tr>
                   <tr>
                       <td style="vertical-align:top"><asp:TextBox ID="tbEmail" runat="server" placeholder="Email"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbEmail" ErrorMessage="<b>*</b>" ValidationGroup="grpSignUp" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="EmailIsNotValid" ControlToValidate="tbEmail" ValidationGroup="grpSignUp" ForeColor="Red" Font-Bold="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                       </td>
                   </tr>
                   <tr>
                       <td style="vertical-align:top"><asp:TextBox ID="tbMobile" runat="server" placeholder="Mobile"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbMobile" ErrorMessage="<b>*</b>" ValidationGroup="grpSignUp" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="tbMobile" ForeColor="Red" ValidationGroup="grpSignUp" ValidationExpression="[0-9]{10}" ErrorMessage="MobileNumberIsNotValid" Font-Bold="true" Display="Dynamic"></asp:RegularExpressionValidator>
                       </td>
                   </tr>
                   <tr>
                       <td style="vertical-align:top"><asp:TextBox ID="tbPassword" runat="server" TextMode="Password" PlaceHolder="password"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbPassword" ErrorMessage="<b>*</b>" ValidationGroup="grpSignUp" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>
                   </tr>
                   <tr>
                       <td style="vertical-align:top"><asp:TextBox ID="tbConfirmPassword" runat="server" TextMode="Password" placeholder="confirmpassword"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbConfirmPassword" ErrorMessage="<b>*</b>" ValidationGroup="grpSignUp" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                           <asp:CompareValidator ID="cmpPassword" runat="server" ControlToValidate="tbConfirmPassword" ControlToCompare="tbPassword" ErrorMessage="PasswordIsNotSame" Font-Bold="true" ForeColor="Red" ValidationGroup="grpSignUp" Display="Dynamic"></asp:CompareValidator>
                       </td>
                   </tr>
                   <tr>
                       <td><br />
                           <asp:LinkButton ID="btnSignUp" runat="server" ValidationGroup="grpSignUp" OnClick="btnSignUp_Click">SignUp</asp:LinkButton>
                       </td>
                   </tr>
               </table>
               <br /><br />
               <asp:Label ID="lblResult" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:Label>
           </center>      
        
         </div>
             </div>
        </div>
        

   
    </form>
</body>
</html>
