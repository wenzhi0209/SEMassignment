using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Web.Services;
using System.Data;

namespace SEMAssignment
{
    public partial class PNWX_main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";MultipleActiveResultSets = true";
            SqlConnection connDb = new SqlConnection(strConn);
            connDb.Open();

            //add Descending order will show latest product
            string getSlideProduct = "SELECT TOP 3 [product_Id], [product_name], [product_description], [product_image] FROM [Product] ORDER BY [product_Id]";
            SqlCommand cmdSelect2 = new SqlCommand(getSlideProduct, connDb);
            SqlDataReader slideList = cmdSelect2.ExecuteReader();
            if (slideList.HasRows)
            {
                while (slideList.Read())
                {
                    generateSlide(slideList["product_name"].ToString(),
                        slideList["product_description"].ToString(),
                        slideList["product_Id"].ToString(),
                        slideList["product_image"].ToString());
                }
            }

            connDb.Close();
        }

        protected void generateSlide(string pName, string pDesc, string pID, string imgPath)
        {
            //string imgurl = ResolveClientUrl("~/productImage/test.png");
            //string btnID = "btn" + pID;
            string slideDiv = "" +
                    "<div class=\"slideCon\">" +
                        "<div class=\"imageSec\">" +
                            "<img src = \""+imgPath+"\" />" +
                        "</div>" +

                    "<div class=\"textSec\">" +
                        "<div class=\"comName\">Pacific Northwest X-Ray Inc</div>" +
                        "<br />" +
                        "<hr style = \"width: 10%; margin-left: 0;\" >" +
                         "<div class=\"shortDesc\">" +
                            "<div class=\"productName\">" + pName + "</div>" +
                            "<br />" +
                            "<div class=\"description\">" +
                                pDesc +
                            "</div>" +
                        "</div>" +

                        "<br />" +
                        "<hr style =\"width: 8%; margin-left: 0;\" >" +
                         "<br />" +

                        "<div class=\"buttonSec\">" +
                            "<button class=\"cartBtn\" runat=\"server\" onClick=\"cartTest('" + pID +"','"+pName+ "')\">" +
                                "<div class=\"cart_icon_div\">" +
                                "<img class=\"cart_icon\"" + "src=\"icon\\shopping-cart-white.png\" />" +
                                "</div>"+
                                "<div class=\"cart_text\">Add to Cart</div>" +
                            "</button>" +
                            "<a class=\"viewBtn\" href=\"Product_details.aspx?para=" + pID + "\">View More" +
                            "</a>" +
                        "</div>" +
                    "</div>" +
                "</div>";
            //onserverclick = "Add_to_Cart_Click"
            HtmlGenericControl newdiv = new HtmlGenericControl("div");
            newdiv.Attributes.Add("class", "slideShow");
            newdiv.InnerHtml = slideDiv;
            slideHolder.Controls.Add(newdiv);
        }


        //This web method only for passing value from javascript to backend
        [System.Web.Services.WebMethod]
        public static string Add_to_Cart_Click(string pid,string pname)
        {
            DataTable Basket_DataTable;
           
            if (System.Web.HttpContext.Current.Session["basket"] != null)
                ///read Basket_DataTable from session if exist
                Basket_DataTable = (DataTable)System.Web.HttpContext.Current.Session["basket"];
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
                pid.ToString())
                    Found = true;

            //add item to DataTable
            int qty = 1;
            string returnStr="";
            if (Found == false)
            {
                
                DataRow addRow = Basket_DataTable.NewRow();
                addRow["id"] = pid;
                addRow["qty"] = qty;
                Basket_DataTable.Rows.Add(addRow);
                returnStr = "Successfully add the " + pid + " (" +pname+ ") QTY: 1 into your shopping cart";
            }
            else
            {
                returnStr = "Sorry this item already in your cart.";
            }

            System.Web.HttpContext.Current.Session["basket"] = Basket_DataTable;
            

            return returnStr;
        }
    }
}