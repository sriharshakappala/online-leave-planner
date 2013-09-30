<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Leave Planner</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="shortcut icon" href="Styles/Images/favicon.gif" />
    <link href="Styles/Style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" runat="server">
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <!--Header Begin-->
    <div class="header">
        <div class="center">
            <div class="logo">
                <a href="#">Leave Planner</a>
            </div>
        </div>
    </div>
    <!--Header END-->
    <!--SubPage Toprow Begin-->
    <div class="toprow">
        <div class="center">
            <table align="right" cellpadding="5" cellspacing="5" class="box2holder">
                <tr>
                    <td align="center" colspan="2">
                        <br />
                        Sign in to LeavePlanner&nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        User Name
                    </td>
                    <td align="left" valign="middle">
                        &nbsp;
                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Password
                    </td>
                    <td align="left" valign="middle">
                        &nbsp;
                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td align="left" valign="middle">
                        &nbsp;
                        <asp:Button ID="Button1" runat="server" Font-Names="Calibri" Text="Sign in" Width="55px"
                            Style="height: 25px" OnClick="Button1_Click" CssClass="button" />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td align="left" valign="middle">
                        <asp:Label ID="ErrorLabel" runat="server" Font-Names="Calibri" Font-Size="Small"
                            ForeColor="#CC3300"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:HyperLink ID="HyperLink4" runat="server" Font-Underline="False" NavigateUrl="~/CantAccessYourAccount.aspx"
                            ForeColor="Black">Can&#39;t access your account.</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:HyperLink ID="HyperLink5" runat="server" Font-Underline="False" ForeColor="Black"
                            NavigateUrl="~/ForgetPassword1.aspx">Forget password.</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <!--Toprow END-->
    <asp:Panel ID="Panel1" runat="server" Width="100%">
        <!--MiddleRow Begin-->
        <div class="midrow">
            <div class="container">
                <div class="box">
                    <h1>
                        Live Innovative</h1>
                    <a class="innovative" href="#"></a>
                    <p>
                        <a>Live in a whole new and modern environment for managing the users and defining leave
                            policies.</a>
                    </p>
                    <p>
                        <br />
                    </p>
                </div>
                <div class="box">
                    <h1>
                        Be Rapid</h1>
                    <a class="rapid" href="#"></a>
                    <p>
                        <a>Be quick in approving the leaves and viewing the leave information. Get a full time
                            record of your leave history.</a></p>
                    <p>
                        <br />
                    </p>
                </div>
                <div class="box last">
                    <h1>
                        Stay Connected</h1>
                    <a class="connected" href="#"></a>
                    <p>
                        <a>Stay connected with other users and members of the leave hierarchy.</a></p>
                    <p>
                        &nbsp;</p>
                </div>
            </div>
        </div>
        <!--MiddleRow END-->
        <!--Footer Begin-->
        <div class="footer">
            <div class="foot">
                &copy; Leave Planner 2012 | <a href="#">Sitemap</a> | <a href="#">Terms of Use</a>
                | <a href="#">Privacy Statement</a> | <a href="#">Feedback</a> | <a href="#">Contact
                    Us</a></div>
        </div>
        <!--Footer END-->
    </asp:Panel>
    <asp:AlwaysVisibleControlExtender ID="Panel1_AlwaysVisibleControlExtender" 
        runat="server" Enabled="True" HorizontalSide="Center" TargetControlID="Panel1" 
        VerticalSide="Bottom">
    </asp:AlwaysVisibleControlExtender>
    </form>
</body>
</html>
