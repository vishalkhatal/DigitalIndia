using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Drawing.Imaging;
using System.Windows.Forms;
using System.Text;

public enum WatermarkPosition
{
    Absolute,
    TopLeft,
    TopRight,
    TopMiddle,
    BottomLeft,
    BottomRight,
    BottomMiddle,
    MiddleLeft,
    MiddleRight,
    Center
}

/// <summary>
/// Summary description for ImageLib
/// </summary>
public class Watermarker
{

    #region Private Fields
    private Image m_image;
    private Image m_originalImage;
    private Image m_watermark;
    private float m_opacity = 1.0f;
    private WatermarkPosition m_position = WatermarkPosition.Absolute;
    private int m_x = 0;
    private int m_y = 0;
    private Color m_transparentColor = Color.Empty;
    private RotateFlipType m_rotateFlip = RotateFlipType.RotateNoneFlipNone;
    private Padding m_margin = new Padding(0);
    private Font m_font = new Font(FontFamily.GenericSansSerif, 10);
    private Color m_fontColor = Color.Black;
    private float m_scaleRatio = 1.0f;
    #endregion

    #region Public Properties
    /// <summary>
    /// Gets the image with drawn watermarks
    /// </summary>
    //[Browsable(false)]
    public Image Image { get { return m_image; } }

    /// <summary>
    /// Watermark position relative to the image sizes. 
    /// If Absolute is chosen, watermark positioning is being done via PositionX and PositionY 
    /// properties (0 by default)\n
    /// </summary>        
    public WatermarkPosition Position { get { return m_position; } set { m_position = value; } }

    /// <summary>
    /// Watermark X coordinate (works if Position property is set to WatermarkPosition.Absolute)
    /// </summary>
    public int PositionX { get { return m_x; } set { m_x = value; } }

    /// <summary>
    /// Watermark Y coordinate (works if Position property is set to WatermarkPosition.Absolute)
    /// </summary>
    public int PositionY { get { return m_y; } set { m_y = value; } }

    /// <summary>
    /// Watermark opacity. Can have values from 0.0 to 1.0
    /// </summary>
    public float Opacity { get { return m_opacity; } set { m_opacity = value; } }

    /// <summary>
    /// Transparent color
    /// </summary>
    public Color TransparentColor { get { return m_transparentColor; } set { m_transparentColor = value; } }

    /// <summary>
    /// Watermark rotation and flipping
    /// </summary>
    public RotateFlipType RotateFlip { get { return m_rotateFlip; } set { m_rotateFlip = value; } }

    /// <summary>
    /// Spacing between watermark and image edges
    /// </summary>
    public Padding Margin { get { return m_margin; } set { m_margin = value; } }

    /// <summary>
    /// Watermark scaling ratio. Must be greater than 0. Only for image watermarks
    /// </summary>
    public float ScaleRatio { get { return m_scaleRatio; } set { m_scaleRatio = value; } }

    /// <summary>
    /// Font of the text to add
    /// </summary>
    public Font Font { get { return m_font; } set { m_font = value; } }

    /// <summary>
    /// Color of the text to add
    /// </summary>
    public Color FontColor { get { return m_fontColor; } set { m_fontColor = value; } }


    #endregion

    #region Constructors
    public Watermarker(Image image)
    {
        LoadImage(image);
    }

    public Watermarker(string filename)
    {
        LoadImage(Image.FromFile(filename));
    }
    #endregion

    #region Public Methods
    /// <summary>
    /// Resets image, clearing all drawn watermarks
    /// </summary>
    public void ResetImage()
    {
        m_image = new Bitmap(m_originalImage);
    }

    public void SaveImage(string filename)
    {
        if (m_image != null)
            m_image.Save(filename);
    }

    public void DrawImage(string filename)
    {
        DrawImage(Image.FromFile(filename));
    }

