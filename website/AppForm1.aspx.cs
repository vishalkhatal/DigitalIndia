using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AppForm1 : System.Web.UI.Page
{
    void initDate()
    {
        ddlDay.Items.Clear();
        ddlDay.Items.Add("Select");
        for (int i = 1; i <= 31; i++)
            ddlDay.Items.Add(i.ToString());

        ddlMon.Items.Clear();
        ddlMon.Items.Add("Select");
        string[] mon = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };

        for (int i = 0; i < mon.Length; i++)
            ddlMon.Items.Add(mon[i]);

        ddlYear.Items.Clear();
        ddlYear.Items.Add("Select");
        int cyear = DateTime.Now.Year;

        for (int i = cyear - 18; i > 1950; i--)
            ddlYear.Items.Add(i.ToString());

        ddlDay.SelectedIndex = 1;
        ddlMon.SelectedIndex = 1;
        ddlYear.SelectedIndex = 1;

    }

    string un = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        un = Session["mailid"].ToString();
        
        if (!IsPostBack)
        {
            initDate();
            ddlType.SelectedIndex = 1;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (ddlDay.Text == "Select" || ddlMon.Text == "Select" || ddlYear.Text == "Select")
        {
            return;
        }

        string appid = _Programs.GetPin();
        un = Session["mailid"].ToString();
        string asdt = DateTime.Now.ToShortDateString();

        int day = Convert.ToInt32(ddlDay.Text);
        int mon = Convert.ToInt32(ddlMon.SelectedIndex);
        int year = Convert.ToInt32(ddlYear.Text);

       // string dob = new DateTime(year, mon, day).ToShortDateString();
        DateTime  dob = Calendar1.SelectedDate;
        string path = Server.MapPath("users") + "\\" + un + "\\" + FileUpload1.FileName;

        string qry = @"insert into userappinfo values('" + appid + "','" + un + "','" + ddlType.Text + "',"
            + "datevalue('" + asdt + "'),'" + txtFN.Text + "','" + txtLN.Text + "','" + txtFMN.Text
            + "','" + ddlGender.SelectedValue  + "',datevalue('" + dob + "'),'" + txtAddr.Text + "','"
            + txtCity.SelectedValue  + "','" + txtPin.Text + "','" + txtState.SelectedValue
            + "','" + FileUpload1.FileName + "','Waiting','Not Verified','N/A')";

        int i = _Database.NonSelectQuery(qry);
        if (i == 1)
        {
            FileUpload1.SaveAs(path);
            String givemsg = "Your application form has been submited successfully! Your Application Id :";
            Response.Write("<script language='javascript'> alert('"+givemsg +appid +"'); document.location='" + ResolveClientUrl("~/listallforms.aspx") + "';</script>"); 
           // smsg.Text = "<b>Your application form has been submited successfully! <br><br> Your Application Id : <u>" + appid + "</u></b>";
        }
        else
        {
            smsg.Text = "Error: " + _Database.LastError + "<br><br>" + qry;
        }

    }
    
}