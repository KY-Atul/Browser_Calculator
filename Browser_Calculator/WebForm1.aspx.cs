using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Browser_Calculator
{
        public partial class WebForm1 : System.Web.UI.Page
        {
        SqlConnection cnn = new SqlConnection("data source=HP\\SQLEXPRESS; initial catalog=calc_db;" +
            "integrated security=true");

        public void insert()
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand("insert into res (operand1,operation,operand2,result) values ('"+txtop1.Text+"','"+label1.Text+"','"+txtop2.Text+"','"+txtresult.Text.ToString()+"')",cnn);
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        public void display()
        {
            if (lonoff.Text == "on")
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand("select * from res", cnn);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                cnn.Close();
                gv.DataSource = dt;
                gv.DataBind();
            
            }

            else
            {
                gv.DataSource=null;
                gv.DataBind();
            }
        }
                
        public void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnplus_Click(object sender, EventArgs e)
        {
            double result;
            label1.Text = "+";
            result = Convert.ToDouble(txtop1.Text) + Convert.ToDouble(txtop2.Text);
            txtresult.Text = result.ToString();
            insert();
            display();
        }

        protected void btnmultiply_Click(object sender, EventArgs e)
        {
            double result;
            label1.Text = "*";
            result = Convert.ToDouble(txtop1.Text) * Convert.ToDouble(txtop2.Text);
            txtresult.Text = result.ToString();
            insert();
            display();
                    
        }

        protected void btnminus_Click(object sender, EventArgs e)
        {
            double result;
            label1.Text = "-";
            result = Convert.ToDouble(txtop1.Text) - Convert.ToDouble(txtop2.Text);
            txtresult.Text = result.ToString();
            insert();
            display();
        }

        protected void btndivide_Click(object sender, EventArgs e)
        {
            double result;
            label1.Text = "/";
            if (Convert.ToDouble(txtop2.Text) == 0)
            {
                txtresult.Text = @"Error. Can't divide by 0";
            }
            else
            {
                result = Convert.ToDouble(txtop1.Text) / Convert.ToDouble(txtop2.Text);
                txtresult.Text = result.ToString();
                insert();
                display();
            }
            

        }

        protected void btnclr_Click(object sender, EventArgs e)
        {
            txtop1.Text = "";
            txtop2.Text = "";
            txtresult.Text = "";
            label1.Text = "";
            lonoff.Text = "off";
            display();
            
        }

        protected void btnfetch_Click(object sender, EventArgs e)
        {
            lonoff.Text = "on";
            display();
        }

        protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "_delete_")
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand("delete from res where id='" + e.CommandArgument + "'", cnn);
                cmd.ExecuteNonQuery();
                cnn.Close();
                display();
            }

            else if (e.CommandName == "_redo_")
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand("select * from res where id='"+e.CommandArgument+"'",cnn);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                txtop1.Text = dt.Rows[0]["operand1"].ToString();
                label1.Text = "select";
                txtop2.Text = dt.Rows[0]["operand2"].ToString();
                txtresult.Text = dt.Rows[0]["result"].ToString();
            }
        }
    }
}