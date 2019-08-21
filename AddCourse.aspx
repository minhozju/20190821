<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="AddCourse.aspx.cs" Inherits="StudbManage.AddCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <table align="center" border="0" bgcolor="#f5f5f5">
    <tr style="height: 10px"><td colspan="3">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:studbConnectionString %>" SelectCommand="SELECT [tno] FROM [teacher]"></asp:SqlDataSource>
        </td></tr>
    <tr style="height:35px">
      <td style="width: 135px; font-size: 12pt; font-family: 宋体;" align="right">
        课程号：
      </td>
      <td style="width: 159px;" align="left">
        &nbsp;<asp:TextBox ID="txtCno" runat="server" Width="120px" Font-Size="12pt" Font-Names="宋体" MaxLength="20"></asp:TextBox>
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
        *
        <asp:RequiredFieldValidator ID="rfvID" runat="server" ErrorMessage="不能为空" Display="Dynamic" ControlToValidate="txtCno">
        </asp:RequiredFieldValidator>
        <asp:CustomValidator ID="cvID" runat="server" ErrorMessage="已存在" Display="Dynamic" ControlToValidate="txtCno" OnServerValidate="cvID_ServerValidate">
        </asp:CustomValidator>
      </td>
    </tr>
          <tr style="height:35px">
      <td style="font-size: 12pt; font-family: 宋体;" align="right">
        课程名：
      </td>
      <td align="left">
        &nbsp;<asp:TextBox ID="txtCname" runat="server" Width="120px" Font-Size="12pt" Font-Names="宋体" MaxLength="10" ></asp:TextBox>
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
        *
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorcname" runat="server" ErrorMessage="不能为空" ControlToValidate="txtCname">
        </asp:RequiredFieldValidator>
      </td>
    </tr>
    <tr style="height:35px">
      <td style="font-size: 12pt; font-family: 宋体;" align="right">
        任课教师号 ：
      </td>
      <td align="left">
          <asp:DropDownList ID="ddlTno" runat="server" DataSourceID="SqlDataSource1" DataTextField="tno" DataValueField="tno" align="center">
          </asp:DropDownList>
      </td>
              <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
                  &nbsp;</td>
    </tr>
          <tr style="height:35px">
      <td style="font-size: 12pt; font-family: 宋体;" align="right">
        学　　期：
      </td>
      <td align="left">
        &nbsp;<asp:TextBox ID="txtSemester" runat="server" Width="120px" Font-Size="12pt" Font-Names="宋体" MaxLength="10" ></asp:TextBox>
      </td>
       <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
        *
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorSemester" runat="server" ErrorMessage="不能为空" ControlToValidate="txtSemester">
        </asp:RequiredFieldValidator>
      </td>
    </tr>
                <tr style="height:35px">
      <td style="font-size: 12pt; font-family: 宋体;" align="right">
        课　　时：
      </td>
      <td align="left">
        &nbsp;<asp:TextBox ID="txtLecture" runat="server" Width="120px" Font-Size="12pt" Font-Names="宋体" MaxLength="10" ></asp:TextBox>
      </td>
       <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
        *
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLecture" runat="server" ErrorMessage="不能为空" ControlToValidate="txtLecture">
        </asp:RequiredFieldValidator>
      </td>
    </tr>
                <tr style="height:35px">
      <td style="font-size: 12pt; font-family: 宋体;" align="right">
        学　　分：
      </td>
      <td align="left">
        &nbsp;<asp:TextBox ID="txtCredit" runat="server" Width="120px" Font-Size="12pt" Font-Names="宋体" MaxLength="10" ></asp:TextBox>
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
        *
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCredit" runat="server" ErrorMessage="不能为空" ControlToValidate="txtCredit">
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
