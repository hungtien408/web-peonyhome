<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="search-result.aspx.cs" Inherits="Search_Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-bg">
        <div class="container">
             <div class="search-note">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    Chúng tôi tìm thấy 12 sản phẩm với từ khoá “<i>Khăn trải gường</i>”
                </div>
            </div>
        </div>
        <div class="productw">
           <div class="row produc-tblist">
            <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                <div class="product-box">
                    <div class="product-img">
                        <a class="product-imgs" href="#"><img src="assets/images/img1.jpg" alt=""/></a>
                         <div class="xemnhanh">
                            <a class="link-view" href="product-view.aspx"><span>Xem nhanh</span></a>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="product-name">
                            <a href="#">bộ chăn mền chỉ hồng</a>
                        </div>
                        <div class="product-price">
                            <p>1.200.0000 VND</p>
                        </div>
                    </div>
                    <div class="product-size">
                        <select id="Select1" class="size-box">
                            <option>--chọn kích thướt--</option>
                            <option>--chọn kích thướt 1--</option>
                            <option>--chọn kích thướt 2--</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                <div class="product-box">
                    <div class="product-img">
                       <a class="product-imgs" href="#"><img src="assets/images/img2.jpg" alt=""/></a>
                         <div class="xemnhanh">
                            <a class="link-view" href="product-view.aspx"><span>Xem nhanh</span></a>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="product-name">
                            <a href="#">bộ chăn mền chỉ hồng</a>
                        </div>
                        <div class="product-price">
                            <p>1.200.0000 VND</p>
                        </div>
                    </div>
                   <div class="product-size1">
                        <div class="size-box">
                            <p>Đơn/ 1,2m x 1m</p>
                            </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                <div class="product-box">
                    <div class="product-img">
                       <a class="product-imgs" href="#"><img src="assets/images/img3.jpg" alt=""/></a>
                         <div class="xemnhanh">
                            <a class="link-view" href="product-view.aspx"><span>Xem nhanh</span></a>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="product-name">
                            <a href="#">bộ chăn mền chỉ hồng</a>
                        </div>
                        <div class="product-price">
                            <p>1.200.0000 VND</p>
                        </div>
                    </div>
                    <div class="product-size">
                        <select id="Select3" class="size-box">
                            <option>--chọn kích thướt--</option>
                            <option>--chọn kích thướt 1--</option>
                            <option>--chọn kích thướt 2--</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                <div class="product-box">
                    <div class="product-img">
                       <a class="product-imgs" href="#"><img src="assets/images/img4.jpg" alt=""/></a>
                         <div class="xemnhanh">
                            <a class="link-view" href="product-view.aspx"><span>Xem nhanh</span></a>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="product-name">
                            <a href="#">bộ chăn mền chỉ hồng</a>
                        </div>
                        <div class="product-price">
                            <p>1.200.0000 VND</p>
                        </div>
                    </div>
                    <div class="product-size">
                        <select id="Select2" class="size-box">
                            <option>--chọn kích thướt--</option>
                            <option>--chọn kích thướt 1--</option>
                            <option>--chọn kích thướt 2--</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                <div class="product-box">
                    <div class="product-img">
                        <a class="product-imgs" href="#"><img src="assets/images/img5.jpg" alt=""/></a>
                         <div class="xemnhanh">
                            <a class="link-view" href="product-view.aspx"><span>Xem nhanh</span></a>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="product-name">
                            <a href="#">bộ chăn mền chỉ hồng</a>
                        </div>
                        <div class="product-price">
                            <p>1.200.0000 VND</p>
                        </div>
                    </div>
                    <div class="product-size">
                        <select id="Select4" class="size-box">
                            <option>--chọn kích thướt--</option>
                            <option>--chọn kích thướt 1--</option>
                            <option>--chọn kích thướt 2--</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                <div class="product-box">
                    <div class="product-img">
                       <a class="product-imgs" href="#"><img src="assets/images/img6.jpg" alt=""/></a>
                         <div class="xemnhanh">
                            <a class="link-view" href="product-view.aspx"><span>Xem nhanh</span></a>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="product-name">
                            <a href="#">bộ chăn mền chỉ hồng</a>
                        </div>
                        <div class="product-price">
                            <p>1.200.0000 VND</p>
                        </div>
                    </div>
                    <div class="product-size1">
                        <div class="size-box">
                           <p>Đơn/ 1,2m x 1m</p>
                         </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                <div class="product-box">
                    <div class="product-img">
                       <a class="product-imgs" href="#"><img src="assets/images/img7.jpg" alt=""/></a>
                         <div class="xemnhanh">
                            <a class="link-view" href="product-view.aspx"><span>Xem nhanh</span></a>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="product-name">
                            <a href="#">bộ chăn mền chỉ hồng</a>
                        </div>
                        <div class="product-price">
                            <p>1.200.0000 VND</p>
                        </div>
                    </div>
                    <div class="product-size">
                        <select id="Select5" class="size-box">
                            <option>--chọn kích thướt--</option>
                            <option>--chọn kích thướt 1--</option>
                            <option>--chọn kích thướt 2--</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                <div class="product-box">
                    <div class="product-img">
                       <a class="product-imgs" href="#"><img src="assets/images/img8.jpg" alt=""/></a>
                         <div class="xemnhanh">
                            <a class="link-view" href="product-view.aspx"><span>Xem nhanh</span></a>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="product-name">
                            <a href="#">bộ chăn mền chỉ hồng</a>
                        </div>
                        <div class="product-price">
                            <p>1.200.0000 VND</p>
                        </div>
                    </div>
                    <div class="product-size">
                        <select id="Select6" class="size-box">
                            <option>--chọn kích thướt--</option>
                            <option>--chọn kích thướt 1--</option>
                            <option>--chọn kích thướt 2--</option>
                        </select>
                    </div>
                </div>
            </div>
                <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                <div class="product-box">
                    <div class="product-img">
                        <a class="product-imgs" href="#"><img src="assets/images/img5.jpg" alt=""/></a>
                         <div class="xemnhanh">
                            <a class="link-view" href="product-view.aspx"><span>Xem nhanh</span></a>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="product-name">
                            <a href="#">bộ chăn mền chỉ hồng</a>
                        </div>
                        <div class="product-price">
                            <p>1.200.0000 VND</p>
                        </div>
                    </div>
                    <div class="product-size">
                        <select id="Select7" class="size-box">
                            <option>--chọn kích thướt--</option>
                            <option>--chọn kích thướt 1--</option>
                            <option>--chọn kích thướt 2--</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                <div class="product-box">
                    <div class="product-img">
                       <a class="product-imgs" href="#"><img src="assets/images/img6.jpg" alt=""/></a>
                         <div class="xemnhanh">
                            <a class="link-view" href="product-view.aspx"><span>Xem nhanh</span></a>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="product-name">
                            <a href="#">bộ chăn mền chỉ hồng</a>
                        </div>
                        <div class="product-price">
                            <p>1.200.0000 VND</p>
                        </div>
                    </div>
                   <div class="product-size1">
                        <div class="size-box">
                           <p>Đơn/ 1,2m x 1m</p>
                         </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                <div class="product-box">
                    <div class="product-img">
                       <a class="product-imgs" href="#"><img src="assets/images/img7.jpg" alt=""/></a>
                         <div class="xemnhanh">
                            <a class="link-view" href="product-view.aspx"><span>Xem nhanh</span></a>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="product-name">
                            <a href="#">bộ chăn mền chỉ hồng</a>
                        </div>
                        <div class="product-price">
                            <p>1.200.0000 VND</p>
                        </div>
                    </div>
                    <div class="product-size">
                        <select id="Select8" class="size-box">
                            <option>--chọn kích thướt--</option>
                            <option>--chọn kích thướt 1--</option>
                            <option>--chọn kích thướt 2--</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                <div class="product-box">
                    <div class="product-img">
                       <a class="product-imgs" href="#"><img src="assets/images/img8.jpg" alt=""/></a>
                         <div class="xemnhanh">
                            <a class="link-view" href="product-view.aspx"><span>Xem nhanh</span></a>
                        </div>
                    </div>
                    <div class="product-content">
                        <div class="product-name">
                            <a href="#">bộ chăn mền chỉ hồng</a>
                        </div>
                        <div class="product-price">
                            <p>1.200.0000 VND</p>
                        </div>
                    </div>
                    <div class="product-size">
                        <select id="Select9" class="size-box">
                            <option>--chọn kích thướt--</option>
                            <option>--chọn kích thướt 1--</option>
                            <option>--chọn kích thướt 2--</option>
                        </select>
                    </div>
                </div>
            </div>
            </div>
        </div>
      </div>
    </div>
</asp:Content>

