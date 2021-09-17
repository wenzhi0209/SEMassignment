using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SEMAssignment
{
    public partial class Product_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSourceSelectArguments args = new DataSourceSelectArguments();
            DataView pName = (DataView)SqlDataSource1.Select(args);
            if (pName != null)
            {
                DataTable dt = pName.ToTable();

                string getPName = dt.Rows[0][0].ToString();
                string category = dt.Rows[0][1].ToString();

                //Response.Write(dt.Rows[0][0].ToString());
                //Protec OPTIMAX Table Top Film Processor
                //string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";MultipleActiveResultSets = true";
                SqlConnection connDb = new SqlConnection(strConn);
                connDb.Open();

                string getAllProduct = "SELECT * FROM [Product] WHERE ([product_name] = '" + getPName + "')";
                SqlCommand cmdSelect = new SqlCommand(getAllProduct, connDb);
                SqlDataReader productList = cmdSelect.ExecuteReader();
                //int i;
                int repeatFlag = 0;

                //" + getPName + "
                //SELECT * FROM [Product] WHERE (([product_category] = 'Equipment') AND (NOT ([product_name] = 'X-Port X-Ray Film Portfolio')))

                if (productList.HasRows)
                {
                    while (productList.Read())
                    {
                        productName.Text = productList["product_name"].ToString();
                        //productPrice.Text = "USD " + productList["product_stock_price"].ToString();
                        productIMG.ImageUrl = productList["product_image"].ToString();
                        //add price
                        Label priceLabel = new Label();
                        priceLabel.ID = productList["product_Id"].ToString() + "Plbl";
                        priceLabel.Text = "USD " + productList["product_stock_price"].ToString();
                        priceLabel.CssClass = "prodPrice";
                        if (repeatFlag != 0)
                        {
                            priceLabel.Visible = false;
                        }
                        priceHolder.Controls.Add(priceLabel);

                        //add type
                        RadioButton rb = new RadioButton();
                        rb.ID = productList["product_Id"].ToString();
                        rb.AutoPostBack = true;
                        rb.GroupName = "type";
                        rb.Text = productList["product_stock_desc"].ToString();
                        rb.CssClass = "radioBtn";
                        rb.CheckedChanged += new EventHandler(Radio_CheckedChanged);

                        if (repeatFlag == 0)
                        {
                            rb.Checked = true;
                        }
                        typeHolder.Controls.Add(rb);

                        if (repeatFlag == 0)
                        {
                            generateDesc(productList["product_description"].ToString());

                            generateSpecification(productList["product_specification1"].ToString(),
                                productList["product_specification2"].ToString(),
                                productList["product_specification3"].ToString());

                            generateFeatures(productList["product_features_benefits1"].ToString(),
                               productList["product_features_benefits2"].ToString(),
                               productList["product_features_benefits3"].ToString());
                        }

                        repeatFlag = 1;
                    }
                }

                string getRelateProduct = "SELECT TOP 8 * FROM [Product] WHERE (([product_category] = '" + category + "') " +
                        "AND (NOT ([product_name] = '" + getPName + "')))";
                SqlCommand cmdSelect2 = new SqlCommand(getRelateProduct, connDb);
                SqlDataReader suggestList = cmdSelect2.ExecuteReader();

                if (suggestList.HasRows)
                {
                    while (suggestList.Read())
                    {
                        generateSuggestion(suggestList["product_Id"].ToString(),
                           suggestList["product_image"].ToString(),
                           suggestList["product_name"].ToString(),
                           suggestList["product_stock_price"].ToString()
                           , "rpProd");
                    }
                }

                connDb.Close();
            }
        }

        protected void generateSuggestion(string id, string imgPath, string prodName, string price, string classname)
        {
            //string imgurl = ResolveClientUrl("~/productImage/test.png");
            string conDiv =
               "<a href=\"Product_details.aspx?para=" + id + "\">" +
               "<div class=\"rpImageSec\">" +
                    "<img src = \"" + imgPath + "\" />" +
                 "</div>" +
                 "<div class=\"rpNameSec\">" + prodName + "</div>" +
                 "<div class=\"rpPrice\">USD " + price + "</div>" +
             "</a>";

            HtmlGenericControl newdiv = new HtmlGenericControl("div");
            newdiv.Attributes.Add("class", "rpProd");
            newdiv.InnerHtml = conDiv;
            rProdHolder.Controls.Add(newdiv);

            //string imgurl = ResolveClientUrl(imgPath);
        }

        protected void generateSpecification(string text1, string text2, string text3)
        {
            string textdiv1 = "<div> N/A </div>";
            string textdiv2;
            string textdiv3;

            if (text1.Length > 2 || text2.Length > 2 || text3.Length > 2)
            {
                textdiv1 = "<div>" + text1 + "</div>";
                textdiv2 = "<div>" + text2 + "</div>";
                textdiv3 = "<div>" + text3 + "</div>";

                HtmlGenericControl newdiv1 = new HtmlGenericControl("div");
                newdiv1.Attributes.Add("Class", "normalText");
                newdiv1.InnerHtml = textdiv1;
                prodSpecHolder.Controls.Add(newdiv1);

                HtmlGenericControl newdiv2 = new HtmlGenericControl("div");
                newdiv2.Attributes.Add("Class", "normalText");
                newdiv2.InnerHtml = textdiv2;
                prodSpecHolder.Controls.Add(newdiv2);

                HtmlGenericControl newdiv3 = new HtmlGenericControl("div");
                newdiv3.Attributes.Add("Class", "normalText");
                newdiv3.InnerHtml = textdiv3;
                prodSpecHolder.Controls.Add(newdiv3);
            }
            else
            {
                HtmlGenericControl newdiv = new HtmlGenericControl("div");
                newdiv.Attributes.Add("Class", "normalText");
                newdiv.InnerHtml = textdiv1;
                prodSpecHolder.Controls.Add(newdiv);
            }
        }

        protected void generateFeatures(string text1, string text2, string text3)
        {
            string textdiv1 = "<div> N/A </div>";
            string textdiv2;
            string textdiv3;

            if (text1.Length > 2 || text2.Length > 2 || text3.Length > 2)
            {
                textdiv1 = "<div>" + text1 + "</div>";
                textdiv2 = "<div>" + text2 + "</div>";
                textdiv3 = "<div>" + text3 + "</div>";

                HtmlGenericControl newdiv1 = new HtmlGenericControl("div");
                newdiv1.Attributes.Add("Class", "normalText");
                newdiv1.InnerHtml = textdiv1;
                prodFBHolder.Controls.Add(newdiv1);

                HtmlGenericControl newdiv2 = new HtmlGenericControl("div");
                newdiv2.Attributes.Add("Class", "normalText");
                newdiv2.InnerHtml = textdiv2;
                prodFBHolder.Controls.Add(newdiv2);

                HtmlGenericControl newdiv3 = new HtmlGenericControl("div");
                newdiv3.Attributes.Add("Class", "normalText");
                newdiv3.InnerHtml = textdiv3;
                prodFBHolder.Controls.Add(newdiv3);
            }
            else
            {
                HtmlGenericControl newdiv = new HtmlGenericControl("div");
                newdiv.Attributes.Add("Class", "normalText");
                newdiv.InnerHtml = textdiv1;
                prodFBHolder.Controls.Add(newdiv);
            }
        }

        protected void generateDesc(string text)
        {
            string textdiv = "<div> N/A </div>";
            if (text.Length > 2)
            {
                textdiv = "<div>" + text + "</div>";
            }

            HtmlGenericControl newdiv = new HtmlGenericControl("div");
            newdiv.Attributes.Add("Class", "normalText");
            newdiv.InnerHtml = textdiv;
            prodDescHolder.Controls.Add(newdiv);
        }

        protected string getRadioButtonIdByGroupName(string groupName)
        {
            //loop all controls on the page
            foreach (var control in typeHolder.Controls)
            {
                //check if the control is a radiobutton
                if (control is RadioButton)
                {
                    //cast the control to a radiobutton
                    var radioButton = control as RadioButton;

                    //check if it is the correct group name and if it's checked
                    if (radioButton.GroupName == groupName && radioButton.Checked)
                    {
                        //return the value
                        return radioButton.ID;
                    }
                }
            }

            return "NotFound";
        }

        protected string getRadioButtonTextByGroupName(string groupName)
        {
            //loop all controls on the page
            foreach (var control in typeHolder.Controls)
            {
                //check if the control is a radiobutton
                if (control is RadioButton)
                {
                    //cast the control to a radiobutton
                    var radioButton = control as RadioButton;

                    //check if it is the correct group name and if it's checked
                    if (radioButton.GroupName == groupName && radioButton.Checked)
                    {
                        //return the value
                        return radioButton.Text;
                    }
                }
            }

            return "NotFound";
        }

        protected void Radio_CheckedChanged(Object sender, EventArgs e)
        {
            //string value = "xxxx";
            //Response.Write("<script type=\"text/javascript\">alert(\"This item " + value + "\");</script>");
            //loop all controls on the page
            foreach (var control in typeHolder.Controls)
            {
                //check if the control is a radiobutton
                if (control is RadioButton)
                {
                    //cast the control to a radiobutton
                    var radioButton = control as RadioButton;

                    //check if it is the correct group name and if it's checked
                    if (radioButton.Checked)
                    {
                        foreach (var labelCtr in priceHolder.Controls)
                        {
                            //check if the control is a label
                            if (labelCtr is Label)
                            {
                                //cast the control to a label
                                var priceLabel = labelCtr as Label;

                                //check if it is the correct group name and if it's checked
                                if (priceLabel.ID.ToString() == radioButton.ID.ToString() + "Plbl")
                                {
                                    //return the value
                                    priceLabel.Visible = true;
                                }
                                else
                                {
                                    priceLabel.Visible = false;
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void Add_to_Cart_Click(object sender, EventArgs e)
        {
            string returnStr;
            string prodID = getRadioButtonIdByGroupName("type");
            string pname = productName.Text.ToString();
            string qty = Page.Request.Form["qtyNeed"].ToString();
            string pType = getRadioButtonTextByGroupName("type");

            DataTable Basket_DataTable;

            if (Session["basket"] != null)
                ///read Basket_DataTable from session if exist
                Basket_DataTable = (DataTable)Session["basket"];
            else
            {
                //create an empty DataTable and Add some columns to it
                Basket_DataTable = new DataTable();
                Basket_DataTable.Columns.Add("id");
                Basket_DataTable.Columns.Add("qty");
            }

            //search item in DataTable
            bool Found = false;
            for (int i = 0; i < Basket_DataTable.Rows.Count; i++)
                if (Basket_DataTable.Rows[i][0].ToString() ==
                prodID.ToString())
                    Found = true;

            //add item to DataTable
            if (Found == false)
            {
                DataRow addRow = Basket_DataTable.NewRow();
                addRow["id"] = prodID;
                addRow["qty"] = qty;
                Basket_DataTable.Rows.Add(addRow);
                returnStr = "Successfully add the " + prodID + " (" + pname + " :: " + pType + ") QTY:" + qty + " into your shopping cart";
            }
            else
            {
                returnStr = "Sorry this item already in your cart.";
            }

            Session["basket"] = Basket_DataTable;

            //string message = "You have delete the product(s) from your cart.";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(returnStr);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

            //Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script type=\"text/javascript\">alert(\"" + returnStr + "\");</script>");
            //Response.Write("<script type=\"text/javascript\">alert(\""+returnStr+"\");</script>");
        }
    }
}