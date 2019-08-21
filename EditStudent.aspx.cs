using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace StudbManage
{
    public partial class EditStudent : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (Session["role"] == null)  // 用户未登录
            {
                //Response.Write("<script>window.location='Login.aspx?msg=" + Server.UrlEncode("您不是合法用户，请登入后再操作！") + "';</script>");
                //ClientScript.RegisterStartupScript(GetType(), "error", "<script>window.location='Login.aspx?msg=" + Server.UrlEncode("您不是合法用户，请登入后再操作！") + "';</script>");
                Response.Redirect("Login.aspx?msg=" + Server.UrlEncode("您不是合法用户，请登入后再操作！"));
            }
            else if (!(Session["role"].ToString() == "0" 
        || Session["role"].ToString() == "2" ))  // 只有管理员、教务秘书可以打开本页面
            {
                Response.Write("<script>alert('您不是管理员、教务秘书，不能打开该页面！');window.location='" + Server.UrlEncode(Session["CurrentPage"].ToString()) + "';</script>");
            }
            else
            {
                // 系统管理员可管理所有的学生信息
                if (Session["role"].ToString() == "0")
                    Session["CurrentPage"] = "EditStudent.aspx";

               

                // 教务秘书可管理本院系学生信息
                else if (Session["role"].ToString() == "2")
                {
                    string department = Session["department"].ToString().Replace(" ", "");
                    SqlDataSource1.SelectCommand =
                        "SELECT * FROM student WHERE student.dept = '" + department + "'";
                    Session["CurrentPage"] = "EditStudent.aspx";
                }
          
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            string SearchType = ddlSearch.SelectedValue;
            if (SearchType == "sno")    // 按学号查询
            {
                if (Session["role"].ToString() == "0")    // 如果是管理员
                {
                    SqlDataSource1.SelectCommand =
                        "Select * FROM student WHERE student.sno like '%" + txtSearch.Text + "%'";
                }
                else if (Session["role"].ToString() == "1")    // 如果是分管教学领导
                {
                    string department = Session["department"].ToString().Replace(" ", "");
                    SqlDataSource1.SelectCommand =
                    "SELECT * FROM student WHERE student.dept = '" + department + "' and student.sno like '%" + txtSearch.Text + "%'";
                }
                else if (Session["role"].ToString() == "2")    // 如果是教学秘书
                {
                    string department = Session["department"].ToString().Replace(" ", "");
                    SqlDataSource1.SelectCommand =
                    "SELECT * FROM student WHERE student.dept = '" + department + "' and student.sno like '%" + txtSearch.Text + "%'";
                }
            }

            else if (SearchType == "sname")    // 按名字查询
            {
                if (Session["role"].ToString() == "0")    // 如果是管理员
                {
                    SqlDataSource1.SelectCommand =
                        "Select * FROM student WHERE student.sname like '%" + txtSearch.Text + "%'";
                }
                else if (Session["role"].ToString() == "1")    // 如果是分管教学领导
                {
                    string department = Session["department"].ToString().Replace(" ", "");
                    SqlDataSource1.SelectCommand =
                    "SELECT * FROM student WHERE student.dept = '" + department + "' and student.sname like '%" + txtSearch.Text + "%'";
                }
                else if (Session["role"].ToString() == "2")    // 如果是教学秘书
                {
                    string department = Session["department"].ToString().Replace(" ", "");
                    SqlDataSource1.SelectCommand =
                    "SELECT * FROM student WHERE student.dept = '" + department + "' and student.sname like '%" + txtSearch.Text + "%'";
                }

            }

            else if (SearchType == "dept")    // 按院系查询
            {
                if (Session["role"].ToString() == "0")    // 如果是管理员
                {
                    SqlDataSource1.SelectCommand =
                        "Select * FROM student WHERE student.dept like '%" + txtSearch.Text + "%'";
                }
                else if (Session["role"].ToString() == "1")    // 如果是分管教学领导
                {
                    string department = Session["department"].ToString().Replace(" ", "");
                    SqlDataSource1.SelectCommand =
                    "SELECT * FROM student WHERE student.dept = '" + department + "' and student.dept like '%" + txtSearch.Text + "%'";
                }
                else if (Session["role"].ToString() == "2")    // 如果是教学秘书
                {
                    string department = Session["department"].ToString().Replace(" ", "");
                    SqlDataSource1.SelectCommand =
                    "SELECT * FROM student WHERE student.dept = '" + department + "' and student.dept like '%" + txtSearch.Text + "%'";
                }
            }
        }

    }
}