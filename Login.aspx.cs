using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data.SqlClient;

namespace StudbManage
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            //string msg = Request.QueryString["msg"];
            //if (!string.IsNullOrEmpty(msg)) ClientScript.RegisterStartupScript(GetType(), "error", "<script>alert('" + msg + "');</script>");
            Session["role"] = null;
            Session["department"] = null;
            Session["userid"] = null;
            Session["sno"] = null;
            Session["tno"] = null;
            Session["CurrentPage"] = "Login.aspx";
            ibtn_yzm.ImageUrl = "ImageCode.aspx";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //验证验证码
            string code = tbx_yzm.Text;
            HttpCookie htco = Request.Cookies["ImageV"];
            string scode = htco.Value.ToString();
            if (code != scode)
            {
                Response.Redirect("Login.aspx?msg=" + Server.UrlEncode("验证码输入不正确!"));
            }
            //验证账号和密码
            string UserName = txtUserName.Text.Replace("'", "''");
            string Password = txtPassword.Text.Replace("'", "''");
            string Type = ddlType.SelectedItem.Value;

            string strconn = ConfigurationManager.ConnectionStrings["studbConnectionString"].ConnectionString;

            SqlConnection conn = new SqlConnection(strconn);
            if (Type.Equals("0"))
            {
                conn.Open();
                string strsql = string.Format("SELECT * FROM users WHERE userid='{0}' AND password='{1}'", UserName, Password);
                //Response.Write(strsql);
                //return;

                SqlCommand cm = new SqlCommand(strsql, conn);
                SqlDataReader dr = cm.ExecuteReader();
                if (dr.Read())
                {
                    Session["userid"] = dr["userid"];
                    Session["department"] = dr["department"];
                    Session["role"] = dr["role"];              // 保存用户权限
                    if (Session["role"].ToString() == "0")       // 系统管理员登录
                    {
                        Response.Redirect("Edituser.aspx?msg=" + Server.UrlEncode("欢迎您!"+dr["name"]+"  现在的时间是"+ DateTime.Now));          // 打开“用户管理”页面
                    }
                    else if (Session["role"].ToString() == "1")  // 分管学院领导人员登录
                    {
                        Response.Redirect("SearchStudent.aspx?msg=" + Server.UrlEncode("欢迎您!" + dr["name"] + "  现在的时间是" + DateTime.Now));       // 打开“学生查询”页面
                    }
                    else if (Session["role"].ToString() == "2")  // 教务秘书人员登录
                    {
                        Response.Redirect("EditStudent.aspx?msg=" + Server.UrlEncode("欢迎您!" + dr["name"] + "  现在的时间是" + DateTime.Now));        // 打开“学生管理”页面
                    }
                }
                else
                    lblNote.Text = "用户名或密码不正确，登录失败！";
            }
           
            conn.Close();
            if (Type.Equals("3"))
            {
                conn.Open();
                string strsql = string.Format("SELECT * FROM teacher WHERE tno='{0}' AND password='{1}'", UserName, Password);
                //Response.Write(strsql);
                //return;

                SqlCommand cm = new SqlCommand(strsql, conn);
                SqlDataReader dr = cm.ExecuteReader();
                if (dr.Read())
                {
                    Session["role"] = dr["role"];
                    Session["tno"] = dr["tno"];
                    // 保存用户权限
                    if (Session["role"].ToString() == "3")       // 教师登陆
                    {
                        Response.Redirect("EditTeacher.aspx?msg=" + Server.UrlEncode("欢迎您!" + dr["tname"] + "  现在的时间是" + DateTime.Now));          // 打开“教师管理”页面
                    }

                }
                else
                    lblNote.Text = "用户名或密码不正确，登录失败！";
            }
            conn.Close();
            if (Type.Equals("4"))
            {
                conn.Open();
                string strsql = string.Format("SELECT * FROM student WHERE sno='{0}' AND password='{1}'", UserName, Password);
                //Response.Write(strsql);
                //return;

                SqlCommand cm = new SqlCommand(strsql, conn);
                SqlDataReader dr = cm.ExecuteReader();
                if (dr.Read())
                {
                    Session["role"] = dr["role"];              // 保存用户权限
                    Session["sno"] = dr["sno"];
                    if (Session["role"].ToString() == "4")       // 学生登陆
                    {
                        Response.Redirect("SelfEditStudent.aspx?msg=" + Server.UrlEncode("欢迎您!" + dr["sname"] + "  现在的时间是" + DateTime.Now));          // 打开“学生自我更新”页面
                    }

                }
                else
                    lblNote.Text = "用户名或密码不正确，登录失败！";
            }

        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ibtn_yzm_Click(object sender, ImageClickEventArgs e)
        {

        }

    }
}