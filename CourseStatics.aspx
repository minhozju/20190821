<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="CourseStatics.aspx.cs" Inherits="StudbManage.CourseStatics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <table width="600" style="border:1px solid #507CD1; background-color: #DAE3F5;" >
             <tr style="height: 35px;">
      <td style="font-size: 12pt; font-family: 宋体; text-align:center; background-color: #507CD1; color:#ffffff; padding: 3px">成绩统计</td>
    </tr>
            <tr style="height: 35px;">
      <td style="font-size: 12pt; font-family: 宋体; text-align:center; background-color: #FFFFFF; color:#000066; padding: 3px">
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="cno" DataSourceID="SqlDataSource1" align="center" CellPadding="4" ForeColor="#333333" GridLines="None">
               <AlternatingRowStyle BackColor="White" />
               <Columns>
                   <asp:BoundField DataField="cno" HeaderText="课程号" ReadOnly="True" SortExpression="cno" />
                   <asp:BoundField DataField="cname" HeaderText="课程名" SortExpression="cname" />
                   <asp:BoundField DataField="average_score" HeaderText="平均成绩" ReadOnly="True" SortExpression="average_score" />
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
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:studbConnectionString %>" SelectCommand="select course.cno, course.cname, AVG(student_course.score) average_score from student_course join course on course.cno=student_course.cno
group by course.cno,course.cname
order by average_score DESC"></asp:SqlDataSource>
           </td>
    </tr>
</table>
</asp:Content>
