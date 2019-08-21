using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudbManage
{
    public partial class EditCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Session["role"] == null)  // 用户未登录
            {
                
                Response.Redirect("Login.aspx?msg=" + Server.UrlEncode("您不是合法用户，请登入后再操作！"));
            }
            else if (!(Session["role"].ToString() == "0"|| Session["role"].ToString()=="1" || Session["role"].ToString() == "2"))  // 只有用户表成员可以打开本页面
            {
                
                Response.Redirect(Session["CurrentPage"].ToString() + "?msg=" + Server.UrlEncode("您不是用户表成员，不能打开该编辑课程页面！"));
            }
            else
            {
                Session["CurrentPage"] = "EditCourse.aspx";
            }
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            string SearchType = ddlSearch.SelectedValue;
            if (SearchType == "cname")    // 按课程名查询
            {

                SqlDataSource1.SelectCommand =
                    "Select * FROM course WHERE cname like '%" + txtSearch.Text + "%'";

            }
        }

    }
}