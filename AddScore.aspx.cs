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
    public partial class AddScore : System.Web.UI.Page
    {
        SqlConnection cn = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Session["role"] == null)  // 用户未登录
            {

                Response.Redirect("Login.aspx?msg=" + Server.UrlEncode("您不是合法用户，请登入后再操作！"));
            }
            else if (!(Session["role"].ToString() == "0"
        || Session["role"].ToString() == "3"))  // 只有管理员、教师可以打开本页面
            {
                Response.Write("<script>alert('您不是管理员、教师，不能打开该页面！');window.location='" + Server.UrlEncode(Session["CurrentPage"].ToString()) + "';</script>");
            }
            else
            {
                Session["CurrentPage"] = "AddScore.aspx";
            }
            string strconn = ConfigurationManager.ConnectionStrings["studbConnectionString"].ConnectionString;
            cn = new SqlConnection(strconn);
        }
     

        // 使用SQL语句在student_course表中插入一条记录
        protected void btnOK_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                cn.Open();
                //检查该学生是否已上过此课程，如果有则不可插入
                string test1 = "SELECT * FROM student_course WHERE sno=@sno and cno=@cno";
              

                SqlCommand testcm1 = new SqlCommand(test1, cn);

                testcm1.Parameters.Add(new SqlParameter("@cno", SqlDbType.NVarChar));
                testcm1.Parameters.Add(new SqlParameter("@sno", SqlDbType.NVarChar));

                testcm1.Parameters["@cno"].Value = ddlCno.SelectedItem.Value;
                testcm1.Parameters["@sno"].Value = ddlSno.SelectedItem.Value;

                SqlDataReader dr1 = testcm1.ExecuteReader();
                if (dr1.Read())
                {
                    lblTooltip.Text = "数据重复";
                    return;
                }
                cn.Close();

              
                //插入数据
                cn.Open();

                string strsql = "INSERT INTO student_course(cno,sno,score) VALUES(@cno,@sno,@score)";
                SqlCommand cm = new SqlCommand(strsql, cn);

                cm.Parameters.Add(new SqlParameter("@cno", SqlDbType.NVarChar));
                cm.Parameters.Add(new SqlParameter("@sno", SqlDbType.NVarChar));
                cm.Parameters.Add(new SqlParameter("@score", SqlDbType.Int));

                string tmp =txtScore.Text.Replace(" ", "");

                cm.Parameters["@cno"].Value = ddlCno.SelectedItem.Value;
                cm.Parameters["@sno"].Value = ddlSno.SelectedItem.Value;
                cm.Parameters["@score"].Value = tmp;

   
                try
                {
                    cm.ExecuteNonQuery();
                    cn.Close();
                    Response.Redirect("EditScore.aspx");

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
            Response.Redirect("EditTeacher.aspx");
        }

        // 检查输入的“课程号”是否在course表中是该教师所授，如果是，则验证成功，否则失败
        // 注意，自定义控件的验证是在服务器端执行的
        protected void rfvTeacher_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Session["role"].ToString() == "0")
            {
                args.IsValid = true;
            }
            if(Session["role"].ToString()=="3")
            {
                cn.Open();
                string strsql = "SELECT * FROM course WHERE cno=@cno and tno=@tno";
                SqlCommand cm = new SqlCommand(strsql, cn);
                cm.Parameters.Add(new SqlParameter("@cno", SqlDbType.VarChar));
                cm.Parameters.Add(new SqlParameter("@tno", SqlDbType.VarChar));
                cm.Parameters["@cno"].Value = ddlCno.SelectedItem.Value;
                cm.Parameters["@tno"].Value = Session["tno"].ToString();

                SqlDataReader dr = cm.ExecuteReader();
                args.IsValid = dr.Read();
                cn.Close();
            }
        }
    }
}