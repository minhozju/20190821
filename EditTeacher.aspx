<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="EditTeacher.aspx.cs" Inherits="StudbManage.EditTeacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="600" style="border:1px solid #507CD1; background-color: #DAE3F5;" >
         <tr style="height: 35px;">
      <td style="font-size: 12pt; font-family: 宋体; text-align:center; background-color: #507CD1; color:#ffffff; padding: 3px">查找</td>
    </tr>
         <tr style="height: 35px;">
          <td>输入关键字 ：
                 <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
          <asp:Button ID="ButtonSearch" runat="server" Text="查找" OnClick="ButtonSearch_Click" />
      </td>
    </tr>
 <tr style="height: 35px;">
      <td>查 找 方 式：
     <asp:DropDownList ID="ddlSearch" runat="server">
              <asp:ListItem Value="tname">姓名</asp:ListItem>
              <asp:ListItem Value="department">部门</asp:ListItem>
              <asp:ListItem Value="tno">教师号</asp:ListItem>
              <asp:ListItem></asp:ListItem>
          </asp:DropDownList>
      &nbsp;</td></tr>
        </table>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
    AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double"
    BorderWidth="3px" CellPadding="4" DataKeyNames="tno" DataSourceID="SqlDataSource1"
    GridLines="Horizontal" Width="593px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
    <FooterStyle BackColor="White" ForeColor="#333333" />
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="删除"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
      <asp:BoundField DataField="tno" HeaderText="教工号" ReadOnly="True" SortExpression="tno" />
      <asp:BoundField DataField="tname" HeaderText="教师姓名" SortExpression="tname" />
      <asp:BoundField DataField="sex" HeaderText="性别" SortExpression="sex" />
      <asp:BoundField DataField="email" HeaderText="邮箱" SortExpression="email" />
        <asp:TemplateField HeaderText="部门" SortExpression="department">
              <EditItemTemplate>
          <asp:DropDownList ID="ddlDepartment" runat="server" Width="70px" Height="20px" SelectedValue='<%# Bind("department") %>'>
            <asp:ListItem Value="信计系">信计系</asp:ListItem>
            <asp:ListItem Value="网络系">网络系</asp:ListItem>
            <asp:ListItem Value="计算机系">计算机系</asp:ListItem> 
              <asp:ListItem Value="">空</asp:ListItem>               
          </asp:DropDownList>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="lblDepartment" runat="server" Text='<%# Bind("department") %>'></asp:Label>
        </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <RowStyle BackColor="White" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
  </asp:GridView>
  
  
  <asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:studbConnectionString %>"
    DeleteCommand="DELETE FROM [teacher] WHERE [tno] = @tno and not exists(select * from [course] where [tno] = @tno )"
    SelectCommand="SELECT * FROM [teacher]"
    UpdateCommand="UPDATE [teacher] SET [tname] = @tname,[sex] = @sex, [email] = @email, [department] = @department WHERE [tno] = @tno" InsertCommand="INSERT INTO [teacher] ([tno], [tname], [sex], [email], [department]) VALUES (@tno, @tname, @sex, @email, @dept)">
  </asp:SqlDataSource>
</asp:Content>
