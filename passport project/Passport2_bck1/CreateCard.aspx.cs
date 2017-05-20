using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class CreateCard : System.Web.UI.Page
{
    static string un = "";
    static string imgname = "";
    static string imgname2 = "";

    void getAppInfo(string appid)
    {
        DataTable dt = _Database.SelectQuery("select * from userappinfo where appid='" + appid + "'");
        if (dt != null && dt.Rows.Count == 1)
        {        
            un = dt.Rows[0]["mailid"].ToString();
            imgname = Server.MapPath("users") + "\\" + un + "\\" + dt.Rows[0]["uphoto"].ToString();
            FileInfo ff = new FileInfo(imgname);
            imgname2 = ff.FullName.Replace(ff.Name, "");
            imgname2 = imgname2 + appid;
        }
    }

    static string appid = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        un = Session["mailid"].ToString();
        appid = Request.QueryString["appid"];

        if (!IsPostBack)
        {
            getAppInfo(appid);
            Label1.Text = "<h1>Are you sure, do you want to create card?</h1>";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        System.Drawing.Image img = System.Drawing.Image.FromFile(imgname);
        Watermarker wm = new Watermarker(img);
        if (wm != null)
        {
            wm.Font = new System.Drawing.Font("Times New Roman", 36, System.Drawing.FontStyle.Italic);
            wm.Opacity = 1.0f;
            wm.Position = WatermarkPosition.Center;
            wm.DrawText(appid);
            wm.SaveImage(imgname2 + ".png");

            string qry = "update userappinfo set appstatus='Done' where appid='" + appid + "'";
            int i = _Database.NonSelectQuery(qry);

            if (i == 1)
            {
                smsg.Text = "<b>The form has been verified</b>";
                Response.Redirect("VerifiedList.aspx");
            }
            else
            {
                smsg.Text = "<b>Error: </b>" + _Database.LastError;
            }
        }
        else
        {
            smsg.Text = "<b>Error: </b>";
        }
    }

}