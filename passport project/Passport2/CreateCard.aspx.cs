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
    static string ct = "";
    static string name = "";
    static string fname = "";
    static string dob = "";
    static string imgname = "";
    static string imgname2 = "";
    static DateTime dttm;

    void getAppInfo(string appid)
    {
        DataTable dt = _Database.SelectQuery("select * from userappinfo where appid='" + appid + "'");
        if (dt != null && dt.Rows.Count == 1)
        {        
            un = dt.Rows[0]["mailid"].ToString();
            ct = dt.Rows[0]["apptype"].ToString();
            name = dt.Rows[0]["fname"].ToString() + " " + dt.Rows[0]["lname"].ToString();
            fname = dt.Rows[0]["fmname"].ToString();
            dob = dt.Rows[0]["udob"].ToString().Replace(" 12.00.00", "");
            dttm = (DateTime)dt.Rows[0]["udob"];
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
        if (ct == "Pan Card")
        {
            dob = dttm.Day + "/" + dttm.Month + "/" + dttm.Year;
            string panno = _Programs.GetPanNo(10);
            
            CardTemp.createPan(name, fname, dob, panno, imgname, imgname2 + ".png");            
        }
        else if (ct == "Id Card")
        {
            string[] month = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
            dob = dttm.Day + "th " + month[dttm.Month].ToUpper() + ", " + dttm.Year;
            
            CardTemp.createID(name, dob, imgname, imgname2 + ".png");
        }

        string ccdt = DateTime.Now.ToShortDateString();
        string qry = "update userappinfo set appstatus='Done', ccdt=datevalue('" + ccdt + "') where appid='" + appid + "'";
        int i = _Database.NonSelectQuery(qry);

        if (i == 1)
        {
            smsg.Text = "<b>The Card has been generated successfullY</b>";
            //Response.Redirect("VerifiedList.aspx");
        }
        else
        {
            smsg.Text = "<b>Error: </b>" + _Database.LastError;
        }
    }

}