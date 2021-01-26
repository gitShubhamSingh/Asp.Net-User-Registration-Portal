<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="UserRegistration.Anonymous.ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ForgetPassword</title>
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
        }#lnkbtnLogin,#lnkbtnSignUp{color:#BDC3C7;font-size:25px;padding:10px 10px;letter-spacing:2px;}	
		#lnkbtnLogin:hover{color:#45B39D;transition:0.5s all;text-decoration:none;}
        #lnkbtnSignUp:hover{color:#FF5733;transition:0.5s all;text-decoration:none;}
        #tbEmail{
                border-top:0px;
                border-left:0px;
                border-right:0px;
                border-bottom:1px solid black;
                padding-bottom:5px;
            }
        #tbEmail:focus{outline:none;color:#5D4037;}
        #lnkbtnSendMail{
               background-color: #5D4037;
               padding-top:10px;
               padding-bottom:10px;
               padding-right:40px;
               padding-left:40px;
               color:#fff;
               transition:0.5s all;
               letter-spacing:2px;
        }
        #lnkbtnSendMail:hover{
                background-color:#fff;
                color:#5D4037;
                border:1px solid #5D4037;
                transition:0.5s all;
                text-decoration:none;
            }
            
              table tr td{
                padding-left:10px;
                padding-right:10px;
                padding-top:5px;
                padding-bottom:5px;
            }
                input{
                padding-top:2px;
                padding-bottom:2px;
                padding-left:10px;
                padding-right:10px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row" style="width:100%;">
               <div class="col-sm-7 text-center">
			        <div style="background-color:#5D4037;padding-top:12%;padding-bottom:19%;margin-left:-12px;border-bottom-right-radius:450px;">
				        <img src="../Bootstrap/images/m-bg1.png" class=" rounded-circle img-fluid"></img>
			        </div>
		        </div>
                <div class="col-sm-5 text-center"style="margin-top:100px;">
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
			            </table><br /><br />
                        <table>
                            <tr>
                                <td><asp:TextBox ID="tbEmail" runat="server" TextMode="Email" placeholder="Email"></asp:TextBox></td>
                                <td><asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="<b>*</b>" ForeColor="Red" ValidationGroup="grpForget"></asp:RequiredFieldValidator>&nbsp;&nbsp;

                                </td>

                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Email is Incorrect...!" ForeColor="Red" Font-Bold="true" Font-Size="Large" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="tbEmail" ValidationGroup="grpForget"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:LinkButton ID="lnkbtnSendMail" runat="server"  ValidationGroup="grpForget" OnClick="btnSendMail_Click">Recover</asp:LinkButton>
                                 </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <asp:Label ID="lblStatus" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:Label>        

                    </center>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
