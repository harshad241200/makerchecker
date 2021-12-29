using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace markercheker
{
    public partial class _Default : Page
    {
        static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        private void BindGrid()
        {
            using (SqlCommand cmd = new SqlCommand("select id, productname, productid, makerid, makername,pr_status from product", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }


        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;

            this.BindGrid();
        }


        protected void saveProduct(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string sql = "insert into product (productname, productid, makerid, makername) values('" + productName.Text + "','" + productid.Text + "','" + makerid.Text + "','" + makername.Text + "')";
                SqlCommand cmd = new SqlCommand(sql, con);
                int status = cmd.ExecuteNonQuery();
                if (status > 0)
                {
                    insertstatus.Text = "Success";
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    insertstatus.Text = "Fail";
                }
            }
            catch (Exception ex)
            {
                insertstatus.Text = ex.Message;
            }
            finally
            {
                con.Close();
            }
        }
    }
}