using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudbManage
{
    public partial class EditScore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (Session["role"] == null)  // 用户未登录
            {
                
                Response.Redirect("Login.aspx?msg=" + Server.UrlEncode("您不是合法用户，请登入后再操作！"));
            }
            else if (!(Session["role"].ToString() == "0"
        || Session["role"].ToString() == "3"))  // 只有管理员、教师可以打开本页面
            {
                Response.Write("<script>alert('您不是管理员、教师，不能打开该页面！');window.location='" + Server.UrlEncode(Session["CurrentPage"].ToString()) + "';</script>");
            }
            else
            {
                // 系统管理员可管理所有的成绩信息
                if (Session["role"].ToString() == "0")
                    Session["CurrentPage"] = "EditScore.aspx";



                // 教师可以管理自己任课的成绩信息
                else if (Session["role"].ToString() == "3")
                {
                    string tno = Session["tno"].ToString().Replace(" ", "");
                    SqlDataSource1.SelectCommand =
                        "SELECT sno,student_course.cno,score FROM student_course join course on course.cno=student_course.cno WHERE course.tno = '" + tno + "'";
                    Session["CurrentPage"] = "EditScore.aspx";
                }

            }
        }


        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            string SearchType = ddlSearch.SelectedValue;
            if (SearchType == "sname")    // 按学生姓名查询
            {
                if (Session["role"].ToString() == "0")    // 如果是管理员
                {
                    SqlDataSource1.SelectCommand =
                        "SELECT student_course.sno,student_course.cno,score FROM student_course join student on student.sno=student_course.sno where student.sname like '%" + txtSearch.Text + "%'";
                }
                else if (Session["role"].ToString() == "3")    // 如果是教师
                {
                    string tno = Session["tno"].ToString().Replace(" ", ""); 
                    
                    SqlDataSource1.SelectCommand =
                    "SELECT student_course.sno,student_course.cno,score FROM student_course join student on student.sno=student_course.sno join course on course.cno=student_course.cno where student.sname like '%" + txtSearch.Text + "%' and course.tno = '" + tno + "'"; ;
                }

            }

            else if (SearchType == "cname")    // 按名字查询
            {
                if (Session["role"].ToString() == "0")    // 如果是管理员
                {
                    SqlDataSource1.SelectCommand =
                         "SELECT student_course.sno,student_course.cno,score FROM student_course join course on course.cno=student_course.cno where course.cname like '%" + txtSearch.Text + "%'";
                }
                else if (Session["role"].ToString() == "3")    // 如果是教师
                {
                    string tno = Session["tno"].ToString().Replace(" ", "");
                    
                    SqlDataSource1.SelectCommand =
                   "SELECT student_course.sno,student_course.cno,score FROM student_course join course on course.cno=student_course.cno where course.cname like '%" + txtSearch.Text + "%' and course.tno = '" + tno + "'";
                }
            }
            else if (SearchType == "sno")    // 按学号查询
            {
                if (Session["role"].ToString() == "0")    // 如果是管理员
                {
                    SqlDataSource1.SelectCommand =
                        "SELECT student_course.sno,student_course.cno,score FROM student_course join student on student.sno=student_course.sno where student.sno like '%" + txtSearch.Text + "%'";
                }
                else if (Session["role"].ToString() == "3")    // 如果是教师
                {
                    string tno = Session["tno"].ToString().Replace(" ", "");
                    
                    SqlDataSource1.SelectCommand =
                    "SELECT student_course.sno,student_course.cno,score FROM student_course join student on student.sno=student_course.sno join course on course.cno=student_course.cno where student.sno like '%" + txtSearch.Text + "%' and course.tno = '" + tno + "'"; ;
                }

            }

        }
        

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
        //学号和课程名双重查找
        protected void ButtonMultiSearch_Click(object sender, EventArgs e)
        {
            if (Session["role"].ToString() == "0")    // 如果是管理员
            {
                SqlDataSource1.SelectCommand =
                    "SELECT student_course.sno,student_course.cno,score FROM student_course join student on student.sno=student_course.sno join course on course.cno=student_course.cno where student.sno like '%" + txtSearch.Text + "%' and course.cname like '%" + txt2.Text + "%'";
            }
            else if (Session["role"].ToString() == "3")    // 如果是教师
            {
                string tno = Session["tno"].ToString().Replace(" ", "");
               
                SqlDataSource1.SelectCommand =
                "SELECT student_course.sno,student_course.cno,score FROM student_course join student on student.sno=student_course.sno join course on course.cno=student_course.cno where student.sno like '%" + txtSearch.Text + "%' and course.tno = '" + tno + "' and course.cname like '%" + txt2.Text + "%'";
            }
        }
    }
}