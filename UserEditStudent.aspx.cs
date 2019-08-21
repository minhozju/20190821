using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace StudbManage
{
    public partial class UserEditStudent : System.Web.UI.Page
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
            else if (!(Session["role"].ToString() == "0" || Session["role"].ToString() == "1"
        || Session["role"].ToString() == "2" || Session["role"].ToString() == "4"))  // 只有管理员、分管教学领导、教务秘书或学生可以打开本页面
            {
                Response.Write("<script>alert('您不是管理员、分管教学领导、教务秘书或学生，不能打开该页面！');window.location='" + Server.UrlEncode(Session["CurrentPage"].ToString()) + "';</script>");
            }
            else
            {
                // 系统管理员可管理所有的学生信息
                if (Session["role"].ToString() == "0")
                    Session["CurrentPage"] = "EditStudent.aspx";

                // 分管教学领导可管理本院系学生信息
                else if (Session["role"].ToString() == "1")
                {
                    string department = Session["department"].ToString().Replace(" ", "");
                    SqlDataSource1.SelectCommand =
                        "SELECT * FROM student WHERE student.dept = '" + department + "'";
                    Session["CurrentPage"] = "EditStudent.aspx";
                }

                // 教务秘书可管理本院系学生信息
                else if (Session["role"].ToString() == "2")
                {
                    string department = Session["department"].ToString().Replace(" ", "");
                    SqlDataSource1.SelectCommand =
                        "SELECT * FROM student WHERE student.dept = '" + department + "'";
                    Session["CurrentPage"] = "EditStudent.aspx";
                }

                // 学生可管理自己的信息
                else if (Session["role"].ToString() == "4")
                {
                    string sno = Session["sno"].ToString().Replace(" ", "");
                    SqlDataSource1.SelectCommand =
                        "SELECT * FROM student WHERE student.sno = '" + sno + "'";
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
    }
}