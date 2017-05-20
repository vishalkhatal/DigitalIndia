using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class SubmitProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        byte[] file1 = FileUpload1.FileBytes;

        string appid = txtUN.Text;
        string un = txtMail.Text;

        string path = Server.MapPath("users") + "\\" + un + "\\" + appid + ".png";

        bool st = _Programs.FileCompare2(file1, path);

        if (st)
            smsg.Text = "<b>Image verified successfully</b>";
        else
            smsg.Text = "<b>Invalid Image</b>";
    }
}