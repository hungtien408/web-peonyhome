﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search_Not_Result : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblKeyword.Text = Request.QueryString["kw"];
    }
}