using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Collections;
using System.Text;

/// <summary>
/// Summary description for BinarySignClass
/// </summary>
public class BinarySignClass
{

    private static bool FindLastBit(byte inp)
    {
        int t;
        byte val;
        bool con = false;

        val = inp;
        //Console.Write(inp + " : ");
        for (t = 128; t > 0; t = t / 2)
        {
            if ((val & t) != 0)
            {
                //Console.Write("1 "); 
                con = true;
            }
            if ((val & t) == 0)
            {
                //Console.Write("0 "); 
                con = false;
            }
        }
        return con;
    }

    private static byte[] ChangeDataBit(byte[] myBytes, byte[] data)
    {

        BitArray myBitArray = new BitArray(myBytes);
        BitArray mydatabit = new BitArray(data);

        int k = 0;
        for (int i = 0; i < myBitArray.Length; )
        {
            myBitArray[i] = mydatabit[k];
            i = i + 8;
            k++;
        }

        byte[] myNewBytes = new byte[8];
        myBitArray.CopyTo(myNewBytes, 0);

        return myNewBytes;
    }

    private static byte[] ToByteArray(BitArray bits)
    {
        int numBytes = bits.Count / 8;
        if (bits.Count % 8 != 0) numBytes++;

        byte[] bytes = new byte[numBytes];
        int byteIndex = 0, bitIndex = 0;

        for (int i = 0; i < bits.Count; i++)
        {
            if (bits[i])
                bytes[byteIndex] |= (byte)(1 << (7 - bitIndex));

            bitIndex++;
            if (bitIndex == 8)
            {
                bitIndex = 0;
                byteIndex++;
            }
        }

        return bytes;
    }

    private static string Encrypt(string dt1)
    {
        string edt = "";

        for (int i = 0; i < dt1.Length; i++)
        {
            int ch = dt1[i] + dt1.Length;
            edt += (char)ch;
        }
        return dt1;
    }

    private static string Decrypt(string dt1)
    {
        string edt = "";

        for (int i = 0; i < dt1.Length; i++)
        {
            int ch = dt1[i] - dt1.Length;
            edt += (char)ch;
        }
        return dt1;
    }

    private static byte[] WriteHeaderByte(byte[] bt, string data, int si)
    {
        byte[] newbb = bt;

        char[] ch = data.ToCharArray();
        int j = si;

        for (int i = 0; i < ch.Length; i++)
        {
            byte[] ob = new byte[8];

            for (int t = 0; t < 8; t++)
            {
                ob[t] = newbb[j + t];
            }

            byte[] ocb = new byte[1];
            ocb[0] = (byte)ch[i];

            byte[] newbytes = ChangeDataBit(ob, ocb);

            for (int t = 0; t < 8; t++)
            {
                newbb[j + t] = newbytes[t];
            }

            j += 4000;

        }

        return newbb;
    }


    private static byte[] WriteByte(byte[] bt, string data, int si, int mq)
    {
        byte[] newbb = bt;
        int inbt = 4000;
        if (mq == 0)
            inbt = 4000;
        else if (mq == 1)
            inbt = 8000;
        else if (mq == 2)
            inbt = 16000;


        char[] ch = data.ToCharArray();
        int j = si;

        for (int i = 0; i < ch.Length; i++)
        {
            byte[] ob = new byte[8];

            for (int t = 0; t < 8; t++)
            {
                ob[t] = newbb[j + t];
            }

            byte[] ocb = new byte[1];
            ocb[0] = (byte)ch[i];

            byte[] newbytes = ChangeDataBit(ob, ocb);

            for (int t = 0; t < 8; t++)
            {
                newbb[j + t] = newbytes[t];
            }

            j += inbt;

        }

        return newbb;
    }

    public static bool WriteData(string fn, string nfn, string data1, string pwd1, int mq)
    {
        bool con = false;
        try
        {
            Stream ss = File.OpenRead(fn);

            byte[] bb = new byte[ss.Length];

            Stream aa = new FileStream(nfn, FileMode.Create, FileAccess.Write);
            BinaryReader br = new BinaryReader(ss);
            br.Read(bb, 0, (int)ss.Length);
            Console.WriteLine(ss.Length);

            string pwd = pwd1.Trim();
            for (int i = 0; pwd.Length <= 8; i++)
            {
                pwd += " ";
            }
            bb = WriteHeaderByte(bb, pwd, 2000);

            data1 = Encrypt(data1);

            string data = data1;
            int b1 = data.Length / 255;
            int b2 = data.Length % 255;
            char ch1 = (char)b1;
            char ch2 = (char)b2;

            string datasize = "" + ch1 + ch2;

            bb = WriteHeaderByte(bb, datasize, 35000);

            char ch3 = (char)mq;
            string mq1 = ch3.ToString();
            bb = WriteHeaderByte(bb, mq1, 45000);

            bb = WriteByte(bb, data, 50000, mq);

            BinaryWriter bs = new BinaryWriter(aa);
            bs.Write(bb);
            bs.Close();
            ss.Close();
            aa.Close();
            con = true;
        }
        catch (Exception ee) { con = false; Console.WriteLine(ee.Message); }
        return con;
    }

