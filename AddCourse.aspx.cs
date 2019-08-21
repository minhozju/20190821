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
    public partial class AddCourse : System.Web.UI.Page
    {
        SqlConnection cn = null;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Session["role"] == null)  // 用户未登录
            {

                Response.Redirect("Login.aspx?msg=" + Server.UrlEncode("您不是合法用户，请登入后再操作！"));
            }
            else if (!(Session["role"].ToString() == "0" || Session["role"].ToString() == "1" || Session["role"].ToString() == "2"))  // 只有用户表成员可以打开本页面
            {

                Response.Redirect(Session["CurrentPage"].ToString() + "?msg=" + Server.UrlEncode("您不是用户表成员，不能打开该编辑课程页面！"));
            }
            else
            {
                Session["CurrentPage"] = "AddCourse.aspx";
            }
            string strconn = ConfigurationManager.ConnectionStrings["studbConnectionString"].ConnectionString;
            cn = new SqlConnection(strconn);
        }

        // 检查输入的“课程号”是否在course表中存在，如果存在，则验证失败，否则验证通过
        // 注意，自定义控件的验证是在服务器端执行的
        protected void cvID_ServerValidate(object source, ServerValidateEventArgs args)
        {
            cn.Open();
            string strsql = "SELECT * FROM course WHERE cno=@cno";
            SqlCommand cm = new SqlCommand(strsql, cn);
            cm.Parameters.Add(new SqlParameter("@cno", SqlDbType.VarChar,10));
            cm.Parameters["@cno"].Value = txtCno.Text;

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

                string strsql = "INSERT INTO course(cno,tno,cname,semester,lecture,credit) VALUES(@cno,@tno,@cname,@semester,@lecture,@credit)";
                SqlCommand cm = new SqlCommand(strsql, cn);

                cm.Parameters.Add(new SqlParameter("@cno", SqlDbType.NVarChar));
                cm.Parameters.Add(new SqlParameter("@tno", SqlDbType.NVarChar));
                cm.Parameters.Add(new SqlParameter("@cname", SqlDbType.NChar, 20));
                cm.Parameters.Add(new SqlParameter("@semester", SqlDbType.Int));
                cm.Parameters.Add(new SqlParameter("@lecture", SqlDbType.Int));
                cm.Parameters.Add(new SqlParameter("@credit", SqlDbType.Int));

                cm.Parameters["@cno"].Value = txtCno.Text;
                cm.Parameters["@tno"].Value = ddlTno.SelectedItem.Value;
                cm.Parameters["@cname"].Value = txtCname.Text;
                cm.Parameters["@semester"].Value = txtSemester.Text;
                cm.Parameters["@lecture"].Value = txtLecture.Text;
                cm.Parameters["@credit"].Value = txtCredit.Text;

                try
                {
                    cm.ExecuteNonQuery();
                    cn.Close();
                    Response.Redirect("EditCourse.aspx");

                }
                catch (SqlException ex)
                {
                    //lblTooltip.Text = "添加失败";
                    lblTooltip.Text = ex.Message;
                }
                cn.Close();
            }
        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditCourse.aspx");
        }
    }
}