using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Security.Cryptography;
using System.Text;

public class MyFile
{
    public static string GetHashKey(string fn)
    {
        string hashstr = "";
        try
        {
            MD5 hash = new MD5CryptoServiceProvider();
            FileStream fs = new FileStream(fn, FileMode.Open, FileAccess.Read);
            BinaryReader br = new BinaryReader(fs);
            hash.ComputeHash(br.ReadBytes((int)fs.Length));
            hashstr = Convert.ToBase64String(hash.Hash);
            br.Close();
            fs.Close();
        }
        catch (Exception ee) { }
        return hashstr;
    }

    public static string GetHashKey(byte []bb)
    {
        string hashstr = "";
        try
        {
            MD5 hash = new MD5CryptoServiceProvider();
            hash.ComputeHash(bb);
            hashstr = Convert.ToBase64String(hash.Hash);
        }
        catch (Exception ee) { }
        return hashstr;
    }


    public static string getDateDiff(DateTime dt1, DateTime dt2)
    {
        TimeSpan ts1 = new TimeSpan(dt1.Hour, dt1.Minute, dt1.Second, dt1.Millisecond);
        TimeSpan ts2 = new TimeSpan(dt2.Hour, dt2.Minute, dt2.Second, dt2.Millisecond);

        TimeSpan ts = ts2.Subtract(ts1);
        string diff = ts.Seconds + ":" + ts.Milliseconds;
        return diff;
    }

    public static byte[] ReadFile(string fn)
    {
        byte[] data = null;
        try
        {
            FileStream fs = new FileStream(fn, FileMode.Open);
            BinaryReader br = new BinaryReader(fs);
            data = new byte[fs.Length];
            br.Read(data, 0, data.Length);
            br.Close();
            fs.Close();
        }
        catch (Exception ee) { }
        return data;
    }

    public static bool SaveFile(string fn, byte[] data)
    {
        bool isSave = false;
        try
        {
            FileStream fs = new FileStream(fn, FileMode.Create);
            BinaryWriter bw = new BinaryWriter(fs);
            bw.Write(data);
            bw.Close();
            fs.Close();
            isSave = true;
        }
        catch (Exception ee) { }
        return isSave;
    }

    public static bool UpdateFile(string fn, byte[] data)
    {
        bool isSave = false;
        try
        {
            FileStream fs = new FileStream(fn, FileMode.Append);
            BinaryWriter bw = new BinaryWriter(fs);
            bw.Write(data);
            bw.Close();
            fs.Close();
            isSave = true;
        }
        catch (Exception ee) { }
        return isSave;
    }

    
    public static bool FileCompare2(byte[] file1, string fn)
    {
        FileStream fs = new FileStream(fn, FileMode.Open);
        BinaryReader br = new BinaryReader(fs);
        byte[] file2 = new byte[fs.Length];
        fs.Close();

        if (file1.Length != file2.Length)
        {
            return false;
        }
        else
        {
            return true;
        }
    }

    public static bool FileCompare(string file1, string file2)
    {
        int file1byte;
        int file2byte;
        FileStream fs1;
        FileStream fs2;

        try
        {
            if (file1 == file2)
                return true;

            // Open the two files.
            fs1 = new FileStream(file1, FileMode.Open);
            fs2 = new FileStream(file2, FileMode.Open);

            // Check the file sizes. If they are not the same, the files 
            // are not the same.
            if (fs1.Length != fs2.Length)
            {
                // Close the file
                fs1.Close();
                fs2.Close();

                // Return false to indicate files are different
                return false;
            }

            do
            {
                // Read one byte from each file.
                file1byte = fs1.ReadByte();
                file2byte = fs2.ReadByte();
            }
            while ((file1byte == file2byte) && (file1byte != -1));

            // Close the files.
            fs1.Close();
            fs2.Close();

        }
        catch (Exception ee) { Console.WriteLine(ee.Message); return false; }
        return ((file1byte - file2byte) == 0);
    }

}
