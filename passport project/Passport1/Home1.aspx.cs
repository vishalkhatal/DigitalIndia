using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Home1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string spath = Server.MapPath("");
        spath += "/App_Data/passport1.mdb";
        _Database.CreateConnection("System.Data.OleDb", "Provider=Microsoft.Jet.OleDb.4.0;data source=" + spath);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string qry = "select * from UserInfo where mailid='" + txtMailid.Text + "' and pwd='" + txtPwd.Text + "'";
        DataTable dt = _Database.SelectQuery(qry);
        if (dt != null && dt.Rows.Count == 1)
        {
            if (txtMailid.Text == "admin@admin.com")
            {
                Session["mailid"] = txtMailid.Text;
                smsg.Text = "Login Successful";
                Response.Redirect("listallforms2.aspx");
            }
            else
            {
                Session["mailid"] = txtMailid.Text;
                smsg.Text = "Login Successful";
                Response.Redirect("listallforms.aspx");
            }            
        }
        else
        {
            smsg.Text = "Error : " + _Database.LastError;
        }
    }
}