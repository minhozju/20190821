<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="StudbManage.AddUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <table align="center" border="0" bgcolor="#f5f5f5">
    <tr style="height: 10px"><td colspan="3"></td></tr>
    <tr style="height:35px">
      <td style="width: 135px; font-size: 12pt; font-family: 宋体;" align="right">
        用 户 ID：
      </td>
      <td style="width: 159px;" align="left">
        &nbsp;<asp:TextBox ID="txtUserid" runat="server" Width="120px" Font-Size="12pt" Font-Names="宋体" MaxLength="20"></asp:TextBox>
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
        *
        <asp:RequiredFieldValidator ID="rfvID" runat="server" ErrorMessage="不能为空" Display="Dynamic" ControlToValidate="txtUserid">
        </asp:RequiredFieldValidator>
        <asp:CustomValidator ID="cvID" runat="server" ErrorMessage="已存在" Display="Dynamic" ControlToValidate="txtUserid" OnServerValidate="cvID_ServerValidate">
        </asp:CustomValidator>
      </td>
    </tr>
          <tr style="height:35px">
      <td style="font-size: 12pt; font-family: 宋体;" align="right">
        密　　码：
      </td>
      <td align="left">
        &nbsp;<asp:TextBox ID="txtPassword" runat="server" Width="120px" Font-Size="12pt" Font-Names="宋体" MaxLength="10" ></asp:TextBox>
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
        *
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorpassword" runat="server" ErrorMessage="不能为空" ControlToValidate="txtPassword">
        </asp:RequiredFieldValidator>
      </td>
    </tr>
    <tr style="height:35px">
      <td style="font-size: 12pt; font-family: 宋体;" align="right">
        姓　　名：
      </td>
      <td align="left">
        &nbsp;<asp:TextBox ID="txtName" runat="server" Width="120px" Font-Size="12pt" Font-Names="宋体" MaxLength="10" ></asp:TextBox>
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
        *
        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="不能为空" ControlToValidate="txtName">
        </asp:RequiredFieldValidator>
      </td>
    </tr>
          <tr style="height:35px">
      <td style="font-size: 12pt; font-family: 宋体;" align="right">
        邮　　箱：
      </td>
      <td align="left">
        &nbsp;<asp:TextBox ID="txtEmail" runat="server" Width="120px" Font-Size="12pt" Font-Names="宋体" MaxLength="10" ></asp:TextBox>
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
      </td>
    </tr>
    <tr style="height:35px">
      <td style="font-size: 12pt; font-family: 宋体;" align="right">
        部    门：
      </td>
      <td>
        &nbsp;<asp:DropDownList ID="ddlDepartment" runat="server" Width="125px" Height="20px" Font-Size="12pt" Font-Names="宋体">
            <asp:ListItem Value="">空</asp:ListItem>   
            <asp:ListItem Value="信计系">信计系</asp:ListItem>
            <asp:ListItem Value="网络系">网络系</asp:ListItem>
            <asp:ListItem Value="计算机系">计算机系</asp:ListItem> 
        </asp:DropDownList>
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
      </td>
    </tr>
                <tr style="height:35px">
      <td style="font-size: 12pt; font-family: 宋体;" align="right">
        用户角色：
      </td>
      <td>
        &nbsp;<asp:DropDownList ID="ddlRole" runat="server" Width="125px" Height="20px" Font-Size="12pt" Font-Names="宋体">
          <asp:ListItem Value="">请选择</asp:ListItem>
          <asp:ListItem Value="0">系统管理员</asp:ListItem>
          <asp:ListItem Value="1">分管学院领导</asp:ListItem>
          <asp:ListItem Value="2">教务秘书</asp:ListItem>
        </asp:DropDownList>
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
        *
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请选择角色！" ControlToValidate="ddlRole">
        </asp:RequiredFieldValidator>
      </td>
    </tr>
    <tr style="height:45px">
      <td colspan="3" align="center">
        <asp:Button ID="btnOK" CssClass="Button" runat="server" Text="提交" BorderStyle="Groove" OnClick="btnOK_Click"></asp:Button>&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCancel" CssClass="Button" runat="server" Text="重置" BorderStyle="Groove" CausesValidation="false" OnClick="btnCancel_Click"></asp:Button>&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblTooltip" runat="server" style="font-size: 12pt; color: red; font-family: 宋体;"></asp:Label>
      </td>
    </tr>
  </table>
</asp:Content>
