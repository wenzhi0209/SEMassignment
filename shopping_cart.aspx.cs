using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Reflection;

namespace SEMAssignment
{
    public partial class shopping_cart : System.Web.UI.Page
    {
        DataTable cart_table = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["basket"] != null)
            {
                cart_table = (DataTable)Session["basket"];
                if (cart_table.Columns.Contains("product_name") == false)
                {
                    cart_table.Columns.Add("product_name");
                    cart_table.Columns.Add("product_stock_price");
                    cart_table.Columns.Add("subtotal");
                    cart_table.Columns.Add("sequence");
                    cart_table.Columns.Add("image");
                }
            }
                
            else
            {
                cart_table = new DataTable();
                cart_table.Columns.Add("id");
                cart_table.Columns.Add("qty");
                cart_table.Columns.Add("product_name");
                cart_table.Columns.Add("product_stock_price");
                cart_table.Columns.Add("subtotal");
                cart_table.Columns.Add("sequence");
                cart_table.Columns.Add("image");
            }


            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);

            con.Open();
            DataRow[] rows = cart_table.Select();
            string id_temp = null;
            

            for (int i = 0; i < rows.Length; i++)
            {
                id_temp = rows[i]["id"].ToString();
                SqlCommand getDetails = new SqlCommand("SELECT [product_name], [product_stock_price],[product_image],[product_stock_id] FROM Product WHERE [product_id] = @product_id", con);

                getDetails.Parameters.AddWithValue("@product_id", id_temp);

                SqlDataReader prod_details = getDetails.ExecuteReader();

                if (prod_details.HasRows)
                {
                    prod_details.Read();
                    rows[i]["product_name"] = prod_details["product_name"].ToString() + "(" + prod_details["product_stock_id"].ToString() + ")";
                    rows[i]["product_stock_price"] = prod_details["product_stock_price"].ToString();
                    rows[i]["image"] = prod_details["product_image"].ToString();
                    prod_details.Close();
                }
                rows[i]["subtotal"] = int.Parse(rows[i]["qty"].ToString()) * Double.Parse(rows[i]["product_stock_price"].ToString());
                rows[i]["sequence"] = i+1;

            }
            con.Close();
            DataTable cart_display = new DataTable();

            double total_price = 0;
            foreach(DataRow row in rows)
            {
                cart_display.ImportRow(row);
                total_price+=Double.Parse(row["subtotal"].ToString());
            }
            // TO BE REMOVE
            //cart_table.Rows.Add("test", "9.99", "99");
            //cart_table.Rows.Add("test2", "test2", "9.99", "99");
            // TO BE REMOVE

            if (Request["DelID"] != null)
            {
                for (int i = 0; i < cart_table.Rows.Count; i++)
                    if (cart_table.Rows[i][0].ToString() == Request["DelID"].ToString())
                        cart_table.Rows.Remove(cart_table.Rows[i]);

                total_price = 0;
                foreach(DataRow row in cart_table.Rows)
                {
                    total_price += Double.Parse(row["subtotal"].ToString());
                }

                //string message = "You have delete the product(s) from your cart.";
                //string caption = "Delete successfully";
                //MessageBoxButtons buttons = MessageBoxButtons.OK;
                //DialogResult result;
                //result = MessageBox.Show(message, caption, buttons, MessageBoxIcon.Asterisk, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                string message = "You have delete the product(s) from your cart.";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

                PropertyInfo isreadonly = typeof(System.Collections.Specialized.NameValueCollection).GetProperty("IsReadOnly", BindingFlags.Instance | BindingFlags.NonPublic);
                // make collection editable
                isreadonly.SetValue(this.Request.QueryString, false, null);
                // remove
                this.Request.QueryString.Remove("DelID");

            }

            if (IsPostBack == false)
            {
                GridView1.DataSource = cart_table;
                Session["basket"] = cart_table;
                GridView1.DataBind();
                total_label.Text = total_price.ToString();
            }

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           Response.Redirect("~/Payment.aspx");
        }
    }
    

}