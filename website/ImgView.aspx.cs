using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImgView : System.Web.UI.Page
{
    string un = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        string appid = Request.QueryString["appid"];
        un=Session["mailid"].ToString();
        Image1.ImageUrl = "~/users/" + un + "/" + appid + ".png";
    }
}