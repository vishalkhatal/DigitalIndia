using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DelForm : System.Web.UI.Page
{
    static string appid = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        appid = Request.QueryString["appid"];
        Button1.Enabled = false;
        if (!string.IsNullOrEmpty(appid))
        {
            Label1.Text = "<h1>Are you sure, Do you want to delete application?<br><br><u>" + appid + "</u></h1>";
            Button1.Enabled = true;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string qq = "delete from userappinfo where appid='" + appid + "'";
        int i = _Database.NonSelectQuery(qq);
        if (i == 1)
            Response.Redirect("Listallforms.aspx");        
    }
}