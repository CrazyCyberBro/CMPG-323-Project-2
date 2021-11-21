using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
namespace WebApplication1
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string user = "";
            HttpCookie signInRetrieve = Request.Cookies["LogInInfo"];
            if (signInRetrieve != null)
            {
                lblCookie.Text = signInRetrieve["Username"];
                lblLoggedIn.Text = "logged in - " + signInRetrieve["Username"];
                user = signInRetrieve["Username"];
              
            }

            //string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\PhotoAppData.mdf;Integrated Security=True";
            //SqlConnection con = new SqlConnection(conStr);
            //DataSet ds = new DataSet();
            //SqlDataAdapter adapt = new SqlDataAdapter();

            //con.Open();
            //con.Close();

            //con.Open();
            //string sql = @"SELECT Photo_Id, Geo_Location, Captured_Date, Captured_by, Tag, Image FROM Photo_Data WHERE Username = '" + user + "'";
            //SqlCommand com = new SqlCommand(sql, con);
            //adapt.SelectCommand = com;
            //adapt.Fill(ds);

            //GridView1.DataSource = ds;
            //GridView1.DataBind();
            //con.Close();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            

        }

        protected void btnUpSave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\PhotoAppData.mdf;Integrated Security=True");

                string path = Server.MapPath("Images/");
                if (fileUploadImage.HasFile)
                {
                    string ext = Path.GetExtension(fileUploadImage.FileName);
                    if (ext == ".jpg" || ext == ".png" || ext == ".bmp" || ext == ".ico" || ext == ".jpeg" || ext == ".gif" || ext == ".tiff")
                    {
                        HttpCookie signInRetrieve = Request.Cookies["LogInInfo"];
                        string user = "";
                        if (signInRetrieve != null)
                        {
                            user = signInRetrieve["Username"];
                        }
                        

                        fileUploadImage.SaveAs(path + fileUploadImage.FileName);
                        string name = "Images/" + fileUploadImage.FileName;
                        string ss = "insert into Photo_Data (Geo_Location, Captured_Date, Captured_By, Tag, Image, Username) values('" + txtGeo.Text + "', '" + txtCapDate.Text + "', '" + txtCapBy.Text + "', '" + txtTag.Text + "', '" + name +"', '" + user + "')";
                        SqlCommand cmd = new SqlCommand(ss, con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                        //string ss2 = "insert into User_Photos (Username) values('" + user + "')";
                        //SqlCommand cmd2 = new SqlCommand(ss2, con);
                        //con.Open();
                        //cmd2.ExecuteNonQuery();
                        //con.Close();
                    }
                    else
                    {
                        lblError.Text = "Supported file formats are only: .bmp, .ico, .jpeg, .jpg, .gif, .tiff, .png";
                    }

                    Response.Redirect("Home.aspx");

                }
            }

            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }

        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            
            GridView1.Visible = false;
            GridView2.Visible = true;
        }
        protected void DownloadFile(object sender, EventArgs e)
        {
            string path = (sender as LinkButton).CommandArgument;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename =" + Path.GetFileName(path));
            Response.WriteFile(path);
            Response.End();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void btnShare_Click(object sender, EventArgs e)
        {
            //extract data
            string geo = "";
            string date = "";
            string capBy = "";
            string tag = "";
            string username = "";
            string image = "";
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\PhotoAppData.mdf;Integrated Security=True");
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT * FROM Photo_Data WHERE Photo_Id = @Photo_Id", con);
            cmd.Parameters.AddWithValue("@Photo_Id", int.Parse(txtPhotoId.Text));
            SqlDataReader dr = cmd.ExecuteReader();

            while(dr.Read())
            {
                geo = dr.GetValue(1).ToString();
                date = dr.GetValue(2).ToString();
                capBy = dr.GetValue(3).ToString();
                tag = dr.GetValue(4).ToString();
                image = dr.GetValue(5).ToString();
                //username = dr.GetValue(6).ToString();
            }
           
            con.Close();

            username = ddlShare.SelectedValue.ToString();

            //Label3.Text = geo;
            //Label4.Text = date;
            //Label5.Text = capBy;
            //Label6.Text = tag;
            //Label7.Text = image;
            //Label8.Text = username;

            //share



            string ss2 = "insert into Photo_Data (Geo_Location, Captured_Date, Captured_By, Tag, Image, Username) values('" + geo + "', '" + date + "', '" + capBy + "', '" + tag + "', '" + image + "', '" + username + "')";
            SqlCommand cmd2 = new SqlCommand(ss2, con);
            con.Open();
            cmd2.ExecuteNonQuery();
            con.Close();


            lblShareMessage.Text = "Image successfully shared with " + username;
           // Response.Redirect("Home.aspx");



        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            GridView2.Visible = false;
            GridView1.Visible = true;
            txtSearch.Text = "";
        }
    }
}