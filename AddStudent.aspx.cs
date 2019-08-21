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
    public partial class AddStudent : System.Web.UI.Page
    {
        SqlConnection cn = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Session["role"] == null)  // 用户未登录
            {
               
                Response.Redirect("Login.aspx?msg=" + Server.UrlEncode("您不是合法用户，请登入后再操作！"));
            }
            else if (!(Session["role"].ToString() == "0" || Session["role"].ToString ()=="2"))  // 只有管理员，教务秘书可以打开本页面
            {
                
                Response.Redirect(Session["CurrentPage"].ToString() + "?msg=" + Server.UrlEncode("您不是管理员，教务秘书，不能打开该新增学生页面！"));
            }
            else
            {
                
                Session["CurrentPage"] = "AddStudent.aspx";
            }

            string strconn = ConfigurationManager.ConnectionStrings["studbConnectionString"].ConnectionString;
            cn = new SqlConnection(strconn);
        }

        protected void cvID_ServerValidate(object source, ServerValidateEventArgs args)
        {
            cn.Open();
            string strsql = "SELECT * FROM student WHERE sno=@sno";
            SqlCommand cm = new SqlCommand(strsql, cn);
            cm.Parameters.Add(new SqlParameter("@sno", SqlDbType.VarChar));
            cm.Parameters["@sno"].Value = txtSno.Text;

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

                string strsql = "INSERT INTO student(sno,sname,sex,birthday,dept,spno,classno,password,role) VALUES(@sno,@sname,@sex,@birthday,@dept,@spno,@classno,@password,@role)";
                SqlCommand cm = new SqlCommand(strsql, cn);

                cm.Parameters.Add(new SqlParameter("@sno", SqlDbType.NVarChar));
                cm.Parameters.Add(new SqlParameter("@sname", SqlDbType.NVarChar));
                cm.Parameters.Add(new SqlParameter("@sex", SqlDbType.NVarChar));
                cm.Parameters.Add(new SqlParameter("@birthday", SqlDbType.Date));
                cm.Parameters.Add(new SqlParameter("@dept", SqlDbType.NVarChar));
                cm.Parameters.Add(new SqlParameter("@spno", SqlDbType.NVarChar));
                cm.Parameters.Add(new SqlParameter("@classno", SqlDbType.NVarChar));
                cm.Parameters.Add(new SqlParameter("@password", SqlDbType.NVarChar));
                cm.Parameters.Add(new SqlParameter("@role", SqlDbType.Int, 1));

                cm.Parameters["@sno"].Value = txtSno.Text;
                cm.Parameters["@sname"].Value = txtSname.Text;
                cm.Parameters["@sex"].Value = txtSex.Text;
                cm.Parameters["@birthday"].Value = CalendarBirthday.SelectedDate;
                cm.Parameters["@dept"].Value = ddlDept.SelectedItem.Value;
                if(ddlDept.SelectedItem.Value == "计算机系")
                {
                    cm.Parameters["@spno"].Value = "09";
                }
                if (ddlDept.SelectedItem.Value == "信计系")
                {
                    cm.Parameters["@spno"].Value ="06";
                }
                if (ddlDept.SelectedItem.Value == "网络系")
                {
                    cm.Parameters["@spno"].Value = "08";
                }
                if (ddlDept.SelectedItem.Value == "")
                {
                    cm.Parameters["@spno"].Value = "";
                }
                cm.Parameters["@classno"].Value = txtClassno.Text;
                cm.Parameters["@password"].Value = txtPassword.Text;
                cm.Parameters["@role"].Value = "4";

                try
                {
                    cm.ExecuteNonQuery();
                    cn.Close();
                    Response.Redirect("EditStudent.aspx");

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
            Response.Redirect("EditStudent.aspx");
        }

        protected void cvdepartment_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Session["role"].ToString() == "2")
            {
                if (ddlDept.SelectedItem.Value == Session["department"].ToString())
                {
                    args.IsValid= true;
                }
                else { args.IsValid = false; }
            }
            else if (Session["role"].ToString() == "0")
            {
                args.IsValid = true;
            }
        }
    }
}
