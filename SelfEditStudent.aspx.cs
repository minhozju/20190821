using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudbManage
{
    public partial class SelfEditStudent : System.Web.UI.Page
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
            else if (!(Session["role"].ToString() == "4"||Session["role"].ToString()=="0"
        ))  // 只有管理员，学生可以打开本页面
            {
                Response.Write("<script>alert('您不是管理员，学生，不能打开该页面！');window.location='" + Server.UrlEncode(Session["CurrentPage"].ToString()) + "';</script>");
            }
            else
            {
                // 系统管理员可管理所有的学生信息
                if (Session["role"].ToString() == "0")
                    Session["CurrentPage"] = "SelfEditStudent.aspx";

                // 学生可管理自己的学生信息
                else if (Session["role"].ToString() == "4")
                {
                    string sno = Session["sno"].ToString().Replace(" ", "");
                    SqlDataSource1.SelectCommand =
                        "SELECT * FROM student WHERE student.sno = '" + sno + "'";
                    Session["CurrentPage"] = "SelfEditStudent.aspx";
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