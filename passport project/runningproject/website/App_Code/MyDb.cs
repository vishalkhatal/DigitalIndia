using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.Common;
using System.IO;

public class _Programs
{
    public static string GetRandom()
    {
        string letter = "abcdefghijklmnopqrstuvwxyz";
        Random rr = new Random();
        return "" + letter[rr.Next(0, 25)] + rr.Next(1111, 9999) + letter[rr.Next(0, 25)] + rr.Next(1111, 9999);
    }

    public static string GetPin()
    {
        string letter = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random rr = new Random();
        string pin = "";
        for (int i = 0; i < 8; i++)
        {
            pin += letter[rr.Next(0, 34)];
        }
        return pin;
    }

    public static string GetCardVHID(int size)
    {
        string letter = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random rr = new Random();
        string pin = "";
        for (int i = 0; i < size; i++)
        {
            pin += letter[rr.Next(0, 34)];
        }
        return pin;
    }

    public static string GetPPNo(int size)
    {
        string letter = "123456789";
        Random rr = new Random();
        string pin = "";
        for (int i = 0; i < size; i++)
        {
            pin += letter[rr.Next(0, letter.Length)];
        }
        return pin;
    }
}

/// <summary>
/// Summary description for Class1
/// </summary>
public class _Database
{
    static DbProviderFactory dbf;
    static DbConnection con;
    static DbCommand cmd;
    static DbDataAdapter da;
    static DbTransaction transaction;
    static DataTable dt;

    public static string LastError = "";
    public static int AffectedRow = 0;

    public static void CreateConnection(string dbprovider, string constr)
    {
        dbf = DbProviderFactories.GetFactory(dbprovider);
        con = dbf.CreateConnection();
        con.ConnectionString = constr;
    }

    public static DataTable SelectQuery(string qry)
    {
        try
        {
            LastError = "";
            dt = new DataTable();
            cmd = con.CreateCommand();
            cmd.CommandText = qry;
            da = dbf.CreateDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
        }
        catch (Exception e) { LastError = e.Message; dt = null; }
        return dt;
    }

    public static int NonSelectQuery(string qry)
    {
        try
        {
            LastError = "";
            AffectedRow = 0;
            cmd = con.CreateCommand();
            cmd.CommandText = qry;
            con.Open();
            AffectedRow = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception e) { LastError = e.Message; AffectedRow = 0; con.Close(); }
        return AffectedRow;
    }

    public static int GetImgMaxCount(string qry)
    {
        int max = -1;
        try
        {
            LastError = "";
            cmd = con.CreateCommand();
            cmd.CommandText = qry;
            con.Open();
            object obj = cmd.ExecuteScalar();
            max = (int)obj;
            con.Close();
        }
        catch (Exception e) { LastError = e.Message; AffectedRow = 0; con.Close(); }
        return max;
    }
}

