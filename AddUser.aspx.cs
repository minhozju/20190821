using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace StudbManage
{
    public partial class AddUser : System.Web.UI.Page
    {
        SqlConnection cn = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Session["role"] == null)  // 用户未登录
            {
                //Response.Write("您不是合法用户，请登入后再操作，<a href='Login.aspx'>返回登录</a>");
                //ClientScript.RegisterStartupScript(GetType(), "error", "<script>window.location='Login.aspx?msg=" + Server.UrlEncode("您不是合法用户，请登入后再操作！") + "';</script>");
                //Response.Write("<script>alert('您不是合法用户，请登入后再操作！');window.location='Login.aspx';</script>");
                Response.Redirect("Login.aspx?msg=" + Server.UrlEncode("您不是合法用户，请登入后再操作！"));
            }
            else if (Session["role"].ToString() != "0")  // 只有管理员可以打开本页面
            {
                //Response.Write("<script>alert('您不是管理员，不能打开该页面！');window.location='" + Server.UrlEncode(Session["CurrentPage"].ToString()) + "';</script>");
                //ClientScript.RegisterStartupScript(GetType(), "error", "<script>window.location='" + Session["CurrentPage"].ToString() + "?msg=" + Server.UrlEncode("您不是管理员，不能打开该新增系统用户页面！") + "';</script>");
                Response.Redirect(Session["CurrentPage"].ToString() + "?msg=" + Server.UrlEncode("您不是管理员，不能打开该新增系统用户页面！"));
            }
            else
            {
                //string msg = Request.QueryString["msg"];
                //if (!string.IsNullOrEmpty(msg)) ClientScript.RegisterStartupScript(GetType(), "error", "<script>alert('" + msg + "');</script>");
                Session["CurrentPage"] = "AddUser.aspx";
            }

            string strconn = ConfigurationManager.ConnectionStrings["studbConnectionString"].ConnectionString;
            cn = new SqlConnection(strconn);
        }

        // 检查输入的“用户ID”是否在users表中存在，如果存在，则验证失败，否则验证通过
        // 注意，自定义控件的验证是在服务器端执行的
        protected void cvID_ServerValidate(object source, ServerValidateEventArgs args)
        {
            cn.Open();
            string strsql = "SELECT * FROM users WHERE userid=@userid";
            SqlCommand cm = new SqlCommand(strsql, cn);
            cm.Parameters.Add(new SqlParameter("@userid", SqlDbType.VarChar));
            cm.Parameters["@userid"].Value = txtUserid.Text;

            SqlDataReader dr = cm.ExecuteReader();
            args.IsValid = !dr.Read();
            cn.Close();
        }

        // 使用SQL语句在users表中插入一条记录
        protected void btnOK_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                cn.Open();

                string strsql = "INSERT INTO users(userid,password,name,email,department,role) VALUES(@userid,@password,@name,@email,@department,@role)";
                SqlCommand cm = new SqlCommand(strsql, cn);

                cm.Parameters.Add(new SqlParameter("@userid", SqlDbType.NVarChar));
                cm.Parameters.Add(new SqlParameter("@password", SqlDbType.NVarChar));
                cm.Parameters.Add(new SqlParameter("@name", SqlDbType.NChar, 10));
                cm.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar));
                cm.Parameters.Add(new SqlParameter("@department", SqlDbType.NVarChar));
                cm.Parameters.Add(new SqlParameter("@role", SqlDbType.Int, 1));

                cm.Parameters["@userid"].Value = txtUserid.Text;
                cm.Parameters["@password"].Value = txtPassword.Text;
                cm.Parameters["@name"].Value = txtName.Text;
                cm.Parameters["@email"].Value = txtEmail.Text;
                cm.Parameters["@department"].Value = ddlDepartment.SelectedItem.Value;
                cm.Parameters["@role"].Value = ddlRole.SelectedItem.Value;

                try
                {
                    cm.ExecuteNonQuery();
                    cn.Close();
                    Response.Redirect("EditUser.aspx");

                }
                catch (SqlException ex)
                {
                    lblTooltip.Text = "添加失败";
                    //lblTooltip.Text = ex.Message;
                }
                cn.Close();
            }
        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditUser.aspx");
        }
    }
}