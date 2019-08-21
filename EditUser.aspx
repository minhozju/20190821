<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="StudbManage.EditUser" %>
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
              <asp:ListItem Value="name">姓名</asp:ListItem>
              <asp:ListItem Value="department">部门</asp:ListItem>
              <asp:ListItem Value="userid">账号</asp:ListItem>
              <asp:ListItem></asp:ListItem>
          </asp:DropDownList>
      &nbsp;</td></tr>
        </table>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
    AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double"
    BorderWidth="3px" CellPadding="4" DataKeyNames="userid" DataSourceID="SqlDataSource1"
    GridLines="Horizontal" Height="162px" Width="800px">
    <FooterStyle BackColor="White" ForeColor="#333333" />
    <Columns>
      <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderStyle-Width="80px" />
      <asp:BoundField DataField="userid" HeaderText="账号" ReadOnly="True" SortExpression="userid" HeaderStyle-Width="160px" />
      <asp:TemplateField HeaderText="密码" SortExpression="password" HeaderStyle-Width="340px">
        <EditItemTemplate>
          <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("password") %>' Width="180px" MaxLength="10"></asp:TextBox>
          <font style="color:red">*</font>
          <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ForeColor="Red" ErrorMessage="必须输入密码！"></asp:RequiredFieldValidator>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("password") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
        <asp:TemplateField HeaderText="姓名" SortExpression="name" HeaderStyle-Width="340px">
        <EditItemTemplate>
          <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("name") %>' Width="180px" MaxLength="10"></asp:TextBox>
          <font style="color:red">*</font>
          <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ForeColor="Red" ErrorMessage="必须输入姓名！"></asp:RequiredFieldValidator>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
        <asp:TemplateField HeaderText="邮箱" SortExpression="email" HeaderStyle-Width="340px">
        <EditItemTemplate>
          <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>' Width="180px" MaxLength="10"></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="lblemail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="部门" SortExpression="department" HeaderStyle-Width="90px">
        <EditItemTemplate>
          <asp:DropDownList ID="ddlDepartment" runat="server" Width="70px" Height="20px" SelectedValue='<%# Bind("department") %>'>
            <asp:ListItem Value="信计系">信计系</asp:ListItem>
            <asp:ListItem Value="网络系">网络系</asp:ListItem>
            <asp:ListItem Value="计算机系">计算机系</asp:ListItem> 
              <asp:ListItem Value="">空</asp:ListItem>   
            
          </asp:DropDownList>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="lbldepartment" runat="server" Text='<%# Bind("department") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
           <asp:TemplateField HeaderText="角色" SortExpression="role" HeaderStyle-Width="90px">
        <EditItemTemplate>
          <asp:DropDownList ID="ddlRole" runat="server" Width="70px" Height="20px" SelectedValue='<%# Bind("role") %>'>
            <asp:ListItem Value="0">系统管理员</asp:ListItem>
            <asp:ListItem Value="1">分管学院领导</asp:ListItem>
            <asp:ListItem Value="2">教务秘书</asp:ListItem>
              <asp:ListItem Value="3">教师</asp:ListItem>
              <asp:ListItem Value="4">学生</asp:ListItem>
          </asp:DropDownList>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="lblRole" runat="server" Text='<%# RoleCodeToName(Eval("role" ).ToString()) %>'></asp:Label>
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
    SelectCommand="SELECT [userid], [password],[name],[email],[department], [role] FROM [users]"
    UpdateCommand="UPDATE users SET password=@password,name = @name, email=@email,role = @role ,department=@department WHERE (userid = @userid)"
    DeleteCommand="delete from users where userid=@userid">
  </asp:SqlDataSource>
</asp:Content>

