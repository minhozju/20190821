<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="EditCourse.aspx.cs" Inherits="StudbManage.EditCourse" %>
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
              <asp:ListItem Value="cname">课程名称</asp:ListItem>
              <asp:ListItem></asp:ListItem>
          </asp:DropDownList>
      &nbsp;</td></tr>
        </table>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
    AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double"
    BorderWidth="3px" CellPadding="4" DataKeyNames="cno" DataSourceID="SqlDataSource1"
    GridLines="Horizontal" Height="162px" Width="800px">
    <FooterStyle BackColor="White" ForeColor="#333333" />
    <Columns>
      <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderStyle-Width="80px" />
      <asp:BoundField DataField="cno" HeaderText="课程号" ReadOnly="True" SortExpression="cno" HeaderStyle-Width="160px" />
        <asp:TemplateField HeaderText="课程名" SortExpression="cname" HeaderStyle-Width="340px">
        <EditItemTemplate>
          <asp:TextBox ID="txtCname" runat="server" Text='<%# Bind("cname") %>' Width="180px" MaxLength="10"></asp:TextBox>
          <font style="color:red">*</font>
          <asp:RequiredFieldValidator ID="rfvCname" runat="server" ControlToValidate="txtCname" ForeColor="Red" ErrorMessage="必须输入课程名！"></asp:RequiredFieldValidator>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="lblCname" runat="server" Text='<%# Eval("cname") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
        <asp:TemplateField HeaderText="任课教师号" SortExpression="tno" HeaderStyle-Width="340px">
        <EditItemTemplate>
          <asp:TextBox ID="txtTno" runat="server" Text='<%# Bind("tno") %>' Width="180px" MaxLength="10"></asp:TextBox>
     
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="lblTno" runat="server" Text='<%# Eval("tno") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
         <asp:TemplateField HeaderText="学期" SortExpression="semester" HeaderStyle-Width="340px">
        <EditItemTemplate>
          <asp:TextBox ID="txtSemester" runat="server" Text='<%# Bind("semester") %>' Width="180px" MaxLength="10"></asp:TextBox>
          
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="lblSemester" runat="server" Text='<%# Eval("semester") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
         <asp:TemplateField HeaderText="学时" SortExpression="lecture" HeaderStyle-Width="340px">
        <EditItemTemplate>
          <asp:TextBox ID="txtLecture" runat="server" Text='<%# Bind("lecture") %>' Width="180px" MaxLength="10"></asp:TextBox>
          
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="lblLecture" runat="server" Text='<%# Eval("lecture") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
         <asp:TemplateField HeaderText="学分" SortExpression="credit" HeaderStyle-Width="340px">
        <EditItemTemplate>
          <asp:TextBox ID="txtCredit" runat="server" Text='<%# Bind("credit") %>' Width="180px" MaxLength="10"></asp:TextBox>
          
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="lblCredit" runat="server" Text='<%# Eval("credit") %>'></asp:Label>
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
    SelectCommand="SELECT [cno], [tno],[cname],[semester],[lecture], [credit] FROM [course]"
    UpdateCommand="UPDATE course SET tno=@tno,cname = @cname, semester=@semester,lecture = @lecture ,credit=@credit WHERE (cno = @cno)"
    DeleteCommand="delete from course where cno=@cno and not exists(select * from [student_course] where [cno] = @cno )">
  </asp:SqlDataSource>
</asp:Content>
