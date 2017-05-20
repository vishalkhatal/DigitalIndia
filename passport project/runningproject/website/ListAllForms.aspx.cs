using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ListAllForms : System.Web.UI.Page
{
    string un = "";

    static string qry = "";

    void getAllUserForms(string qry1)
    {
        DataTable dt = null;
        dt = _Database.SelectQuery(qry1);

        if (dt != null && dt.Rows.Count > 0)
        {
            dt.Columns.Add("dwn", typeof(string));
            
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string st = dt.Rows[i]["appstatus"].ToString();
                string aid = dt.Rows[i]["appid"].ToString();
                if (st == "Done")
                    dt.Rows[i]["dwn"] = "ImgView.aspx?appid=" + aid;
                else if (st == "Waiting" || st == "Verified")
                    dt.Rows[i]["dwn"] = "";
            }

            qry = qry1;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            errmsg.Text = "Total record found : " + (GridView1.Rows.Count);
        }
        else
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            errmsg.Text = "Total record found : 0";
        }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        un = Session["mailid"].ToString();
        if (!IsPostBack)
        {
            qry = "select * from userappinfo where mailid='" + un + "' order by appsdt desc";
            getAllUserForms(qry);
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        getAllUserForms(qry);
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label ll = (Label)GridView1.Rows[e.RowIndex].FindControl("appid");
        Response.Redirect("DelForm.aspx?appid=" + ll.Text);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}