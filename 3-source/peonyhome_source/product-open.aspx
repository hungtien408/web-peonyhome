<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="product-open.aspx.cs" Inherits="Search_Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnSanPhamSub" runat="server" />
    <a class="a-link-sps" href="<%= hdnSanPhamSub.Value %>"></a>
    <div class="container-bg">
        <div class="container">
            <%--<div class="site">
                <a href="#">phòng ngủ</a><span class="fa fa-angle-right"></span><a class="active"
                    href="#">khăn trải giường</a>
            </div>--%>
            <div class="site">
                <asp:ListView ID="lstBreadcrum" runat="server" DataSourceID="odsBreadcrum" EnableModelValidation="True">
                    <ItemTemplate>
                        <%# "<a href='" + progressTitle(Eval("ProductCategoryName")) + "-pci-" + Eval("ProductCategoryID") + ".aspx" + "'>" + Eval("ProductCategoryName") + "</a><span class='icon-site fa fa-angle-right'></span> "%>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsBreadcrum" runat="server" SelectMethod="ProductCategoryHierarchyToTopSelectAll"
                    TypeName="TLLib.ProductCategory">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="CurrentProductCategoryID" QueryStringField="pci"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Label ID="lblProductTitle" runat="server"></asp:Label>
            </div>
            <asp:ListView ID="lstProduct" runat="server" DataSourceID="odsProduct" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                        <div class="product-box">
                            <div class="product-img">
                                <a class="product-imgs" href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                    <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/img1.jpg" %>'
                                        runat="server" /></a>
                                <div class="xemnhanh">
                                    <a class="link-view" href='<%# progressTitle(Eval("ProductName")) + "-pv-" + Eval("ProductID") + ".aspx" %>'>
                                        <span>Xem nhanh</span></a>
                                </div>
                            </div>
                            <div class="product-content">
                                <div class="product-name">
                                    <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                        <%# Eval("ProductName") %></a>
                                    <p>
                                        <%# Eval("Tag") %></p>
                                </div>
                                <div class="product-price">
                                    <p>
                                        <%# !string.IsNullOrEmpty(Eval("Price").ToString()) ?(string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',')) :  "" %><%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "" : "VNĐ"%></p>
                                    <p runat="server" visible='<%# string.IsNullOrEmpty(Eval("Price").ToString()) ? true : false %>'>
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
                            <div class="product-size" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Price").ToString()) ? true : false %>'>
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
                    <div class="productw">
                        <div class="row produc-tblist">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
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
                    <asp:QueryStringParameter Name="CategoryID" QueryStringField="pri" Type="String" />
                    <asp:Parameter Name="ManufacturerID" Type="String" />
                    <asp:Parameter Name="OriginID" Type="String" />
                    <asp:Parameter Name="Tag" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="InStock" Type="String" />
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
                <asp:DataPager ID="DataPager1" runat="server" PageSize="12" PagedControlID="lstProduct">
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
        </div>
    </div>
</asp:Content>
