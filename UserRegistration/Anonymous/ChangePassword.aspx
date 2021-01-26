<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="UserRegistration.Anonymous.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ChangePassword</title>
       
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
            #btnLogin{
                padding-left:10px;
                padding-right:10px;
                padding-top:5px;
                padding-bottom:5px;
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
    <div>
        <center>
            <br /><br />
            <br /><br /><br />
        <table>
            <tr>
                <td><asp:Label ID="lblNewPassword" runat="server" Text="NewPassword : "></asp:Label></td>
                <td><asp:TextBox ID="tbNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="tbNewPassword" ErrorMessage="&nbsp;*" Font-Bold="true" ForeColor="Red" ValidationGroup="grpChange"></asp:RequiredFieldValidator> 
                </td> 
            </tr>
            <tr>
                <td><asp:Label ID="lblConfirmPassword" runat="server" Text="ConfirmPassword : "></asp:Label></td>
                <td><asp:TextBox ID="tbConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="tbConfirmPassword" ErrorMessage="&nbsp;*" ForeColor="Red" Font-Bold="true" ValidationGroup="grpChange"></asp:RequiredFieldValidator>
                </td>
                <td>
                     <asp:CompareValidator ID="cmpPasswords" runat="server" ControlToValidate="tbConfirmPassword" ControlToCompare="tbNewPassword" ErrorMessage="PasswordIsNotSame..!" Font-Bold="true" ForeColor="Red" ValidationGroup="grpChange"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Button ID="btnChange" runat="server" Text="Change" ValidationGroup="grpChange" OnClick="btnChange_Click" /></td>
            </tr>
        </table>
            <br /><br /><br />
            <asp:Label ID="lblStatus" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:Label>

            <br />
            <asp:Panel ID="Panel1" runat="server">
                <asp:Button ID="btnLogin" runat="server" Text="Click Here To Login" OnClick="btnLogin_Click" />
            </asp:Panel>
      </center>
    </div>
    </form>
</body>
</html>
