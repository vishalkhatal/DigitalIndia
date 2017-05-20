using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class NewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string qry = "insert into UserInfo(DName,mailid,pwd) values('" + txtUN.Text + "','" + txtMailid.Text + "','" + txtPwd.Text + "')";
        int i = _Database.NonSelectQuery(qry);
        if (i == 1)
        {
            string upath = Server.MapPath("users");
            upath += "\\" + txtMailid.Text;
            Directory.CreateDirectory(upath);
            smsg.Text = "<b><u>"+txtMailid.Text+"</u> user created successfully</b>";
        }
        else
        {
            smsg.Text = "Error : " + _Database.LastError;
        }
    }
}