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
    public partial class checker : System.Web.UI.Page
    {
        static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                using (SqlCommand cmd = new SqlCommand("select id, productname, productid, makerid, makername,pr_status from product", con))
                {
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }

            }
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            //Accessing BoundField Column.
            string name = GridView1.SelectedRow.Cells[0].Text;

            //Accessing TemplateField Column controls.
            string prstatus = (GridView1.SelectedRow.FindControl("changestatus") as Label).Text;

            lblValues.Text = "<b>id:</b> " + name + " <b>Status:</b> " + prstatus;
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


        protected void ApproveButton(object sender, EventArgs e)
        {
            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                var checkbox = gvrow.FindControl("CheckBox1") as CheckBox;
                if (checkbox.Checked)
                {
                    var lblID = gvrow.FindControl("id") as Label;
                    try
                    {
                        con.Open();
                        string sql = "update product set pr_status ='APPROVED' where id = '" + lblID.Text + "'";
                        SqlCommand cmd = new SqlCommand(sql, con);
                        int status = cmd.ExecuteNonQuery();

                        if (status > 0)
                        {
                            Response.Redirect("checker.aspx");
                        }
                        else
                        {
                            Response.Redirect("checker.aspx");
                        }

                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }

        protected void RejectButton(object sender, EventArgs e)
        {
            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                var checkbox = gvrow.FindControl("CheckBox1") as CheckBox;
                if (checkbox.Checked)
                {
                    var lblID = gvrow.FindControl("id") as Label;
                    try
                    {
                        con.Open();
                        string sql = "delete from  product  where id = '" + lblID.Text + "'";
                        SqlCommand cmd = new SqlCommand(sql, con);
                        int status = cmd.ExecuteNonQuery();

                        if (status > 0)
                        {
                            Response.Redirect("checker.aspx");
                        }
                        else
                        {
                            Response.Redirect("checker.aspx");
                        }

                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }

        }
    }
}
