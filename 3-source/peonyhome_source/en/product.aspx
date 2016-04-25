<%@ Page Title="" Language="C#" MasterPageFile="~/en/site.master" AutoEventWireup="true"
    CodeFile="product.aspx.cs" Inherits="porduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <asp:HiddenField ID="hdnSanPham" runat="server" />
    <a class="a-link-sp" href="<%= hdnSanPham.Value %>"></a>
    <div class="banner-wrap">
        <asp:ListView ID="lstBannerProduct" runat="server" DataSourceID="odsBannerProduct"
            EnableModelValidation="True">
            <ItemTemplate>
                <img class="img-responsive" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/productcategory/" + Eval("ImageName") : "~/assets/images/hinh1.jpg" %>' runat="server" />
            </ItemTemplate>
            <LayoutTemplate>
                <div class="banner-wimg">
                    <span runat="server" id="itemPlaceholder" />
                </div>
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsBannerProduct" runat="server" SelectMethod="ProductCategorySelectOne"
            TypeName="TLLib.ProductCategory">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductCategoryID" QueryStringField="pci" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <%--<div class="link-show text-center">
            <a href="#productShow"><span class="ic-up">[+] bấm vào để mua sản phẩm</span><span
                class="ic-down">[-] bấm vào để tắt</span></a></div>--%>
    </div>
    <div id="productShow" class="wrapper-product">
        <div class="container">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:ListView ID="lstProduct" runat="server" DataSourceID="odsProduct" EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                                <div class="product-box">
                                    <div class="product-img">
                                        <a class="product-imgs" href='<%# progressTitle(Eval("ProductNameEn")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                            <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/img1.jpg" %>'
                                                runat="server" /></a>
                                        <div class="xemnhanh">
                                            <a class="link-view" href='<%# progressTitle(Eval("ProductNameEn")) + "-pv-" + Eval("ProductID") + ".aspx" %>'><span>Xem nhanh</span></a>
                                        </div>
                                    </div>
                                    <div class="product-content">
                                        <div class="product-name">
                                            <a href='<%# progressTitle(Eval("ProductNameEn")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                                <%# Eval("ProductNameEn") %></a>
                                        </div>
                                        <div class="product-price">
                                            <p>
                                                <asp:ListView ID="lstPrice" runat="server" DataSourceID="odsPrice" EnableModelValidation="True">
                                                    <ItemTemplate>
                                                        <%# !string.IsNullOrEmpty(Eval("Price").ToString()) ?(string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',')) :  "" %><%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "" : "VNĐ"%>
                                                    </ItemTemplate>
                                                    <LayoutTemplate>
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
                                    </div>
                                    <div class="product-size">
                                        <asp:HiddenField ID="hdnProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                                        <asp:DropDownList ID="dropListSize" CssClass="size-box" runat="server" DataSourceID="odsListSize"
                                            DataTextField="ProductLengthName" DataValueField="ProductLengthID" AutoPostBack="True"
                                            AppendDataBoundItems="true">
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
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div class="row produc-tblist">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsProduct" runat="server" SelectMethod="ProductSelectAll"
                        TypeName="TLLib.Product">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" />
                            <asp:Parameter Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ProductName" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="PriceFrom" Type="String" />
                            <asp:Parameter Name="PriceTo" Type="String" />
                            <asp:QueryStringParameter Name="CategoryID" QueryStringField="pci" Type="String" />
                            <asp:Parameter Name="ManufacturerID" Type="String" />
                            <asp:Parameter Name="OriginID" Type="String" />
                            <asp:Parameter Name="Tag" Type="String" />
                            <asp:Parameter Name="InStock" Type="String" />
                            <asp:Parameter Name="IsHot" Type="String" />
                            <asp:Parameter Name="IsNew" Type="String" />
                            <asp:Parameter Name="IsBestSeller" Type="String" />
                            <asp:Parameter Name="IsSaleOff" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                            <asp:Parameter Name="FromDate" Type="String" />
                            <asp:Parameter Name="ToDate" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <div class="pager text-center">
                        <%--<a class="prev fa fa-angle-left" href="#"></a><a class="current" href="#">1</a>
                <a href="#">2</a> <a href="#">3</a><a class="next fa fa-angle-right" href="#"></a>--%>
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="8" PagedControlID="lstProduct">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowNextPageButton="false"
                                    ShowPreviousPageButton="true" ButtonCssClass="prev fa fa-angle-left" RenderDisabledButtonsAsLabels="true"
                                    PreviousPageText="" />
                                <asp:NumericPagerField ButtonCount="5" NumericButtonCssClass="numer-paging" CurrentPageLabelCssClass="current" />
                                <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="false" ButtonCssClass="next fa fa-angle-right"
                                    ShowNextPageButton="true" ShowPreviousPageButton="false" RenderDisabledButtonsAsLabels="true"
                                    NextPageText="" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
