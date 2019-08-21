using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudbManage
{
    public partial class SearchScore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (Session["role"] == null)  // 用户未登录
            {

                Response.Redirect("Login.aspx?msg=" + Server.UrlEncode("您不是合法用户，请登入后再操作！"));
            }
      
            else
            {
                // 系统管理员可查看所有的成绩信息
                if (Session["role"].ToString() == "0")
                    Session["CurrentPage"] = "SearchScore.aspx";



                // 教师可以查看自己任课的成绩信息
                else if (Session["role"].ToString() == "3")
                {
                    string tno = Session["tno"].ToString().Replace(" ", "");
                    SqlDataSource1.SelectCommand =
                        "SELECT student_course.sno,student_course.cno,score FROM student_course join course on course.cno=student_course.cno WHERE course.tno = '" + tno + "'";
                    Session["CurrentPage"] = "SearchScore.aspx";
                }
                //学生可以查看自己的成绩
                else if (Session["role"].ToString() == "4")
                {
                    string sno = Session["sno"].ToString().Replace(" ", "");
                    SqlDataSource1.SelectCommand =
                        "SELECT student_course.sno,student_course.cno,score FROM student_course join student on student.sno =student_course.sno WHERE student.sno ='" + sno + "'";
                    Session["CurrentPage"] = "SearchScore.aspx";
                }
                //分管教学领导和教务秘书可以查看本专业学生成绩
                else if (Session["role"].ToString() == "1" || Session["role"].ToString() =="2")
                {
                    string dept = Session["department"].ToString().Replace(" ", "");
                    SqlDataSource1.SelectCommand =
                        "SELECT student_course.sno,student_course.cno,score FROM student_course join student on student.sno =student_course.sno WHERE student.dept ='" + dept + "'";
                    Session["CurrentPage"] = "SearchScore.aspx";
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
                else if (Session["role"].ToString()=="1" || Session["role"].ToString() == "2") //如果是分管教学领导或教务秘书
                {
                    string dept = Session["department"].ToString().Replace(" ", "");

                    SqlDataSource1.SelectCommand =
                    "SELECT student_course.sno,student_course.cno,score FROM student_course join student on student.sno=student_course.sno where student.sname like '%" + txtSearch.Text + "%' and student.dept = '" + dept + "'"; 

                }
                else if (Session["role"].ToString() == "4") //如果是学生
                {
                    string sno = Session["sno"].ToString().Replace(" ", "");

                    SqlDataSource1.SelectCommand =
                    "SELECT student_course.sno,student_course.cno,score FROM student_course join student on student.sno=student_course.sno where student.sname like '%" + txtSearch.Text + "%' and student.sno = '" + sno + "'";
                }

            }

            else if (SearchType == "cname")    // 按课程名字查询
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
                else if (Session["role"].ToString() == "1" || Session["role"].ToString() == "2") //如果是分管教学领导或教务秘书
                {
                    string dept = Session["department"].ToString().Replace(" ", "");

                    SqlDataSource1.SelectCommand =
                    "SELECT student_course.sno,student_course.cno,score FROM student_course join student on student.sno=student_course.sno join course on course.cno = student_course.cno  where course.cname like '%" + txtSearch.Text + "%' and student.dept = '" + dept + "'";

                }
                else if (Session["role"].ToString() == "4") //如果是学生
                {
                    string sno = Session["sno"].ToString().Replace(" ", "");

                    SqlDataSource1.SelectCommand =
                    "SELECT student_course.sno,student_course.cno,score FROM student_course join student on student.sno=student_course.sno join course on student_course.cno=course.cno where course.cname like '%" + txtSearch.Text + "%' and student.sno = '" + sno + "'";
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
                else if (Session["role"].ToString() == "1" || Session["role"].ToString() == "2") //如果是分管教学领导或教务秘书
                {
                    string dept = Session["department"].ToString().Replace(" ", "");

                    SqlDataSource1.SelectCommand =
                    "SELECT student_course.sno,student_course.cno,score FROM student_course join student on student.sno=student_course.sno where student.sno like '%" + txtSearch.Text + "%' and student.dept = '" + dept + "'";

                }
                else if (Session["role"].ToString() == "4") //如果是学生
                {
                    string sno = Session["sno"].ToString().Replace(" ", "");

                    SqlDataSource1.SelectCommand =
                    "SELECT student_course.sno,student_course.cno,score FROM student_course join student on student.sno=student_course.sno where student.sno like '%" + txtSearch.Text + "%' and student.sno = '" + sno + "'";
                }

            }
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
            else if (Session["role"].ToString() == "1"|| Session["role"].ToString() == "2")    // 如果是教务秘书或分管教学领导
            {
                string dept = Session["department"].ToString().Replace(" ", "");

                SqlDataSource1.SelectCommand =
                "SELECT student_course.sno,student_course.cno,score FROM student_course join student on student.sno=student_course.sno join course on course.cno=student_course.cno where student.sno like '%" + txtSearch.Text + "%' and student.dept = '" + dept + "' and course.cname like '%" + txt2.Text + "%'";
            }
            else if (Session["role"].ToString() == "4")    // 如果是学生
            {
                string sno = Session["sno"].ToString().Replace(" ", "");

                SqlDataSource1.SelectCommand =
                "SELECT student_course.sno,student_course.cno,score FROM student_course join student on student.sno=student_course.sno join course on course.cno=student_course.cno where student.sno like '%" + txtSearch.Text + "%' and student.sno = '" + sno + "' and course.cname like '%" + txt2.Text + "%'";
            }

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}