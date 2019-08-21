<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/MasterPage.Master"  CodeBehind="SelfEditStudent.aspx.cs" Inherits="StudbManage.SelfEditStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
    AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double"
    BorderWidth="3px" CellPadding="4" DataKeyNames="sno" DataSourceID="SqlDataSource1"
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
            </ItemTemplate>
        </asp:TemplateField>
      <asp:BoundField DataField="sno" HeaderText="学号" ReadOnly="True" SortExpression="sno" />
      <asp:BoundField DataField="sname" HeaderText="学生姓名" SortExpression="sname" />
      <asp:BoundField DataField="sex" HeaderText="性别" SortExpression="sex" />
      <asp:BoundField DataField="birthday" HeaderText="生日" SortExpression="birthday" />
      <asp:BoundField DataField="dept" HeaderText="专业" SortExpression="dept" ReadOnly="True" />
        <asp:BoundField DataField="spno" HeaderText="专业号" SortExpression="spno" ReadOnly="True" />
        <asp:BoundField DataField="classno" HeaderText="班级号" SortExpression="classno" ReadOnly="True" />
    </Columns>
    <RowStyle BackColor="White" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
  </asp:GridView>
  
  <asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:studbConnectionString %>"
    SelectCommand="SELECT * FROM [student]"
    UpdateCommand="UPDATE [student] SET [sname] = @sname, [sex] = @sex, [birthday] = @birthday  WHERE [sno] = @sno" InsertCommand="INSERT INTO [student] ([sname], [sex], [birthday]) VALUES ( @sname, @sex, @birthday)">
  </asp:SqlDataSource>
</asp:Content>

