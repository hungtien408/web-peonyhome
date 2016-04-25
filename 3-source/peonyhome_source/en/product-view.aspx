<%@ Page Language="C#" AutoEventWireup="true" CodeFile="product-view.aspx.cs" Inherits="product_view" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="assets/style/bootstrap.min.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="productView" class="view-wrap">
        <div class="close-view">
            <a class="closea" href="javascript:void(0);">X</a></div>
        <asp:ListView ID="lstProductView" runat="server" DataSourceID="odsProductView" EnableModelValidation="True">
            <ItemTemplate>
                <div class="view-in">
                    <h4 class="text-uppercase text-center title">
                        <span class="linetb"><%# Eval("ProductNameEn") %></span></h4>
                    <div class="product-price text-center">
                        <%# !string.IsNullOrEmpty(Eval("Price").ToString()) ?(string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',')) :  "" %><%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "" : "VNĐ"%></div>
                    <div class="wrapper-slider">
                        <div class="slider-in">
                            <div id="proSlider">
                                <asp:ListView ID="lstProductSame" runat="server" DataSourceID="odsProductSame" EnableModelValidation="True">
                                    <ItemTemplate>
                                        <div class="slide">
                                            <div class="product-box">
                                                <div class="product-img">
                                                    <a class="product-imgs" href='<%# progressTitle(Eval("ProductNameEn")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                                        <img id="Img1" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/img1.jpg" %>'
                                                            runat="server" /></a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="product-name">
                                                        <a href='<%# progressTitle(Eval("ProductNameEn")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                                            <%# Eval("ProductNameEn") %></a>
                                                    </div>
                                                    <%--<div class="product-price">
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
                                                    </div>--%>
                                                </div>
                                                <%--<div class="product-size">
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
                                                </div>--%>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <span runat="server" id="itemPlaceholder" />
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
                                        <asp:QueryStringParameter QueryStringField="pv" Name="ProductParentID" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </div>
                    </div>
                    <div data-id="proSlider" class="control-slider">
                        <a href="javascript:void(0);" class="prev fa fa-angle-left"></a><a href="javascript:void(0);"
                            class="next fa fa-angle-right"></a>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsProductView" runat="server" SelectMethod="ProductSelectOne"
            TypeName="TLLib.Product">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductID" QueryStringField="pv" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
