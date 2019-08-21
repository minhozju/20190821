<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddScore.aspx.cs" MasterPageFile="~/MasterPage.Master" Inherits="StudbManage.AddScore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <table align="center" border="0" bgcolor="#f5f5f5">
    <tr style="height: 10px"><td colspan="3">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:studbConnectionString %>" SelectCommand="SELECT [cno] FROM [course]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:studbConnectionString %>" SelectCommand="SELECT [sno] FROM [student]"></asp:SqlDataSource>
        </td></tr>
    <tr style="height:35px">
      <td style="width: 135px; font-size: 12pt; font-family: 宋体;" align="right">
        课程号：
      </td>
      <td style="width: 159px;" align="left">
          <asp:DropDownList ID="ddlCno" runat="server" DataSourceID="SqlDataSource1" DataTextField="cno" DataValueField="cno">
          </asp:DropDownList>
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
        *
          <asp:CustomValidator ID="rfvTeacher" runat="server" ErrorMessage="不是您所授课程" Display="Dynamic" ControlToValidate="ddlCno" OnServerValidate="rfvTeacher_ServerValidate"></asp:CustomValidator>
      </td>
    </tr>
          <tr style="height:35px">
      <td style="width: 135px; font-size: 12pt; font-family: 宋体;" align="right">
        学号：
      </td>
      <td style="width: 159px;" align="left">
          <asp:DropDownList ID="ddlSno" runat="server" DataSourceID="SqlDataSource2" DataTextField="sno" DataValueField="sno">
          </asp:DropDownList>
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
          &nbsp;</td>
    </tr>
          
       <tr style="height:35px">
      <td style="font-size: 12pt; font-family: 宋体;" align="right">
        成　　绩：
      </td>
      <td align="left">
        &nbsp;<asp:TextBox ID="txtScore" runat="server" Width="120px" Font-Size="12pt" Font-Names="宋体" MaxLength="10" ></asp:TextBox>
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
          *
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空" ControlToValidate="txtScore"></asp:RequiredFieldValidator>
          <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtScore" ErrorMessage="成绩不合法" MaximumValue="100" MinimumValue="0" Type="Integer"></asp:RangeValidator>
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