    private static string ReadHeaderByte(byte[] bt, int si, int length)
    {
        byte[] newbb = bt;

        bool[] bitvalue = new bool[8 * length];

        int j = si;
        int k = 0;
        for (int i = 0; i < length; i++)
        {
            byte[] cb = new byte[8];
            for (int t = 0; t < 8; t++)
            {
                cb[t] = newbb[j + t];
            }

            for (int t = 0; t < 8; t++)
            {
                bitvalue[k] = FindLastBit(cb[t]);
                k++;
            }

            j += 4000;
        }

        Array.Reverse(bitvalue);
        BitArray lsa = new BitArray(bitvalue);
        byte[] message = ToByteArray(lsa);
        string mes = Encoding.ASCII.GetString(message);
        char[] cc = mes.ToCharArray();
        Array.Reverse(cc);
        string od = "";
        for (int i = 0; i < cc.Length; i++)
            od += cc[i];

        return od;
    }


    private static string ReadByte(byte[] bt, int si, int length, int mq)
    {
        byte[] newbb = bt;
        int inbt = 4000;
        if (mq == 0)
            inbt = 4000;
        else if (mq == 1)
            inbt = 8000;
        else if (mq == 2)
            inbt = 16000;

        bool[] bitvalue = new bool[8 * length];

        int j = si;
        int k = 0;
        for (int i = 0; i < length; i++)
        {
            byte[] cb = new byte[8];
            for (int t = 0; t < 8; t++)
            {
                cb[t] = newbb[j + t];
            }

            for (int t = 0; t < 8; t++)
            {
                bitvalue[k] = FindLastBit(cb[t]);
                k++;
            }

            j += inbt;
        }

        Array.Reverse(bitvalue);
        BitArray lsa = new BitArray(bitvalue);
        byte[] message = ToByteArray(lsa);
        string mes = Encoding.ASCII.GetString(message);
        char[] cc = mes.ToCharArray();
        Array.Reverse(cc);
        string od = "";
        for (int i = 0; i < cc.Length; i++)
            od += cc[i];

        return od;
    }

    static string[] cols = new string[4];

    public static string ReadData(string fn, string pwd1)
    {
        LastError = "";
        cols[0] = "";
        cols[1] = "0";
        cols[2] = "";
        cols[3] = "";

        string msg = "";

        Stream ss = File.OpenRead(fn);

        byte[] bb = new byte[ss.Length];

        BinaryReader br = new BinaryReader(ss);
        br.Read(bb, 0, (int)ss.Length);

        string pwd = ReadHeaderByte(bb, 2000, 8);
        Console.WriteLine(pwd);
        pwd = pwd.Trim();
        Console.WriteLine("Password : " + pwd);

        cols[0] = pwd;

        if (pwd == pwd1)
        {
            string ds = ReadHeaderByte(bb, 35000, 2);
            char[] ch = ds.ToCharArray();
            int ds1 = 0;
            ds1 = (int)ch[0];
            ds1 = ds1 * 255;
            ds1 += (int)ch[1];

            Console.WriteLine("Data Size : " + ds1);

            string mq1 = ReadHeaderByte(bb, 45000, 1);
            char[] ch11 = mq1.ToCharArray();
            int mq = 0;
            mq = (int)ch11[0];
            cols[2] = "" + mq;
            Console.WriteLine("Media Quality : " + mq);

            cols[1] = "" + ds1;
            msg = ReadByte(bb, 50000, ds1, mq);
            Console.WriteLine("Data : " + msg);

            msg = Decrypt(msg);
            cols[3] = msg;
        }
        else
        {
            msg = "Invalid Password";
            LastError = "Invalid Password";
        }

        return msg;
    }
    public static string LastError = "";
    public static string[] GetAllInfo()
    {
        return cols;
    }

}
