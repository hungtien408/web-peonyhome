using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class Search_Result : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (((DataView)odsProduct.Select()).Count > 0)
            {
                lblCountProduct.Text = ((DataView)odsProduct.Select()).Count.ToString();
                lblKeyword.Text = Request.QueryString["kw"];
            }
            else
            {
                Response.Redirect("search-not-result.aspx?kw=" + Request.QueryString["kw"]);
            }
        }
    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
}