    public void DrawImage(Image watermark)
    {

        if (watermark == null)
            throw new ArgumentOutOfRangeException("Watermark");

        if (m_opacity < 0 || m_opacity > 1)
            throw new ArgumentOutOfRangeException("Opacity");

        if (m_scaleRatio <= 0)
            throw new ArgumentOutOfRangeException("ScaleRatio");

        // Creates a new watermark with margins (if margins are not specified returns the original watermark)
        m_watermark = GetWatermarkImage(watermark);

        // Rotates and/or flips the watermark
        m_watermark.RotateFlip(m_rotateFlip);

        // Calculate watermark position
        Point waterPos = GetWatermarkPosition();

        // Watermark destination rectangle
        Rectangle destRect = new Rectangle(waterPos.X, waterPos.Y, m_watermark.Width, m_watermark.Height);

        ColorMatrix colorMatrix = new ColorMatrix(
            new float[][] { 
                    new float[] { 1, 0f, 0f, 0f, 0f},
                    new float[] { 0f, 1, 0f, 0f, 0f},
                    new float[] { 0f, 0f, 1, 0f, 0f},
                    new float[] { 0f, 0f, 0f, m_opacity, 0f},
                    new float[] { 0f, 0f, 0f, 0f, 1}                    
                });

        ImageAttributes attributes = new ImageAttributes();

        // Set the opacity of the watermark
        attributes.SetColorMatrix(colorMatrix);

        // Set the transparent color 
        if (m_transparentColor != Color.Empty)
        {
            attributes.SetColorKey(m_transparentColor, m_transparentColor);
        }

        // Draw the watermark
        using (Graphics gr = Graphics.FromImage(m_image))
        {
            gr.DrawImage(m_watermark, destRect, 0, 0, m_watermark.Width, m_watermark.Height, GraphicsUnit.Pixel, attributes);
        }
    }

    public void DrawText(string text)
    {
        // Convert text to image, so we can use opacity etc.
        Image textWatermark = GetTextWatermark(text);

        DrawImage(textWatermark);
    }
    #endregion

    #region Private Methods
    private void LoadImage(Image image)
    {
        m_originalImage = image;
        ResetImage();
    }

    private Image GetTextWatermark(string text)
    {

        Brush brush = new SolidBrush(m_fontColor);
        SizeF size;

        // Figure out the size of the box to hold the watermarked text
        using (Graphics g = Graphics.FromImage(m_image))
        {
            size = g.MeasureString(text, m_font);
        }

        // Create a new bitmap for the text, and, actually, draw the text
        Bitmap bitmap = new Bitmap((int)size.Width, (int)size.Height);
        bitmap.SetResolution(m_image.HorizontalResolution, m_image.VerticalResolution);

        using (Graphics g = Graphics.FromImage(bitmap))
        {
            g.DrawString(text, m_font, brush, 0, 0);
        }

        return bitmap;
    }

    private Image GetWatermarkImage(Image watermark)
    {

        // If there are no margins specified and scale ration is 1, no need to create a new bitmap
        if (m_margin.All == 0 && m_scaleRatio == 1.0f)
            return watermark;

        // Create a new bitmap with new sizes (size + margins) and draw the watermark
        int newWidth = Convert.ToInt32(watermark.Width * m_scaleRatio);
        int newHeight = Convert.ToInt32(watermark.Height * m_scaleRatio);

        Rectangle sourceRect = new Rectangle(m_margin.Left, m_margin.Top, newWidth, newHeight);
        Rectangle destRect = new Rectangle(0, 0, watermark.Width, watermark.Height);

        Bitmap bitmap = new Bitmap(newWidth + m_margin.Left + m_margin.Right, newHeight + m_margin.Top + m_margin.Bottom);
        bitmap.SetResolution(watermark.HorizontalResolution, watermark.VerticalResolution);

        using (Graphics g = Graphics.FromImage(bitmap))
        {
            g.DrawImage(watermark, sourceRect, destRect, GraphicsUnit.Pixel);
        }

        return bitmap;
    }

