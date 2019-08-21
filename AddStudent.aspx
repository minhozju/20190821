<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="AddStudent.aspx.cs" Inherits="StudbManage.AddStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <table align="center" border="0" bgcolor="#f5f5f5">
    <tr style="height: 10px"><td colspan="3"></td></tr>
    <tr style="height:35px">
      <td style="width: 135px; font-size: 12pt; font-family: 宋体;" align="right">
        学生 ID：
      </td>
      <td style="width: 159px;" align="left">
        &nbsp;<asp:TextBox ID="txtSno" runat="server" Width="120px" Font-Size="12pt" Font-Names="宋体" MaxLength="20"></asp:TextBox>
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
        *
        <asp:RequiredFieldValidator ID="rfvID" runat="server" ErrorMessage="不能为空" Display="Dynamic" ControlToValidate="txtSno">
        </asp:RequiredFieldValidator>
        <asp:CustomValidator ID="cvID" runat="server" ErrorMessage="已存在" Display="Dynamic" ControlToValidate="txtSno" OnServerValidate="cvID_ServerValidate">
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
        &nbsp;<asp:TextBox ID="txtSname" runat="server" Width="120px" Font-Size="12pt" Font-Names="宋体" MaxLength="10" ></asp:TextBox>
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
        *
        <asp:RequiredFieldValidator ID="rfvSname" runat="server" ErrorMessage="不能为空" ControlToValidate="txtSname">
        </asp:RequiredFieldValidator>
      </td>
    </tr>
          <tr style="height:35px">
      <td style="font-size: 12pt; font-family: 宋体;" align="right">
        性　　别：
      </td>
      <td align="left">
        &nbsp;<asp:TextBox ID="txtSex" runat="server" Width="120px" Font-Size="12pt" Font-Names="宋体" MaxLength="10" ></asp:TextBox>
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
      </td>
    </tr>
       <tr style="height:35px">
      <td style="font-size: 12pt; font-family: 宋体;" align="right">
       生　　日：
      </td>
      <td align="left">
        
          <asp:Calendar ID="CalendarBirthday" runat="server"></asp:Calendar>
        
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
      </td>
    </tr>
    <tr style="height:35px">
      <td style="font-size: 12pt; font-family: 宋体;" align="right">
        部    门：
      </td>
      <td>
        &nbsp;<asp:DropDownList ID="ddlDept" runat="server" Width="125px" Height="20px" Font-Size="12pt" Font-Names="宋体">
            <asp:ListItem Value="">空</asp:ListItem>   
            <asp:ListItem Value="信计系">信计系</asp:ListItem>
            <asp:ListItem Value="网络系">网络系</asp:ListItem>
            <asp:ListItem Value="计算机系">计算机系</asp:ListItem> 
        </asp:DropDownList>
      </td>
        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator"></asp:CustomValidator>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
          <asp:CustomValidator ID="CV_department" runat="server" ErrorMessage="只能添加本专业的学生" Display="Dynamic" ControlToValidate="ddlDept" OnServerValidate="cvdepartment_ServerValidate"></asp:CustomValidator>
      </td>
    </tr>
       <tr style="height:35px">
      <td style="font-size: 12pt; font-family: 宋体;" align="right">
        班　　级：
      </td>
      <td align="left">
        &nbsp;<asp:TextBox ID="txtClassno" runat="server" Width="120px" Font-Size="12pt" Font-Names="宋体" MaxLength="10" ></asp:TextBox>
      </td>
      <td style="font-size: 12pt; color: red; font-family: 宋体;" align="left">
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

