using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SEMAssignment
{
    public partial class sub_catalogue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            subtitle.Text = Request.QueryString["prod_cat"].ToString();
            
        }

        protected void LinkButton1_Click (object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            String id = "";

            if (btn.ID == "LinkButton2")
            {
                id = btn.CommandArgument;
            }

            if (id == null)
            {
                id = "does not exist";
            }

            Response.Redirect("Product_details.aspx?para=" + id);
        }
    }
}