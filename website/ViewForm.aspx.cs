using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Drawing;

public partial class ViewForm : System.Web.UI.Page
{
    static string appid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string[] cols = { "App Id", "App Type", "Submission Date", "First Name", "Last Name", "Father or Mother Name", "Gender", "Date Of Birth", "Address", "City", "Pincode", "State", "Photo", "App Status", "Verified Date" };
            appid = Request.QueryString["appid"];
            DataTable dt = _Database.SelectQuery("select * from userappinfo where appid='" + appid + "'");
            if (dt != null && dt.Rows.Count == 1)
            {
                if (dt.Rows[0]["appvdt"].ToString() == "Not Verified")
                    Button1.Enabled = true;
                else
                    Button1.Enabled = false;

                string mid = dt.Rows[0]["mailid"].ToString();
                dt.Columns.Remove("mailid");
                string path = "users/" + mid + "/" + dt.Rows[0]["uphoto"].ToString();
                Image1.ImageUrl = path;

                dt.Rows[0]["appsdt"] = dt.Rows[0]["appsdt"].ToString().Replace("12.00.00 AM", "");
                dt.Rows[0]["udob"] = dt.Rows[0]["udob"].ToString().Replace("12.00.00 AM", "");

                for (int i = 0; i < cols.Length; i++)
                {
                    dt.Columns[i].ColumnName = cols[i];
                }

                DetailsView1.DataSource = dt;
                DetailsView1.DataBind();

                for (int i = 0; i < DetailsView1.Rows.Count; i++)
                {
                    DetailsView1.Rows[i].Cells[1].Text = DetailsView1.Rows[i].Cells[1].Text.Replace("12.00.00 AM", "");
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string vdt = DateTime.Now.ToShortDateString();
        string qry = "update userappinfo set appstatus='Verified',appvdt='" + vdt + "' where appid='" + appid + "'";
        int i = _Database.NonSelectQuery(qry);

        if (i == 1)
        {
            Response.Write("<script language='javascript'> alert('Form has been verified!!!'); document.location='" + ResolveClientUrl("~/VerifiedList.aspx") + "';</script>");
            //smsg.ForeColor = Color.Green;
            //smsg.Text = "<b>The form has been verified</b>";
        }
        else
        {
            smsg.ForeColor = Color.Red;
            smsg.Text = "<b> Form has not been verified!</b> <br><br>Error : " + _Database.LastError;
        }
    }
}