using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class ViewCard : System.Web.UI.Page
{
    string appid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        appid = Request.QueryString["appid"];
        if (!string.IsNullOrEmpty(appid))
        {
            DataTable dt = _Database.SelectQuery("select * from userappinfo where appid='" + appid + "'");
            if (dt != null && dt.Rows.Count == 1)
            {
                string un = dt.Rows[0]["mailid"].ToString();
                string imgname = "users/" + un + "/";
                imgname = imgname + appid + ".png";
                Label1.Text = "<img src='" + imgname + "' />";
            }
        }
    }
}