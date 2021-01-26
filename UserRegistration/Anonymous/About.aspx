<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="UserRegistration.Anonymous.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About</title>
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
           </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div id="nav">
            <ul id="menu">
                <li><a href="Login.aspx">Login</a></li>
                <li><a href="SignUp.aspx">SignUp</a></li>
                <li><a href="ForgetPassword.aspx">ForgetPassword</a></li>
                <li><a href="About.aspx">About</a></li>
            </ul>
        </div>
    </div>
    </form>
</body>
</html>
