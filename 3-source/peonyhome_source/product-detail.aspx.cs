using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class Product_Detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["pi"]))
        {
            var oProduct = new Product();
            var dv = oProduct.ProductSelectOne(Request.QueryString["pi"]).DefaultView;
            ViewProduct view = new ViewProduct();
            view.CreateView(dv[0]["ProductID"].ToString(), dv[0]["CategoryID"].ToString(), dv[0]["ImageName"].ToString(), dv[0]["ProductName"].ToString(), !string.IsNullOrEmpty(dv[0]["Price"].ToString()) ? (string.Format("{0:##,###.##}", dv[0]["Price"]).Replace('.', '*').Replace(',', '.').Replace('*', ',')) : "");
        }
        if (!IsPostBack)
        {
            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["pi"]))
            {
                var oProduct = new Product();
                var dv = oProduct.ProductSelectOne(Request.QueryString["pi"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                strTitle = Server.HtmlDecode(row["ProductCategoryName"].ToString());
                strDescription = Server.HtmlDecode(row["Description"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTittle"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescription"].ToString());

                //hdnSanPham.Value = progressTitle(dv[0]["ProductCategoryName"].ToString()) + "-pci-" + dv[0]["ProductCategoryID"].ToString() + ".aspx";
            }
            else
            {
                strTitle = strMetaTitle = "Sản Phẩm";
                strDescription = "";
                strMetaDescription = "";
            }
            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta() { Name = "description", Content = !string.IsNullOrEmpty(strMetaDescription) ? strMetaDescription : strDescription };
            Header.Controls.Add(meta);

            //lblTitle.Text = strTitle;
        }
    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
    protected void lstProductDetails_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        var item = e.Item as ListViewDataItem;
        var cmd = e.CommandName;
        var ProductOptionCategoryID = (item.FindControl("hdnProductOptionCategoryID") as HiddenField).Value;
        var ProductID = (item.FindControl("hdnProductID") as HiddenField).Value;
        var ProductName = (item.FindControl("hdnProductName") as HiddenField).Value;
        var ProductLengthID = "";//(item.FindControl("hdnProductLengthID") as HiddenField).Value;
        var ProductLengthName = "";//(item.FindControl("hdnProductLengthName") as HiddenField).Value;
        var Quantity = "1";
        double Price = Convert.ToDouble((item.FindControl("hdnPrice") as HiddenField).Value);
        string ProductSizeColorID1 = "";
        string ImageColor = "";
        string ImageName = "";
        string QuantityList = "";
        int SizeColorQuantity1 = 0;
        var oProductSizeColor = new ProductSizeColor();
        var oProductOptionCategory = new ProductOptionCategory();
        var oProductImage = new ProductImage();

        var oShoppingCart = new ShoppingCart();
        if (cmd == "AddToCart")
        {
            if (ProductID != "")
            {
                if (oShoppingCart.HasItem(ProductID) && oShoppingCart.HasColor(ProductOptionCategoryID))
                {
                    var dtCart = HttpContext.Current.Session["Cart"] as DataTable;

                    string a = (from DataRow dr in dtCart.Rows
                                where dr["ProductID"].ToString() == ProductID
                                select dr).FirstOrDefault()["Quantity"].ToString();
                    oShoppingCart.UpdateQuantity(ProductID, ProductLengthID, ProductOptionCategoryID, (Convert.ToInt32(a) + Convert.ToInt32(1)).ToString());
                }
                else
                {
                    var dv = oProductSizeColor.ProductSizeColorSelectAll(ProductLengthID, ProductOptionCategoryID, ProductID, "True",
                                                                     "True", "", "True").DefaultView;
                    var dv2 = oProductOptionCategory.ProductOptionCategorySelectOne(ProductOptionCategoryID).DefaultView;
                    var dv3 = oProductImage.ProductImageSelectAll(ProductID, "True", "", "True").DefaultView;
                    if (dv.Count != 0 || dv2.Count != 0)
                    {
                        ProductSizeColorID1 = dv[0]["ProductSizeColorID"].ToString();
                        ImageColor = dv2[0]["ImageName"].ToString();
                        SizeColorQuantity1 = Convert.ToInt32(dv[0]["Quantity"].ToString()) - Convert.ToInt32(dv[0]["QuantitySale"].ToString());
                        for (int i = 1; i <= SizeColorQuantity1; i++)
                        {
                            QuantityList = QuantityList + i + ",";
                        }
                    }
                    else
                    {
                        ProductSizeColorID1 = "";
                        ImageColor = "";
                        SizeColorQuantity1 = 0;
                    }

                    if (dv3.Count != 0)
                    {
                        ImageName = dv3[0]["ImageName"].ToString();
                    }
                    else
                    {
                        ImageName = "";
                    }
                    
                    
                    
                    oShoppingCart.CreateCart(ProductID,
                        ImageName,
                        ImageColor,
                        ProductName,
                        "",
                        "",
                        ProductOptionCategoryID,
                        "",
                        ProductLengthID,
                        ProductLengthName,
                        ProductSizeColorID1,
                        Quantity,
                        SizeColorQuantity1.ToString(),
                        Price,
                        false
                    );
                }
            }


            //ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", "myconfirmPopup('" + "<strong>" + ProductName + " - " + ProductCode + " - " + ProductOptionCategoryName + "</strong><br/> đã được thêm vào giỏ hàng" + "')", true);
        }
    }
    protected void lstProductSame_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        var item = e.Item as ListViewDataItem;
        var lstPrice = item.FindControl("lstPrice");
        var cmd = e.CommandName;
        var ProductOptionCategoryID = "";//(item.FindControl("hdnProductOptionCategoryID") as HiddenField).Value;
        var ProductID = (item.FindControl("hdnProductID") as HiddenField).Value;
        var ProductName = (item.FindControl("hdnProductName") as HiddenField).Value;
        var ProductCode = (item.FindControl("hdnProductCode") as HiddenField).Value;
        var ProductLengthID = "";//(item.FindControl("hdnProductLengthID") as HiddenField).Value;
        var ProductLengthName = "";//(item.FindControl("hdnProductLengthName") as HiddenField).Value;
        var Quantity = "1";
        //double Price = Convert.ToDouble((item.FindControl("hdnPrice") as HiddenField).Value);
        string ProductSizeColorID1 = "";
        string QuantityList = "";
        int SizeColorQuantity1 = 0;
        var oProductSizeColor = new ProductSizeColor();
        var dropList = item.FindControl("dropListSize") as DropDownList;

        var oShoppingCart = new ShoppingCart();
        if (cmd == "AddToCart")
        {
            if (ProductID != "")
            {
                if (oShoppingCart.HasItem(ProductID))
                {
                    var dtCart = HttpContext.Current.Session["Cart"] as DataTable;

                    string a = (from DataRow dr in dtCart.Rows
                                where dr["ProductID"].ToString() == ProductID
                                select dr).FirstOrDefault()["Quantity"].ToString();
                    oShoppingCart.UpdateQuantity(ProductID, ProductLengthID, ProductOptionCategoryID,
                        (Convert.ToInt32(a) + Convert.ToInt32(1)).ToString());
                }
                else
                {
                    if (dropList.SelectedIndex == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime",
                        " $(document).ready(function () {alert('Vui lòng chọn kích thước !');});",
                        true);
                    }
                    else
                    {
                        var oProductLength = new ProductLength();
                        var data = oProductLength.ProductLengthSelectOne(dropList.SelectedValue).DefaultView;
                        double Price = Convert.ToDouble(data[0]["Price"].ToString());
                        ProductLengthName = data[0]["ProductLengthName"].ToString();

                        var dv =
                        oProductSizeColor.ProductSizeColorSelectAll(ProductLengthID, ProductOptionCategoryID, ProductID,
                            "True",
                            "True", "", "True").DefaultView;
                        ProductSizeColorID1 = "";
                        SizeColorQuantity1 = 0;
                        //Convert.ToInt32(dv[0]["Quantity"].ToString()) - Convert.ToInt32(dv[0]["QuantitySale"].ToString());
                        for (int i = 1; i <= SizeColorQuantity1; i++)
                        {
                            QuantityList = QuantityList + i + ",";
                        }
                        oShoppingCart.CreateCart(ProductID,
                            "",
                            "",
                            ProductName,
                            "",
                            ProductCode,
                            ProductOptionCategoryID,
                            "",
                            ProductLengthID,
                            ProductLengthName,
                            ProductSizeColorID1,
                            Quantity,
                            SizeColorQuantity1.ToString(),
                            Price,
                            false
                            );
                    }

                }
            }


            //ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", "myconfirmPopup('" + "<strong>" + ProductName + " - " + ProductCode + " - " + ProductOptionCategoryName + "</strong><br/> đã được thêm vào giỏ hàng" + "')", true);
        }
    }
}