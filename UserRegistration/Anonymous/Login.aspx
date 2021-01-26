<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UserRegistration.Anonymous.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../Bootstrap/js/bootstrap.min.js"></script>
    <script src="../jquery/jquery-3.3.1.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI';
        }
             #btnLogin{
               background-color: #45B39D;
               padding-top:10px;
               padding-bottom:10px;
               padding-right:40px;
               padding-left:40px;
               color:#fff;
               transition:0.5s all;
               letter-spacing:2px;
            }
            #btnLogin:hover{
                background-color:#fff;
                color:#45B39D;
                border:1px solid #45B39D;
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
            #tbEmail,#tbPassword{
                border-top:0px;
                border-left:0px;
                border-right:0px;
                border-bottom:1px solid black;
                padding-bottom:5px;
            }
            .col-sm-8{
                background-color:#1ABC9C;
            }
            
            #lnkbtnLogin,#lnkbtnSignUp{color:#BDC3C7;font-size:25px;padding:10px 10px;letter-spacing:2px;}	
		#lnkbtnLogin:hover{color:#45B39D;transition:0.5s all;text-decoration:none;}
        #lnkbtnSignUp:hover{color:#FF5733;transition:0.5s all;text-decoration:none;}
        #tbEmail:focus{outline:none;color:#45B39D;}
        #tbPassword:focus{outline:none;color:#45B39D;}
        	
        #lnkbtnLogin{color:#45B39D;}
        .chkRemember{background:none; }
       </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
               
        <div class="container-fluid">
            <div class="row" style="width:100%;">
               <div class="col-sm-7 text-center">
			        <div style="background-color:#45B39D;padding-top:12%;padding-bottom:19%;margin-left:-12px;border-bottom-right-radius:450px;">
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
			            </table>
                        <br /><br />
                        <table>
                        <tr>
                            <td><asp:TextBox ID="tbEmail" runat="server" placeholder="Email" Width="250px"></asp:TextBox><asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="tbEmail" ErrorMessage="&nbsp;&nbsp;<b>*</b>" ForeColor="Red" ValidationGroup="grpLogin" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                            <tr>
                            <td><asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="tbEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" ErrorMessage="Email Is Not Valid" ValidationGroup="grpLogin" Display="Dynamic" CssClass="active"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="tbPassword" runat="server" TextMode="Password" placeholder="Password" Width="250px"></asp:TextBox><asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="tbPassword" ErrorMessage="&nbsp;&nbsp;<b>*</b>" ForeColor="Red" ValidationGroup="grpLogin"></asp:RequiredFieldValidator></td>
                        </tr>
                            
                        <tr>
                            <td style="padding-top:20px;"><asp:CheckBox ID="chkRemember" runat="server" Text="Remember Me" Font-Underline="False" CssClass="chkRemember" />&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="lnkbtnForgetPassword" runat="server" Text="Forget Password" style="color:#45B39D;" Font-Bold="true" OnClick="lnkbtnForgetPassword_Click"></asp:LinkButton></td>
                        </tr>
                            <tr>
                                <td><br /></td>
                            </tr>
                        <tr>
                            <td style="text-align:center">
                                <asp:LinkButton ID="btnLogin" runat="server" Text="Login" ValidationGroup="grpLogin" OnClick="btnLogin_Click">LOGIN</asp:LinkButton>
                            </td>
                         </tr>
                            <tr>
                                <td class="text-center"><br /><p style="color:#BDC3C8;">OR LOGIN WITH</p></td>
                            </tr>
                            <tr>
                                <td class="text-center"><a href="https://www.facebook.com/" target="_blank"><i class="fa fa-facebook-square" style="font-size:36px;color:#3B5998;padding:10px;"></i></a>
                                    <a href="https://www.plus.google.com/" target="_blank"><i class="fa fa-google-plus" style="font-size:36px;color:#dd4b39;padding:10px;"></i></a>
                                    <a href="https://www.plus.google.com/" target="_blank"><i class="fa fa-linkedin" style="font-size:36px;color:#0077B5;padding:10px;"></i></a>

                                </td>
                            </tr>
                        </table>
                                <br />
                            <br />
                        <asp:Label ID="lblStatus" runat="server" Font-size="Large" ForeColor="Red" Font-Bold="true"></asp:Label>
                        </center>
                </div>
             </div>
        </div>
    </form>
</body>
</html>
