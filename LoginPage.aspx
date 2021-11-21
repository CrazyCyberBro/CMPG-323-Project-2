<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="WebApplication1.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 211px;
        }
        .auto-style2 {
            width: 228px;
        }
        .auto-style3 {
            width: 182px;
        }
        .auto-style4 {
            width: 403px;
            height: 318px;
        }
        .auto-style5 {
            width: 149px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <table aria-checked="false" class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <img alt="" class="auto-style4" src="Images/Lionheart%20marketing%20logo.png" /></td>
                    <td class="auto-style3">
                        Username:<asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style5">Password<asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Login" Width="103px" />
                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button4" runat="server" Height="28px" OnClick="Button4_Click" Text="Create Account" Width="121px" />
                    </td>
                </tr>
            </table>
        </p>
    </form>
    <h2>Our story</h2>
    <p>
        xyz</p>
</body>
</html>
