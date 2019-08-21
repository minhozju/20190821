using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudbManage
{
    public partial class EditTeacher : System.Web.UI.Page
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
            else
            {
                Session["CurrentPage"] = "EditTeacher.aspx";
            }
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            string SearchType = ddlSearch.SelectedValue;
            if (SearchType == "tno")    // 按教工号查询
            {
                
                    SqlDataSource1.SelectCommand =
                        "Select * FROM teacher WHERE teacher.tno like '%" + txtSearch.Text + "%'";
               
            }

            else if (SearchType == "tname")    // 按名字查询
            {
                
                    SqlDataSource1.SelectCommand =
                        "Select * FROM teacher WHERE teacher.tname like '%" + txtSearch.Text + "%'";
               

            }

            else if (SearchType == "department")    // 按院系查询
            {
               
                    SqlDataSource1.SelectCommand =
                        "Select * FROM teacher WHERE teacher.department like '%" + txtSearch.Text + "%'";
              
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}