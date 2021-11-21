using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace WebApplication1
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            try
            {
                //cookie
                HttpCookie signInCookie = new HttpCookie("LogInInfo");
                signInCookie["Username"] = txtUser.Text;
                Response.Cookies.Add(signInCookie);
                signInCookie.Expires = DateTime.Now.AddMinutes(30);
                //sessioon
                Session["Username"] = txtUser.Text;


                SqlDataAdapter adapt = new SqlDataAdapter();
                DataSet ds = new DataSet();
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\PhotoAppData.mdf;Integrated Security=True");

                adapt = new SqlDataAdapter("SELECT COUNT(*) FROM Authentication WHERE Username = '" + txtUser.Text + "' AND Password = '" + hashPassword(txtPassword.Text) + "'", con);
                DataTable dt = new DataTable();
                ds = new DataSet();
                
                adapt.Fill(dt);
                if (dt.Rows[0][0].ToString() == "1" && txtUser.Text != "" && txtPassword.Text != "")
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    //insert here
                    lblError.Text = "Username or password incorrect. Please try again!";
                    txtPassword.Text = "";
                    txtUser.Text = "";
                }

            }


            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                txtPassword.Text = "";
                txtUser.Text = "";

            }
        }
        public static string hashPassword(string pw)
        {
            SHA1CryptoServiceProvider sha1 = new SHA1CryptoServiceProvider();

            byte[] pw_bytes = Encoding.ASCII.GetBytes(pw);
            byte[] encrypted_bytes = sha1.ComputeHash(pw_bytes);
            return Convert.ToBase64String(encrypted_bytes);

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\PhotoAppData.mdf;Integrated Security=True");


                //HttpCookie signInRetrieve = Request.Cookies["LogInInfo"];
                //string user = "";
                //if (signInRetrieve != null)
                //{
                //    user = signInRetrieve["Username"];
                //}


               
                string ss = "insert into Authentication (Username, Password) values('" + txtUser.Text + "', '" + hashPassword(txtPassword.Text) + "')";
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

            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}