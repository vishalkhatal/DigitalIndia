using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ViewDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string[] cols = { "App Id", "App Type", "Submission Date", "First Name", "Last Name", "Father or Mother Name", "Gender", "Date Of Birth", "Address", "City", "Pincode", "State", "Photo", "App Status", "Verified Date" };
            string appid = Request.QueryString["appid"];
            DataTable dt = _Database.SelectQuery("select * from userappinfo where appid='" + appid + "'");
            if (dt != null && dt.Rows.Count == 1)
            {
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
}