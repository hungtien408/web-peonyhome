using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            Page.Header.DataBind();
            string page = Request.Url.PathAndQuery.ToLower();

            string startScript = "<script type='text/javascript'>";
            string endScript = "')</script>";
            string activePage = "";

            if (page.Contains("-p-") || page.Contains("-pd-") || page.Contains("san-pham.aspx"))
                activePage = "san-pham.aspx";
            else if (page.Contains("-tv-") || page.Contains("tu-van-ky-thuat.aspx"))
                activePage = "tu-van-ky-thuat.aspx";
            else if (!page.EndsWith("default.aspx"))
                activePage = Path.GetFileName(page);

            if (!string.IsNullOrEmpty(activePage))
                runScript.InnerHtml = startScript + "changeActiveMenu('" + activePage + endScript;

            runScript.InnerHtml += startScript + "changeSubActiveMenu('" + Path.GetFileName(page) + endScript;
        }
    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (Session["Cart"] != null)
        {
            var oShoppingCart = new ShoppingCart();
            var dt = oShoppingCart.Cart();
            if (dt.Rows.Count == 0)
            {
                lblSummary.Text = "0";
            }
            else
            {
                int quantity = 0;
                double Total = 0;
                //for (int i = 0; i < dt.Rows.Count; i++)
                //{
                //    quantity += int.Parse(dt.Rows[i]["Quantity"].ToString());
                //}

                foreach (DataRow dr in dt.Rows)
                {
                    var Quantity = Convert.ToInt32(string.IsNullOrEmpty(dr["Quantity"].ToString()) ? "0" : dr["Quantity"]);
                    var Price = Convert.ToDouble(string.IsNullOrEmpty(dr["Price"].ToString()) ? 0 : dr["Price"]);
                    Total += Quantity * Price;
                    quantity += Quantity;
                }
                lblSummary.Text = quantity.ToString();
                lblSummary2.Text = quantity.ToString();
                //lblTotalPrice.Text = string.Format("{0:##,###.##}", Total).Replace('.', '*').Replace(',', '.').Replace('*', ',') + "đ";
            }
            lstCart2.DataSource = odsCart;
            lstCart2.DataBind();

            lstCart.DataSource = odsCart;
            lstCart.DataBind();
        }
    }
    protected void btnNewLetter_Click(object sender, EventArgs e)
    {
        if (txtNewLetter.Text != "")
        {
            new TLLib.Newsletter().NewsletterInsert(txtNewLetter.Text.ToString().Trim());
        }
        txtNewLetter.Text = "";
    }
    protected void btnGui_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            var dtCart = Session["Cart"] as DataTable;
            if (dtCart != null)
            {
                double Amount = 0, sAmount = 0;
                string Body = "<div style='width: 100%; font-size: 14px; font-family: Arial;'>";
                //Body += "<h3 style='color: rgb(204,102,0); font-size: 22px; border-bottom-color: gray; border-bottom-width: 1px;border-bottom-style: dashed; margin-bottom: 20px; font-family: Times New Roman;'>";
                //Body += "Cảm ơn bạn đã đăng ký tham gia English Camp 2015";
                //Body += "</h3>";
                Body += "<p>Họ và tên: " + txtFullName.Text + "</p>";
                Body += "<p>Email: " + txtEmail.Text + "</p>";
                Body += "<p>Điện thoại: " + txtPhone.Text + "</p>";
                Body += "<p>Nội dung: " + txtContent.Text + "</p>";
                Body +=
                    "<table style='font-size: 11px; font-family: Verdana; padding: 10px; border: 1px solid #C7D7DB; width: 100%;border-collapse: collapse;' cellpadding='0' cellspacing='0'>";
                //Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Cỡ/Size</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";
                Body +=
                    "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Màu/Color</th><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Kích thước/Size</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";

                foreach (DataRow dr in dtCart.Rows)
                {
                    string ProductCode = dr["Tag"].ToString();
                    //string ProductID = dr["ProductID"].ToString();
                    string ProductName = dr["ProductName"].ToString();
                    string ImageColor = dr["ImageName"].ToString();
                    string Quantity = dr["Quantity"].ToString();
                    string Price = dr["Price"].ToString();
                    string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                    string ProductLengthName = dr["ProductLengthName"].ToString();
                    double tPrice = Convert.ToDouble(Price)*Convert.ToDouble(Quantity);

                    var itemPrice =
                        string.Format("{0:##,###.##}", tPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') +
                        " VND";
                    var sPrice =
                        string.Format("{0:##,###.##}", dr["Price"])
                            .Replace('.', '*')
                            .Replace(',', '.')
                            .Replace('*', ',') + " VND";
                    Amount += Convert.ToDouble(Price)*Convert.ToDouble(Quantity);
                    Body += "<tr>";
                    Body += "<td style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" +
                            ProductName + " - " + ProductCode + " - " + ProductOptionCategoryName + " - " +
                            ProductLengthName + "</td>";
                    //Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductColorName + "</td>";
                    Body += string.IsNullOrEmpty(ImageColor) ? "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'><p style='text-align:center;'>null</p></td>" : "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'><img runat='server' src='~/res/productoptioncategory/" + ImageColor + "' alt=''/></td>";
                    Body += string.IsNullOrEmpty(ProductLengthName) ? "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'><p style='text-align:center;'>null</p></td>" : "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductLengthName + "</td>";
                    Body +=
                        "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" +
                        Quantity + "</td>";
                    Body +=
                        "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" +
                        sPrice + "</td>";
                    Body +=
                        "<td align='right' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" +
                        itemPrice + "</td>";
                    Body += "</tr>";
                }
                Body += "</table>";
                Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master",
                    txtEmail.Text, "hungtien408@gmail.com", "XÁC NHẬN MUA HÀNG", Body, true);

                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime",
                    " $(document).ready(function () {alert('Chúc mừng bạn đã mua hàng thành công !');});",
                    true);

                txtFullName.Text = "";
                txtPhone.Text = "";
                txtEmail.Text = "";
                txtContent.Text = "";
            }
            var oShoppingCart = new ShoppingCart();
            oShoppingCart.DeleteAllItem();
        }
    }
    protected void btnVN_Click(object sender, ImageClickEventArgs e)
    {
        string path = Path.GetFileName(Request.Url.AbsolutePath);
        if (path.ToLower() == "default.aspx")
        {
            path = "";
        }
        Response.Redirect("~/" + path);
    }
    protected void btnEN_Click(object sender, ImageClickEventArgs e)
    {
        string path = Path.GetFileName(Request.Url.AbsolutePath);
        if (path.ToLower() == "default.aspx")
        {
            path = "";
        }
        Response.Redirect("~/en/" + path);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("search-result.aspx?kw=" + txtSearch.Text.Trim());
    }
    protected void btnSearch2_Click(object sender, EventArgs e)
    {
        Response.Redirect("search-result.aspx?kw=" + txtSearch2.Text.Trim());
    }
}
