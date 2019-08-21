using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudbManage
{

    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ContentPlaceHolder1_PreRender(object sender, EventArgs e)
        {
            string msg = Request.QueryString["msg"];
            if (!string.IsNullOrEmpty(msg)) Page.ClientScript.RegisterStartupScript(GetType(), "error", "<script>alert('" + msg + "');</script>");
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

        protected void Menu1_MenuItemClick1(object sender, MenuEventArgs e)
        {

        }
    }
}
