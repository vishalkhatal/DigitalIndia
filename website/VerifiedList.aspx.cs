using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class VerifiedList : System.Web.UI.Page
{
    string un = "";

    static string qry = "";

    void getAllUserForms(string qry1)
    {
        DataTable dt = null;
        dt = _Database.SelectQuery(qry1);

        if (dt != null && dt.Rows.Count > 0)
        {
            qry = qry1;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            errmsg.Text = "Total record found : " + (GridView1.Rows.Count);
        }
        else
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            //errmsg.Text = "Total record found : 0";
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        un = Session["mailid"].ToString();
        if (!IsPostBack)
        {
            qry = "select * from userappinfo where appstatus='Verified'";
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
        //Label ll = (Label)GridView1.Rows[e.RowIndex].FindControl("appid");
        //string qq = "delete from userappinfo where appid='" + ll.Text + "'";
        //_Database.NonSelectQuery(qq);
        //getAllUserForms(qry);

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        qry = "select * from userappinfo where appstatus='Verified' and apptype='" + ddlType.Text + "'";
        getAllUserForms(qry);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        qry = "select * from userappinfo where appstatus='Verified'";
        getAllUserForms(qry);
    }

}