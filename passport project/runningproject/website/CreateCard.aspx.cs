using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Threading;

public partial class CreateCard : System.Web.UI.Page
{
    static string un = "";
    static string un2 = "";
    static string ct = "";
    static string name = "";
    static string fname = "";
    static string fname2 = "";
    static string lname = "";
    static string gender = "";
    static string city = "";
    static string dob = "";
    static string imgname = "";
    static string imgname2 = "";
    static DateTime dttm;

    void getAppInfo(string appid)
    {
        DataTable dt = _Database.SelectQuery("select * from userappinfo where appid='" + appid + "'");
        if (dt != null && dt.Rows.Count == 1)
        {        
            un2 = dt.Rows[0]["mailid"].ToString();
            ct = dt.Rows[0]["apptype"].ToString();
            name = dt.Rows[0]["fname"].ToString() + " " + dt.Rows[0]["lname"].ToString();
            fname = dt.Rows[0]["fmname"].ToString();
            fname2 = dt.Rows[0]["fname"].ToString();
            lname = dt.Rows[0]["lname"].ToString();
            gender = dt.Rows[0]["gender"].ToString();
            city = dt.Rows[0]["city"].ToString();
            dob = dt.Rows[0]["udob"].ToString().Replace(" 12.00.00", "");
            dttm = (DateTime)dt.Rows[0]["udob"];
            imgname = Server.MapPath("users") + "\\" + un2 + "\\" + dt.Rows[0]["uphoto"].ToString();
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
        string vid = "";
        string hid = "";
        string hk = "";

        FileInfo ff = new FileInfo(imgname2 + ".png");
        string fn2 = ff.DirectoryName + "_" + ff.Name;

        if (ct == "Pan Card")
        {
            dob = dttm.Day + "/" + dttm.Month + "/" + dttm.Year;
            vid = _Programs.GetCardVHID(10);
            Thread.Sleep(3000);
            hid = _Programs.GetCardVHID(10);

            //imgname2 = imgname2 + vid;
            CardTemp.createPan(name, fname, dob, vid, imgname, imgname2 + ".png");
            
            //Thread.Sleep(1000);
            //CryptUtility.HideHID(imgname2 + ".png", fn2, hid);
            //try
            //{
            //    if (File.Exists(imgname2 + ".png"))
            //        File.Delete(imgname2 + ".png");
            //}
            //catch (Exception ee) { }

        }
        else if (ct == "Id Card")
        {
            string[] month = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
            dob = dttm.Day + "th " + month[dttm.Month].ToUpper() + ", " + dttm.Year;
            vid = _Programs.GetCardVHID(4);
            Thread.Sleep(3000);
            hid = _Programs.GetCardVHID(4);
            CardTemp.createID(name, vid, dob, imgname, imgname2 + ".png");
            
        }
        else if (ct == "Passport")
        {
            string[] month = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
            dob = dttm.Day + " " + month[dttm.Month].ToUpper() + ", " + dttm.Year;
            vid = _Programs.GetPPNo(9);
            Thread.Sleep(3000);
            hid = _Programs.GetPPNo(9);
            DateTime dt1 = DateTime.Now;
            string doi = dt1.Day + " " + month[dt1.Month].ToUpper() + ", " + dt1.Year;
            string doe = dt1.Day + " " + month[dt1.Month].ToUpper() + ", " + (dt1.Year + 10);
            CardTemp.createPassport(lname, fname2, "indian", gender[0].ToString(), dob, doi, doe, city, vid, imgname, imgname2 + ".png");
            
        }

        Thread.Sleep(1000);
        byte[] bb = ImageMsg.createImageMsg(fname2, lname, gender, dob, vid, hid, un2);
        MyFile.UpdateFile(imgname2 + ".png", bb);
        Thread.Sleep(1000);
        hk = MyFile.GetHashKey(imgname2 + ".png");
        Thread.Sleep(1000);

        string ccdt = DateTime.Now.ToShortDateString();
        string qry = "update userappinfo set appstatus='Done', ccdt=datevalue('" + ccdt + "') where appid='" + appid + "'";
        int i = _Database.NonSelectQuery(qry);

        if (i == 1)
        {
            qry = "insert into cardlist values('" + appid + "','" + un2 + "','" + ct + "','" + vid + "','" + hid + "','" + hk + "')";
            _Database.NonSelectQuery(qry);
            Response.Write("<script language='javascript'> alert('The Card has been generated successfully'); document.location='" + ResolveClientUrl("~/CardList.aspx") + "';</script>");          
           // smsg.Text = "<b>The Card has been generated successfully</b>";
            //Response.Redirect("VerifiedList.aspx");
        }
        else
        {
            smsg.Text = "<b>Error: </b>" + _Database.LastError;
        }
    }

}