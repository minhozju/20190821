<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/StudbManage/MasterPage.Master" CodeBehind="StudentStatics.aspx.cs" Inherits="StudbManage.StudentStatics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="600" style="border:1px solid #507CD1; background-color: #DAE3F5;" >
          <tr style="height: 35px;">
      <td style="font-size: 12pt; font-family: 宋体; text-align:center; background-color: #507CD1; color:#ffffff; padding: 3px">成绩统计</td>
    </tr>
      <tr style="height: 35px;">
      <td style="font-size: 12pt; font-family: 宋体; text-align:center; background-color: #FFFFFF; color:#000066; padding: 3px">
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" align="center" CellPadding="4" ForeColor="#333333" GridLines="None">
              <AlternatingRowStyle BackColor="White" />
              <Columns>
                  <asp:BoundField DataField="sno" HeaderText="学号" SortExpression="sno" />
                  <asp:BoundField DataField="sname" HeaderText="学生姓名" SortExpression="sname" />
                  <asp:BoundField DataField="average_score" HeaderText="平均成绩" ReadOnly="True" SortExpression="average_score" />
                  <asp:BoundField DataField="total_credit" HeaderText="总学分" ReadOnly="True" SortExpression="total_credit" />
              </Columns>
              <EditRowStyle BackColor="#7C6F57" />
              <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
              <RowStyle BackColor="#E3EAEB" />
              <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
              <SortedAscendingCellStyle BackColor="#F8FAFA" />
              <SortedAscendingHeaderStyle BackColor="#246B61" />
              <SortedDescendingCellStyle BackColor="#D4DFE1" />
              <SortedDescendingHeaderStyle BackColor="#15524A" />
          </asp:GridView>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:studbConnectionString %>" SelectCommand="select student.sno, student.sname, AVG(student_course.score) average_score, SUM(course.credit) total_credit from student_course  join student on student.sno=student_course.sno join course on course.cno=student_course.cno
group by student.sno,student.sname
order by average_score DESC"></asp:SqlDataSource>
          </td>
    </tr>
    </table>

</asp:Content>