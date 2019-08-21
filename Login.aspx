<%@ Page Title="" Language="C#" MasterPageFile="~/StudbManage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudbManage.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="300" style="border:1px solid #507CD1; background-color: #DAE3F5;" align="center">
    <tr>
      <td colspan="2" style="font-size: 12pt; font-family: 宋体; text-align:center; background-color: #507CD1; color:#ffffff; padding: 3px" class="auto-style2">登录</td>
    </tr>
    <tr style="height: 15px;"><td></td></tr>
    <tr style="height: 35px;">
      <td style="font-size: 12pt; font-family: 宋体; text-align: right;" width="80">用户名：</td>
      <td>
        <asp:TextBox ID="txtUserName" runat="server" Width="100px"></asp:TextBox>
        <font style="font-size: 12pt; color: red; font-family: 宋体;">
          *
          <asp:RequiredFieldValidator ID="rfv_name" runat="server" ErrorMessage="不能为空" ControlToValidate="txtUserName">
          </asp:RequiredFieldValidator>
        </font>
      </td>
    </tr>
    <tr style="height: 35px;">
      <td style="font-size: 12pt; font-family: 宋体; text-align: right;">密　码：</td>
      <td><asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="100px"></asp:TextBox></td>
    </tr>
        <tr>
            <td> &nbsp;&nbsp; 验证码</td>
            <td class="auto-style1">
            
          <asp:TextBox ID="tbx_yzm" runat="server" Width="70px"></asp:TextBox>
            <asp:ImageButton ID="ibtn_yzm" runat="server"  OnClick="ibtn_yzm_Click" Height="27px" Width="53px" />
          </td>
        </tr>
    <tr>
      <td style="font-size: 12pt; font-family: 宋体; text-align: right;" class="auto-style2">类  型：</td>
      <td class="auto-style2">
          <asp:DropDownList ID="ddlType" runat="server" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
              <asp:ListItem Value="0">系统用户</asp:ListItem>
              <asp:ListItem Value="3">教师</asp:ListItem>
              <asp:ListItem Value="4">学生</asp:ListItem>
          </asp:DropDownList>
        </td>
    </tr>
    <tr style="height: 35px; text-align:center;">
      <td colspan="2" style="font-size: 12pt; font-family: 宋体; text-align:center;">
        <asp:Button ID="btnLogin" runat="server" Text="登录" onclick="btnLogin_Click" />
      </td>
    </tr>
    <tr style="height: 35px; text-align:center;">
      <td colspan="2" style="font-size: 12pt; font-family: 宋体; color: #ff0000; text-align:center;">
        <asp:Label ID="lblNote" runat="server" Text=""></asp:Label>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:studbConnectionString %>" SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
      </td>
    </tr>
  </table>
</asp:Content>
