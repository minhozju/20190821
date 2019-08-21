<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/MasterPage.Master" CodeBehind="EditScore.aspx.cs" Inherits="StudbManage.EditScore" %>

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
              <asp:ListItem Value="sname">姓名</asp:ListItem>
              <asp:ListItem Value="cname">课程名</asp:ListItem>
                <asp:ListItem Value="sno">学号</asp:ListItem>
          </asp:DropDownList>
      &nbsp;</td></tr>
         <tr style="height: 35px;">
          <td>多重查找 ：
                 <asp:TextBox ID="txt2" runat="server"></asp:TextBox>
              <asp:Button ID="ButtonMultiSearch" runat="server" Text="多重查找" OnClick="ButtonMultiSearch_Click" />
      </td>
              <tr style="height: 35px;">
      <td>请在第一个文本框中输入学号，在第二个文本框中输入课程名
     </td></tr>
    </tr>
        </table>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
    AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double"
    BorderWidth="3px" CellPadding="4" DataKeyNames="cno,sno" DataSourceID="SqlDataSource1"
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
         <asp:BoundField DataField="cno" HeaderText="课程号" ReadOnly="true" SortExpression="cno" />
      <asp:BoundField DataField="sno" HeaderText="学号"  ReadOnly="true" SortExpression="sno" />
     
        <asp:TemplateField HeaderText="成绩" SortExpression="score">
            <EditItemTemplate >
                <asp:TextBox ID="txtScore" runat="server" Text='<%# Bind("score") %>'></asp:TextBox>
                <font style="color:red">*</font>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtScore" ErrorMessage="成绩非法！" MaximumValue="100" MinimumValue="0" Type="Integer"></asp:RangeValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lbScore" runat="server" Text='<%# Bind("score") %>'></asp:Label>
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
    DeleteCommand="DELETE FROM [student_course] WHERE [sno] = @sno and [cno] = @cno "
    SelectCommand="SELECT * FROM [student_course]"
    UpdateCommand="UPDATE [student_course] SET [sno] = @sno , [score] = @score WHERE [cno]=@cno and [sno] = @sno" InsertCommand="INSERT INTO [student_course] ([cno],[sno],[score] VALUES (@cno, @sno, @score)">
  </asp:SqlDataSource>
</asp:Content>
