<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="product-detail.aspx.cs" Inherits="Product_Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-bg">
        <div class="container">
            <%--<div class="site">
                <a class="active" href="#">phòng ngủ</a>
            </div>--%>
            <asp:ListView ID="lstBreadcrum" runat="server" DataSourceID="odsBreadcrum" EnableModelValidation="True">
                <ItemTemplate>
                    <%# Container.DataItemIndex == ((System.Data.DataView)odsBreadcrum.Select()).Count - 1 ? "<span>" + Eval("ProductCategoryName") + "</span>" : "<a href='" + progressTitle(Eval("ProductCategoryName")) + "-pci-" + Eval("ProductCategoryID") + ".aspx" + "'>" + Eval("ProductCategoryName") + "</a><span class='icon-site fa fa-angle-right'></span> "%>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="site">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsBreadcrum" runat="server" SelectMethod="ProductCategoryHierarchyToTopSelectAll"
                TypeName="TLLib.ProductCategory">
                <SelectParameters>
                    <asp:QueryStringParameter Name="CurrentProductCategoryID" QueryStringField="pci"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <div class="row pro-detail">
                <div class="col-md-5">
                    <asp:FormView ID="FormView1" runat="server" DataSourceID="odsProductImage">
                        <ItemTemplate>
                            <div class="details-img">
                                <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/album/" + Eval("ImageName") : "~/assets/images/img4.png" %>'
                                    runat="server" />
                                <a href='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "~/assets/images/img4.png" %>'
                                    class="fancybox zoom-details" data-fancybox-group="gallery"><span>zoom</span></a>
                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
                <div class="col-md-5">
                    <asp:ListView ID="lstProductDetails" runat="server" DataSourceID="odsProductDetails"
                        EnableModelValidation="True" OnItemCommand="lstProductDetails_ItemCommand">
                        <ItemTemplate>
                            <div class="central">
                                <div class="central-top">
                                    <div class="central-box">
                                        <asp:HiddenField ID="hdnProductID" Value='<%# Eval("ProductID") %>' runat="server" />
                                        <asp:HiddenField ID="hdnProductName" Value='<%# Eval("ProductName") %>' runat="server" />
                                        <asp:HiddenField ID="hdnPrice" Value='<%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "0" : Eval("Price") %>'
                                            runat="server" />
                                        <h1>
                                            <%# Eval("ProductName") %></h1>
                                        <p>
                                            Mã sản phẩm:
                                            <%# Eval("Tag") %></p>
                                        <p>
                                            <%# !string.IsNullOrEmpty(Eval("Price").ToString()) ?(string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',')) :  "" %><%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "" : "VNĐ"%></p>
                                        <div class="social-icos icos-mobi">
                                            <ul>
                                                <li><a href="#"><span class="fa fa-facebook"></span></a></li>
                                                <li><a href="#"><span class="fa fa-youtube"></span></a></li>
                                                <li><a href="#"><span class="fa fa-twitter"></span></a></li>
                                                <li><a href="#"><span class="fa fa-envelope"></span></a></li>
                                                <li><a href="#"><span class="fa fa-print"></span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <%--<ul class="selecc-colores">
                                        <li><a href="#">
                                            <img src="assets/images/img2.png" alt="#" /></a></li>
                                        <li><a href="#">
                                            <img src="assets/images/img3.png" alt="#" /></a></li>
                                    </ul>--%>
                                    <asp:HiddenField ID="hdnProductOptionCategoryID" runat="server" />
                                    <asp:ListView ID="lstColor" runat="server" DataSourceID="odsColor" EnableModelValidation="True">
                                        <ItemTemplate>
                                            <li><a href="javascript:void(0);" productcolorid='<%# Eval("ProductOptionCategoryID") %>'
                                                class="color-img">
                                                <img alt='<%# Eval("ImageNameColor") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageNameColor").ToString()) ? "~/res/productoptioncategory/" + Eval("ImageNameColor") : "~/assets/images/color-img-1.gif" %>'
                                                    runat="server" /></a> </li>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <ul class="selecc-colores">
                                                <span runat="server" id="itemPlaceholder" />
                                            </ul>
                                        </LayoutTemplate>
                                    </asp:ListView>
                                    <asp:ObjectDataSource ID="odsColor" runat="server" SelectMethod="ProductSizeColorSelectAll"
                                        TypeName="TLLib.ProductSizeColor">
                                        <SelectParameters>
                                            <asp:Parameter Name="ProductLengthID" Type="String" />
                                            <asp:Parameter Name="ProductOptionCategoryID" Type="String" />
                                            <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
                                            <asp:Parameter DefaultValue="True" Name="InStock" Type="String" />
                                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                            <asp:Parameter Name="Priority" Type="String" />
                                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <div class="clr">
                                    </div>
                                    <div class="bnt-add">
                                        <span class="sanpham"><a class="link-pro" href="#proList">Các sản phẩm</a></span>
                                        <span class="add">
                                            <asp:LinkButton ID="lkbAddToCart" runat="server" CommandName="AddToCart" ValidationGroup="cart">Thêm vào giỏ hàng</asp:LinkButton></span>
                                    </div>
                                </div>
                                <div class="slider">
                                    <asp:ListView ID="lstProductImage" runat="server" DataSourceID="odsProductImage"
                                        EnableModelValidation="True">
                                        <ItemTemplate>
                                            <div class="slide">
                                                <div class="img-details">
                                                    <a href='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "~/assets/images/img4.png" %>'
                                                        class="fancybox" data-fancybox-group="gallery">
                                                        <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/album/" + Eval("ImageName") : "~/assets/images/img4.png" %>'
                                                            runat="server" /></a>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <div class="central-bot">
                                                <li runat="server" id="itemPlaceholder"></li>
                                            </div>
                                        </LayoutTemplate>
                                    </asp:ListView>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsProductDetails" runat="server" SelectMethod="ProductSelectOne"
                        TypeName="TLLib.Product">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="odsProductImage" runat="server" SelectMethod="ProductImageSelectAll"
                        TypeName="TLLib.ProductImage">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <div class="col-md-2 pad-0">
                    <div class="social-icos icos-desktop">
                        <ul>
                            <li><a href="#"><span class="fa fa-facebook"></span></a></li>
                            <li><a href="#"><span class="fa fa-youtube"></span></a></li>
                            <li><a href="#"><span class="fa fa-twitter"></span></a></li>
                            <li><a href="#"><span class="fa fa-envelope"></span></a></li>
                            <li><a href="#"><span class="fa fa-print"></span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <asp:ListView ID="lstProductSame" runat="server" DataSourceID="odsProductSame" EnableModelValidation="True"
                DataKeyNames="ProductID" OnItemCommand="lstProductSame_ItemCommand">
                <ItemTemplate>
                    <div class="row detail">
                        <div class="col-md-5">
                            <div class="main-img1">
                                <a href='javascript:void(0);'>
                                    <img id="Img1" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/img1.jpg" %>'
                                        runat="server" /></a>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="central">
                                <div class="central-box1">
                                    <asp:HiddenField ID="hdnProductName" Value='<%# Eval("ProductName") %>' runat="server" />
                                    <asp:HiddenField ID="hdnProductCode" Value='<%# Eval("Tag") %>' runat="server" />
                                    <h1>
                                        <%# Eval("ProductName") %></h1>
                                    <p class="code">
                                        Mã sản phẩm :
                                        <%# Eval("Tag") %></p>
                                    <p class="price">
                                        <asp:ListView ID="lstPrice" runat="server" DataSourceID="odsPrice" EnableModelValidation="True">
                                            <ItemTemplate>
                                                <%# !string.IsNullOrEmpty(Eval("Price").ToString()) ?(string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',')) :  "" %><%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "" : "VNĐ"%>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <asp:HiddenField ID="hdnProductLengthID" Value='<%# Eval("ProductLengthID") %>' runat="server" />
                                                <asp:HiddenField ID="hdnPrice" Value='<%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "0" : Eval("Price") %>'
                                                    runat="server" />
                                                <span runat="server" id="itemPlaceholder" />
                                            </LayoutTemplate>
                                        </asp:ListView>
                                        <asp:ObjectDataSource ID="odsPrice" runat="server" SelectMethod="ProductLengthSelectOne"
                                            TypeName="TLLib.ProductLength">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="dropListSize" Name="ProductLengthID" PropertyName="SelectedValue"
                                                    Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </p>
                                </div>
                                <div class="bnt-add bnt-add2">
                                    <span class="add">
                                        <asp:LinkButton ID="lkbAddToCart" runat="server" CommandName="AddToCart" ValidationGroup="cart2">Thêm vào giỏ hàng</asp:LinkButton></span>
                                </div>
                                <div class="product-size">
                                    <asp:HiddenField ID="hdnProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                                    <asp:DropDownList ID="dropListSize" CssClass="size-box1 size-box" runat="server"
                                        DataSourceID="odsListSize" DataTextField="ProductLengthName" DataValueField="ProductLengthID"
                                        AutoPostBack="True" AppendDataBoundItems="true">
                                        <asp:ListItem Value="">-- Chọn kích thước --</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="odsListSize" runat="server" SelectMethod="ProductSizeColorSelectAll"
                                        TypeName="TLLib.ProductSizeColor">
                                        <SelectParameters>
                                            <asp:Parameter Name="ProductLengthID" Type="String" />
                                            <asp:Parameter Name="ProductOptionCategoryID" Type="String" />
                                            <asp:ControlParameter ControlID="hdnProductID" Name="ProductID" PropertyName="Value"
                                                Type="String" />
                                            <asp:Parameter Name="InStock" Type="String" />
                                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                            <asp:Parameter Name="Priority" Type="String" />
                                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 pad-0">
                            <div class="menu-prod">
                                <ul class="accordion">
                                    <li>
                                        <div class="link">
                                            chất liệu sản phẩm</div>
                                        <div class="submenu">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductMaterial") %>'></asp:Label>
                                        </div>
                                    </li>
                                    <li class="line-sub"></li>
                                    <li>
                                        <div class="link">
                                            chăm sóc sản phẩm</div>
                                        <div class="submenu">
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductCare") %>'></asp:Label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="proList">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsProductSame" runat="server" SelectMethod="ProductOfSameSelectAll"
                TypeName="TLLib.ProductOfSame">
                <SelectParameters>
                    <asp:Parameter Name="StartRowIndex" Type="String" />
                    <asp:Parameter Name="EndRowIndex" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="ProductOfSameID" Type="String" />
                    <asp:Parameter Name="ProductID" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                    <asp:QueryStringParameter QueryStringField="pi" Name="ProductParentID" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <div class="row seen">
                <h2>
                    sản phẩm đã xem gần đây</h2>
            </div>
            <asp:ListView ID="lstProductView" runat="server" DataSourceID="odsProductView" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                        <div class="product-img">
                            <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                <img class="img-responsive" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/hinh8.png" %>'
                                    runat="server" /></a>
                            <div class="seen-price-bg">
                                <div class="seen-price">
                                    <p>
                                        <%# Eval("ProductName") %></p>
                                    <p>
                                        <%# !string.IsNullOrEmpty(Eval("Price").ToString()) ?(string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', '.')) :  "" %><%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "" : "VNĐ"%></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="row produc-tblist">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsProductView" runat="server" SelectMethod="View" TypeName="ViewProduct">
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
