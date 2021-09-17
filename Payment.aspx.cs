using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SEMAssignment
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (ddlPaymentMethod.SelectedValue == "Visa")
            {

                RegularExpressionValidator1.ValidationExpression = "^4[0-9]{12}(?:[0-9]{3})?$";
                RegularExpressionValidator1.ErrorMessage = "Enter a valid credit card number!";
            }
            else if (ddlPaymentMethod.SelectedValue == "Master Card")
            {
                RegularExpressionValidator1.ValidationExpression = "^(5[1-5][0-9]{14}|2(22[1-9][0-9]{12}|2[3-9][0-9]{13}|[3-6][0-9]{14}|7[0-1][0-9]{13}|720[0-9]{12}))$";
                RegularExpressionValidator1.ErrorMessage = "Enter a valid credit card number!";
            }
            else if (ddlPaymentMethod.SelectedValue == "American Express")
            {
                RegularExpressionValidator1.ValidationExpression = "^3[47][0-9]{13}$";
                RegularExpressionValidator1.ErrorMessage = "Enter a valid credit card number!";
            }
            else if (ddlPaymentMethod.SelectedValue == "Discover Noxus")
            {
                RegularExpressionValidator1.ValidationExpression = "^(?:6(?:011|5[0-9][0-9])[0-9]{12})$";
                RegularExpressionValidator1.ErrorMessage = "Enter a valid credit card number!";
            }
        }

        protected void Button1_CheckOut(object sender, EventArgs e)
        {
            Session["PaymentMethod"] = ddlPaymentMethod.Text;
            Session["CardNumber"] = cardNoTxtBox.Text;
            Session["FirstName"] = fnTxtBox.Text;
            Session["LastName"] = lnTxtBox.Text;
            Session["DeliveryAddress"] = deliveryAddressTxtBox.Text;
            Session["Country"] = countryTxtBox.Text;
            Session["ZipCode"] = zipTxtBox.Text;
            Session["PhoneNo"] = phoneTxtBox.Text;

            Response.Redirect("PaymentSummary.aspx");
             /*string address = deliveryAddressTxtBox.Text;
            string paymentMethod = ddlPaymentMethod.SelectedValue;
            string cardNo = cardNoTxtBox.Text;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strCon))
            {
                con.Open();

                Session["PurchaseTime"] = DateTime.Now;

                // Move zero-quantity item to new cartlist
                SqlCommand cmd = new SqlCommand("BEGIN " +
                    "IF EXISTS " +
                    "(SELECT OrderQty " +
                    "FROM CartList, CartItem " +
                    "WHERE CartList.UserId = @userId AND CartList.Status = 0 AND CartList.CartId = CartItem.CartId AND CartItem.OrderQty = 0) " +
                    "BEGIN " +
                    "   INSERT INTO CartList(UserId, Status) VALUES(@userId, -1) " +
                    "   UPDATE CartItem SET CartId = (SELECT CartId FROM CartList WHERE UserId = @userId AND Status = -1) WHERE OrderQty = 0 AND CartId = (SELECT CartId FROM CartList WHERE UserId = @userId AND Status = 0); " +
                    "END " +
                    "END", con);

                // New entry in payment table
                cmd.CommandText = "INSERT INTO Payment(UserId, CartId, PurchaseDate, TotalPrice, PaymentType, CardNumber, DeliveryAddress) " +
                       "VALUES (@userId, (SELECT CartId FROM CartList WHERE UserId = @userId AND Status = 0), @date, @price, @paymenttype, @cardnumber, @deliveryaddress);";

                // Retrieve parameter from query string
                cmd.Parameters.AddWithValue("@date", Session["PurchaseTime"]);
                cmd.Parameters.AddWithValue("@price", Session["TotalPrice"]);
                cmd.Parameters.AddWithValue("@paymenttype", paymentMethod);
                cmd.Parameters.AddWithValue("@cardnumber", cardNo);
                cmd.Parameters.AddWithValue("@deliveryaddress", address);
                cmd.ExecuteNonQuery();
                Button_Send_Email();
                Response.Redirect("PurchaseSummary.aspx");
                con.Close();

                Session["PurchaseTime"] = null;
            }*/
            
        }

        private string Make_Content()
        {

            StreamReader str = File.OpenText(Server.MapPath("~/EmailTemplate.html"));
            string mailBodyTemplate = str.ReadToEnd();
            str.Close();

            DataTable dt = (DataTable)Session["CheckingOutCart"];

            // Make the content string for email
            StringBuilder sb = new StringBuilder("");

            foreach (DataRow row in dt.Rows)
            {
                sb.Append(String.Format("<tr><td style=\"padding: 0px 15px;\">{0}</td><td style=\"padding: 0px 15px;text-align:left\">{1}</td><td style=\"padding: 0px 15px;text-align:right;\">{2:n}</td><td style=\"padding: 0px 15px;text-align:right\">{3}</td><td style=\"padding: 0px 15px;text-align:right\">{4:n}</td></tr>",
                    Session["PurchaseTime"], row[2], row[3], row[4], row[7]));
            }

            return String.Format(mailBodyTemplate, sb.ToString(), Session["TotalPrice"]);
        }

        protected void Button_Send_Email()
        {
            // p3278@tarc.edu.my

            // Get current user
            String email = "taruc.rsf2g7.assigment@gmail.com";
            String name = "Mr Lim Fung Ji";
            var toAddress = new MailAddress(email, name);
            const string subject = "[Assignment]Thank you for your purchase on PNWX";

            var smtp = new SmtpClient();

            var message = new MailMessage()
            {
                Subject = subject,
                Body = Make_Content(),
                IsBodyHtml = true
            };
            message.To.Add(toAddress);
            smtp.Send(message);
        }
    }
}