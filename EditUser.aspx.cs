using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudbManage
{
    public partial class EditUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Session["role"] == null)  // 用户未登录
            {
                //Response.Write("<script>window.location='Login.aspx?msg=" + Server.UrlEncode("您不是合法用户，请登入后再操作！") + "';</script>");
                //ClientScript.RegisterStartupScript(GetType(), "error", "<script>window.location='Login.aspx?msg=" + Server.UrlEncode("您不是合法用户，请登入后再操作！") + "';</script>");
                //Response.Write("<script>alert('您不是合法用户，请登入后再操作！');</script>");
                Response.Redirect("Login.aspx?msg=" + Server.UrlEncode("您不是合法用户，请登入后再操作！"));
            }
            else if (Session["role"].ToString() != "0")  // 只有管理员可以打开本页面
            {
                //Response.Write("<script>window.location='" + Session["CurrentPage"].ToString() + "?msg=" + Server.UrlEncode("您不是管理员，不能打开该编辑系统用户页面！") + "';</script>");
                //ClientScript.RegisterStartupScript(GetType(), "error", "<script>window.location='" + Session["CurrentPage"].ToString() + "?msg=" + Server.UrlEncode("您不是管理员，不能打开该编辑系统用户页面！") + "';</script>");
                Response.Redirect(Session["CurrentPage"].ToString() + "?msg=" + Server.UrlEncode("您不是管理员，不能打开该编辑系统用户页面！"));
            }
            else
            {
                //string msg = Request.QueryString["msg"];
                //if (!string.IsNullOrEmpty(msg)) ClientScript.RegisterStartupScript(GetType(), "error", "<script>alert('" + msg + "');</script>");
                Session["CurrentPage"] = "EditUser.aspx";
            }
        }

        protected string RoleCodeToName(string RoleCode)
        {
            string RoleName = "";
            if (RoleCode == "0") RoleName = "系统管理员";
            else if (RoleCode == "1") RoleName = "分管学院领导";
            else if (RoleCode == "2") RoleName = "教务秘书";
            else if (RoleCode == "3") RoleName = "教师";
            else if (RoleCode == "4") RoleName = "学生";
            return RoleName;
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            string SearchType = ddlSearch.SelectedValue;
            if (SearchType == "userid")    // 按账号查询
            {
                
                    SqlDataSource1.SelectCommand =
                        "Select * FROM users WHERE users.userid like '%" + txtSearch.Text + "%'";
              
            }

            else if (SearchType == "name")    // 按名字查询
            {
                
                    SqlDataSource1.SelectCommand =
                        "Select * FROM users WHERE users.name like '%" + txtSearch.Text + "%'";
               
            }

            else if (SearchType == "department")    // 按院系查询
            {
              
                    SqlDataSource1.SelectCommand =
                        "Select * FROM users WHERE users.department like '%" + txtSearch.Text + "%'";
              
            }
        }
    }
}