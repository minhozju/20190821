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
    public partial class EditPassword : System.Web.UI.Page
    {
        SqlConnection cn = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Session["role"] == null)  // 用户未登录
            { 
                Response.Redirect("Login.aspx?msg=" + Server.UrlEncode("您不是合法用户，请登入后再操作！"));
            }
            else
            {
                
            }
            string strconn = ConfigurationManager.ConnectionStrings["studbConnectionString"].ConnectionString;
            cn = new SqlConnection(strconn);

        }


        protected void btnOK_Click(object sender, EventArgs e)
        {
            if(HiddenField1.Value == "2"||HiddenField1.Value == "3") {}
            else
            {
                lblTooltip.Text = "密码强度至少要达到中且长度至少为六";
                return;
            }
            if (Session["role"].ToString() == "0" || Session["role"].ToString() == "1" || Session["role"].ToString() == "2")
            {
                if (Page.IsValid)
                {
                    cn.Open();

                    string strsql = "UPDATE users set password = '" + txtPassword.Text + "' WHERE userid = '" + Session["userid"].ToString() + "'";
                    SqlCommand cm = new SqlCommand(strsql, cn);

                    try
                    {
                        cm.ExecuteNonQuery();
                        cn.Close();
                        ClientScript.RegisterStartupScript(this.GetType(), null, "<script>alert('密码修改成功')</script>");
                       

                    }
                    catch (SqlException ex)
                    {
                        lblTooltip.Text = "修改失败";
                        //lblTooltip.Text = ex.Message;
                    }
                    cn.Close();
                }
            }
            if (Session["role"].ToString() == "3")
            {
                cn.Open();

                string strsql = "UPDATE teacher set password = '" + txtPassword.Text + "' WHERE tno = '" + Session["tno"].ToString() + "'";
                SqlCommand cm = new SqlCommand(strsql, cn);

                try
                {
                    cm.ExecuteNonQuery();
                    cn.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), null, "<script>alert('密码修改成功')</script>");

                }
                catch (SqlException ex)
                {
                    lblTooltip.Text = "修改失败";
                    //lblTooltip.Text = ex.Message;
                }
                cn.Close();
            }
            if (Session["role"].ToString() == "4")
            {
                cn.Open();

                string strsql = "UPDATE student set password = '" + txtPassword.Text + "' WHERE sno = '" + Session["sno"].ToString() + "'";
                SqlCommand cm = new SqlCommand(strsql, cn);

                try
                {
                    cm.ExecuteNonQuery();
                    cn.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), null, "<script>alert('密码修改成功')</script>");

                }
                catch (SqlException ex)
                {
                    lblTooltip.Text = "修改失败";
                    //lblTooltip.Text = ex.Message;
                }
                cn.Close();
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect(Session["CurrentPage"].ToString());
        }
    }
}