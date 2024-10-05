using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Candy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        double total = Convert.ToDouble(ddlQuantity.SelectedValue);
        lblMessage.Text = $"You ordered {ddlQuantity.SelectedItem.Text} candy for a total of ${total.ToString("0.00")}.";
    }
}