    private Point GetWatermarkPosition()
    {
        int x = 0;
        int y = 0;

        switch (m_position)
        {
            case WatermarkPosition.Absolute:
                x = m_x; y = m_y;
                break;
            case WatermarkPosition.TopLeft:
                x = 0; y = 0;
                break;
            case WatermarkPosition.TopRight:
                x = m_image.Width - m_watermark.Width; y = 0;
                break;
            case WatermarkPosition.TopMiddle:
                x = (m_image.Width - m_watermark.Width) / 2; y = 0;
                break;
            case WatermarkPosition.BottomLeft:
                x = 0; y = m_image.Height - m_watermark.Height;
                break;
            case WatermarkPosition.BottomRight:
                x = m_image.Width - m_watermark.Width; y = m_image.Height - m_watermark.Height;
                break;
            case WatermarkPosition.BottomMiddle:
                x = (m_image.Width - m_watermark.Width) / 2; y = m_image.Height - m_watermark.Height;
                break;
            case WatermarkPosition.MiddleLeft:
                x = 0; y = (m_image.Height - m_watermark.Height) / 2;
                break;
            case WatermarkPosition.MiddleRight:
                x = m_image.Width - m_watermark.Width; y = (m_image.Height - m_watermark.Height) / 2;
                break;
            case WatermarkPosition.Center:
                x = (m_image.Width - m_watermark.Width) / 2; y = (m_image.Height - m_watermark.Height) / 2;
                break;
            default:
                break;
        }

        return new Point(x, y);
    }
    #endregion
    
}


public class CardTemp
{
    public static void createPan(string name, string fname, string dob, string panno, string photo, string imgname)
    {
        int width = 418;
        int height = 228;

        Bitmap bb = new Bitmap(Image.FromFile(photo), new Size(150, 150));
        Bitmap bb2 = new Bitmap(width, height);
        Graphics g = Graphics.FromImage(bb2);
        //g.Clear(Color.FromArgb(rr.Next(0, 255), rr.Next(0, 255), rr.Next(0, 255)));
        g.Clear(Color.SeaGreen);
        g.DrawImage(bb, width - 160, 40);

        Font ff = new System.Drawing.Font("Times New Roman", 13, FontStyle.Bold);
        Font ff2 = new System.Drawing.Font("Times New Roman", 12, FontStyle.Regular);
        Font ff3 = new System.Drawing.Font("Times New Roman", 13, FontStyle.Regular);

        g.DrawString("INCOME TAX DEPARTMENT", ff3, Brushes.Brown, 10, 10);
        g.DrawString("GOVT. OF INDIA", ff3, Brushes.Brown, 270, 10);

        g.DrawString(name.ToUpper(), ff, Brushes.Black, 10, 60);
        g.DrawString(fname.ToUpper(), ff, Brushes.Black, 10, 90);
        g.DrawString(dob, ff, Brushes.Black, 10, 120);
        g.DrawString("Permenant Account Number", ff2, Brushes.Blue, 10, 150);
        g.DrawString(panno.ToUpper(), ff, Brushes.Black, 10, 180);

        bb2.Save(imgname);
    }

    public static void createID(string name, string id, string dob, string photo, string imgname)
    {
        int width = 242;
        int height = 369;

        Bitmap bb = new Bitmap(Image.FromFile(photo), new Size(125, 125));
        Bitmap bb2 = new Bitmap(width, height + 10);
        Graphics g = Graphics.FromImage(bb2);
        //g.Clear(Color.FromArgb(rr.Next(0, 255), rr.Next(0, 255), rr.Next(0, 255)));
        g.Clear(Color.Thistle);

        g.DrawImage(bb, (width - 125) / 2, 60);

        Font ff = new System.Drawing.Font("Times New Roman", 13, FontStyle.Bold);
        Font ff2 = new System.Drawing.Font("Times New Roman", 12, FontStyle.Regular);
        Font ff3 = new System.Drawing.Font("Times New Roman", 15, FontStyle.Italic);

        g.DrawString("ABCD Software Pvt Ltd.", ff3, Brushes.Blue, 20, 15);
        //g.DrawString("GOVT. OF INDIA", ff3, Brushes.Brown, 270, 10);

        g.DrawString(name.ToUpper(), ff, Brushes.Blue, 50, 220);
        g.DrawString("Software Trainer", ff2, Brushes.Black, 65, 240);

        g.DrawString("Emp ID: ", ff2, Brushes.Blue, 20, 290);
        g.DrawString(id.ToUpper(), ff2, Brushes.Black, 120, 290);

        g.DrawString("Blood Group: ", ff2, Brushes.Blue, 20, 320);
        g.DrawString("A +ve", ff2, Brushes.Black, 120, 320);

        g.DrawString("Date of Birth: ", ff2, Brushes.Blue, 20, 350);
        g.DrawString(dob, ff2, Brushes.Black, 120, 350);

        bb2.Save(imgname);
    }

