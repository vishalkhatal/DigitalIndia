using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class ViewForm : System.Web.UI.Page
{
    static string un = "";
    static string imgname = "";
    static string imgname2 = "";

    string[] cols = { "First Name", "Last Name", "Father or Mother Name", "Gender", "Date Of Birth", "Address", "City", "Pincode", "State", "Photo" };
    string[] cols2 = { "fname", "lname", "fmname", "Gender", "udob", "addr1", "City", "Pincode", "State", "uPhoto" };

    void getAppInfo(string appid)
    {
        DataTable dt = _Database.SelectQuery("select * from userappinfo where appid='" + appid + "'");
        if (dt != null && dt.Rows.Count == 1)
        {

            DataTable tdt = new DataTable();
            tdt.Columns.Add("cn");
            tdt.Columns.Add("cv");

            DataRow dr;

            for (int i = 0; i < cols.Length; i++)
            {
                dr = tdt.NewRow();
                dr[0] = cols[i];
                dr[1] = dt.Rows[0][cols2[i]].ToString().Replace("12.00.00 AM", "");
                tdt.Rows.Add(dr);
            }            

            Repeater1.DataSource = tdt;
            Repeater1.DataBind();

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
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        System.Drawing.Image img = System.Drawing.Image.FromFile(imgname);
        Watermarker wm = new Watermarker(img);
        if (wm != null)
        {
            wm.Font = new System.Drawing.Font("Times New Roman", 27, System.Drawing.FontStyle.Italic);
            wm.Opacity = 1.0f;
            wm.Position = WatermarkPosition.Center;
            wm.DrawText(appid);
            wm.SaveImage(imgname2 + ".png");

            string qry = "update userappinfo set appstatus='Verified' where appid='" + appid + "'";
            _Database.NonSelectQuery(qry);

            smsg.Text = "<b>The form has been verified";
        }
        else
        {
            smsg.Text = "<b>Not Verified</b>";
        }
    }
}