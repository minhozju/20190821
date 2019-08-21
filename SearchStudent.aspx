<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/MasterPage.Master" CodeBehind="SearchStudent.aspx.cs" Inherits="StudbManage.SearchStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 104px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="600" style="border:1px solid #507CD1; background-color: #DAE3F5;" align="center">
    <tr style="height: 35px;">
      <td colspan="2" style="font-size: 12pt; font-family: 宋体; text-align:center; background-color: #507CD1; color:#ffffff; padding: 3px">查找</td>
    </tr>
         <tr style="height: 35px;">
      
      <td>
          输入关键字：<asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
          <asp:Button ID="ButtonSearch" runat="server" Text="查找" OnClick="ButtonSearch_Click" />
      </td>
    </tr>
 <tr style="height: 35px;">
      <td>查找方式：
          <asp:DropDownList ID="ddlSearch" runat="server">
              <asp:ListItem Value="sname">姓名</asp:ListItem>
              <asp:ListItem Value="dept">部门</asp:ListItem>
              <asp:ListItem Value="sno">学号</asp:ListItem>
              <asp:ListItem></asp:ListItem>
          </asp:DropDownList>
      </td>
    </tr>
         <tr style="height: 35px;">
             <td>

                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="sno" DataSourceID="SqlDataSource1" Width="362px">
                     <Columns>
                         <asp:BoundField DataField="sno" HeaderText="学号" ReadOnly="True" SortExpression="sno" />
                         <asp:BoundField DataField="sname" HeaderText="姓名" SortExpression="sname" />
                         <asp:BoundField DataField="sex" HeaderText="性别" SortExpression="sex" />
                         <asp:BoundField DataField="birthday" HeaderText="生日" SortExpression="birthday" />
                         <asp:BoundField DataField="dept" HeaderText="部门" SortExpression="dept" />
                         <asp:BoundField DataField="spno" HeaderText="专业号" SortExpression="spno" />
                         <asp:BoundField DataField="classno" HeaderText="班级号" SortExpression="classno" />
                         <asp:BoundField DataField="password" HeaderText="密码" SortExpression="password" />
                         
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:studbConnectionString %>" SelectCommand="SELECT * FROM [student]"></asp:SqlDataSource>

             </td>
             </tr>

        </table>
    
    </asp:Content>