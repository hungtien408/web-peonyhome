﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "PEONY HOME";
            var meta = new HtmlMeta() { Name = "description", Content = "PEONY HOME" };
            Header.Controls.Add(meta);
        }
    }
}