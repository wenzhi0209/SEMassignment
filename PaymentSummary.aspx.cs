using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SEMAssignment
{
    public partial class PaymentSummary : System.Web.UI.Page
    {
        public string SelectQuery = "";
        public string SelectSession = "";
        public string DeleteQuery = "";
        public string EmptyMessage = "";
        public Boolean ShowQuantity = true;
        public Boolean ShowPrice = true;
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
                    SqlCommand getDetails = new SqlCommand("SELECT [product_name], [product_stock_price], [product_image] FROM Product WHERE [product_id] = @product_id", con);

                    getDetails.Parameters.AddWithValue("@product_id", id_temp);

                    SqlDataReader prod_details = getDetails.ExecuteReader();

                    if (prod_details.HasRows)
                    {
                        prod_details.Read();
                        rows[i]["product_name"] = prod_details["product_name"].ToString();
                        rows[i]["product_stock_price"] = prod_details["product_stock_price"].ToString();
                        rows[i]["image"] = prod_details["product_image"].ToString();
                        prod_details.Close();
                    }
                    rows[i]["subtotal"] = int.Parse(rows[i]["qty"].ToString()) * Double.Parse(rows[i]["product_stock_price"].ToString());
                    rows[i]["sequence"] = i + 1;
            }
                con.Close();
                DataTable cart_display = new DataTable();

                double total_price = 0;
                double total_shipping_packaging_fee = 0;


                foreach (DataRow row in rows)
                {

                    cart_display.ImportRow(row);
                    total_price += Double.Parse(row["subtotal"].ToString());
                    total_price += 100.00;
                    total_shipping_packaging_fee += 50.00;
 
                }


                if (IsPostBack == false)
                {
                DataList1.DataSource = cart_table;
                Session["basket"] = cart_table;
                DataList1.DataBind();

                lblPackaging.Text = total_shipping_packaging_fee.ToString();
                lblShippingCost.Text= total_shipping_packaging_fee.ToString();
                lblTotalPrice.Text = total_price.ToString();
                lblfName.Text = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(Session["FirstName"].ToString().ToLower());
                lblAddress.Text = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(Session["DeliveryAddress"].ToString().ToLower());
                lblCountry.Text = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(Session["Country"].ToString().ToLower());
                lblPaymentMethod.Text = Session["PaymentMethod"].ToString();
                lblCreditCardNo.Text = String.Format("**{0}", Session["CardNumber"].ToString().Trim().Substring(2, 2));
                lblDate.Text = DateTime.Now.ToString();

                Session["basket"] = null;
                }


        }
        public object SafeEval(object container, string expression)
        {
            try
            {
                return DataBinder.Eval(container, expression);
            }
            catch (HttpException e)
            {
                // Write error details to minimize the harm caused by suppressed exception 
                Trace.Write("DataBinding", "Failed to process the Eval expression", e);
            }

            return System.DBNull.Value;
        }
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HtmlControl quantityDetailsDiv = e.Item.FindControl("quantityDetailsDiv") as HtmlControl;
                Label lblPrice = e.Item.FindControl("lblPrice") as Label;
                Label lblSubTotal = e.Item.FindControl("lblSubTotal") as Label;
                TextBox txtboxQty = e.Item.FindControl("txtboxQty") as TextBox;

                quantityDetailsDiv.Visible = ShowQuantity;
                lblPrice.Visible = lblSubTotal.Visible = ShowPrice;
            }
        }
    }
}