<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="search-result.aspx.cs" Inherits="Search_Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-bg">
        <div class="container">
            <div class="search-note">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        Chúng tôi tìm thấy 
                        <asp:Label ID="lblCountProduct" runat="server"></asp:Label> sản phẩm với từ khoá “<i><asp:Label
                            ID="lblKeyword" runat="server"></asp:Label></i>”
                    </div>
                </div>
            </div>
            <div class="productw">
                <asp:ListView ID="lstProduct" runat="server" DataSourceID="odsProduct" EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                            <div class="product-box">
                                <div class="product-img">
                                    <a class="product-imgs" href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                        <img id="Img1" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/img1.jpg" %>'
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
                                    </div>
                                    <div class="product-price">
                                        <p>
                                        <%# !string.IsNullOrEmpty(Eval("Price").ToString()) ?(string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',')) :  "" %><%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "" : "VNĐ"%></p>
                                        <p id="P1" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Price").ToString()) ? true : false %>'>
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
                        <asp:QueryStringParameter QueryStringField="kw" Name="Keyword" Type="String" />
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="PriceFrom" Type="String" />
                        <asp:Parameter Name="PriceTo" Type="String" />
                        <asp:Parameter Name="CategoryID" Type="String" />
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
            </div>
        </div>
    </div>
</asp:Content>