    public static void createPassport(string name, string fname, string nation, string gender, string dob, string doi, string doe, string birthplace, string ppno, string photo, string imgname)
    {
        int width = 500;
        int height = 360;

        Bitmap bb = new Bitmap(Image.FromFile(photo), new Size(180, 180));
        Bitmap bb2 = new Bitmap(width, height);
        Graphics g = Graphics.FromImage(bb2);
        //g.Clear(Color.FromArgb(rr.Next(0, 255), rr.Next(0, 255), rr.Next(0, 255)));
        g.Clear(Color.NavajoWhite);
        g.DrawImage(bb, 10, 60);

        Font ff = new System.Drawing.Font("Times New Roman", 13, FontStyle.Bold);
        Font ff2 = new System.Drawing.Font("Times New Roman", 12, FontStyle.Regular);
        Font ff3 = new System.Drawing.Font("Times New Roman", 12, FontStyle.Bold);
        Font ff4 = new System.Drawing.Font("Times New Roman", 24, FontStyle.Bold);

        g.DrawString("Passport", ff3, Brushes.Brown, 50, 10);
        g.DrawString("Passport No", ff3, Brushes.Brown, 300, 10);
        g.DrawString(ppno.ToUpper(), ff4, Brushes.DarkGreen, 270, 40);

        g.DrawString("Last Name : ", ff2, Brushes.Black, 230, 100);
        g.DrawString(name.ToUpper(), ff3, Brushes.Black, 340, 100);

        g.DrawString("First Name : ", ff2, Brushes.Black, 230, 140);
        g.DrawString(fname.ToUpper(), ff3, Brushes.Black, 340, 140);

        g.DrawString("Nationality : ", ff2, Brushes.Black, 230, 180);
        g.DrawString(nation.ToUpper(), ff3, Brushes.Black, 340, 180);

        g.DrawString("Gender : ", ff2, Brushes.Black, 230, 220);
        g.DrawString(gender.ToUpper(), ff3, Brushes.Black, 340, 220);

        g.DrawString("Date Of Birth : ", ff2, Brushes.Black, 230, 270);
        g.DrawString(dob.ToUpper(), ff3, Brushes.Black, 340, 270);

        g.DrawString("Place Of Birth : ", ff2, Brushes.Black, 230, 310);
        g.DrawString(birthplace.ToUpper(), ff3, Brushes.Black, 340, 310);

        g.DrawString("Date of issue", ff2, Brushes.Black, 30, 260);
        g.DrawString(doi.ToUpper(), ff3, Brushes.Black, 30, 280);

        g.DrawString("Date of expiration", ff2, Brushes.Black, 30, 310);
        g.DrawString(doe.ToUpper(), ff3, Brushes.Black, 30, 330);

        bb2.Save(imgname);
    }
}

public class ImageMsg
{
    public static byte[] createImageMsg(string fname, string lname, string gender, string dob, string vid, string hid, string mailid)
    {
        string chs = "@#$#@";
        string data = "";
        data += chs + "fname=" + fname + chs;
        data += chs + "lname=" + lname + chs;
        data += chs + "gender=" + gender + chs;
        data += chs + "dob=" + dob + chs;
        data += chs + "vid=" + vid + chs;
        data += chs + "hid=" + hid + chs;
        data += chs + "mailid=" + mailid + chs;

        byte[] bb = Encoding.ASCII.GetBytes(data);
        return bb;
    }

    public static string[] splitImageMsg(byte []bb)
    {
        string[] chs = { "@#$#@" };
        string data = Encoding.ASCII.GetString(bb);
        string []cols = data.Split(chs, StringSplitOptions.RemoveEmptyEntries);

        return cols;
    }
}


