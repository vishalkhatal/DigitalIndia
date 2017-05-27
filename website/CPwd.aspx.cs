using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string qry = "update userinfo set pwd='" + TextBox1.Text + "' where mailid='" + Session["mailid"]+"'";
        int i = _Database.NonSelectQuery(qry);
        if (i == 1)
            smsg.Text = "Password changed successfully";
        else
            smsg.Text = _Database.LastError;
        TextBox1.Text = "";
        TextBox2.Text = "";
    }
}