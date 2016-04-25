<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="product-detail.aspx.cs" Inherits="Product_Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-bg">
        <div class="container">
            <div class="site">
                <a class="active" href="#">phòng ngủ</a>
             </div>
            <div class="row pro-detail">
                <div class="col-md-5">
                    <div class="details-img">
                        <img src="assets/images/hinh2.jpg" alt="#"/>
                        <a href="assets/images/details-big-1.jpg" class="fancybox zoom-details" data-fancybox-group="gallery"><span>zoom</span></a>
                    </div>
                </div> 
                <div class="col-md-5">
                    <div class="central">
                        <div class="central-top">
                            <div class="central-box">
                                <h1>KHĂN TRẢI GƯỜNG VÀ CHĂN THIẾT KẾ HÌNH HỌC MÀU XÁM SÁNG</h1>
                                <p>2.000.000 VND  -  3.200.000 VND</p>
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
                            <ul class="selecc-colores">
                                <li><a href="#"><img src="assets/images/img2.png" alt="#"/></a></li>
                                <li><a href="#"><img src="assets/images/img3.png" alt="#"/></a></li>
                            </ul>
                            <div class="clr"></div>
                            <div class="bnt-add">
                                <span class="sanpham"><a class="link-pro" href="#proList">Các sản phẩm</a></span>
                                <span class="add"><a href="#">Thêm vào giỏ hàng</a></span>
                            </div>
                        </div>
                        <div class="central-bot">
                            <ul>
                                <li><a href="assets/images/details-big-2.jpg" class="fancybox" data-fancybox-group="gallery"> <img src="assets/images/img4.png" alt="#"/></a></li>
                                <li><a href="assets/images/details-big-3.jpg" class="fancybox" data-fancybox-group="gallery"> <img src="assets/images/img5.png" alt="#"/></a></li>
                                <li><a href="assets/images/details-big-4.jpg" class="fancybox" data-fancybox-group="gallery"> <img src="assets/images/img6.png" alt="#"/></a></li>
                            </ul>
                        </div>
                    </div>
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
            <div id="proList" class="row detail">
                 <div class="col-md-5">
                    <div class="main-img1">
                        <a href="#"><img src="assets/images/hinh7.png" alt=""/></a>
                    </div>
                  </div>
                  <div class="col-md-5">
                    <div class="central">
                        <div class="central-box1">
                            <h1>KHĂN TRẢI GƯỜNG VÀ CHĂN THIẾT KẾ HÌNH HỌC MÀU XÁM SÁNG</h1>
                            <p class="code">Mã sản phẩm : KTG 1265</p>
                            <p class="price">2.000.000 VND  -  3.200.000 VND</p>
                        </div>
                        <div class="bnt-add bnt-add2">
                            <span class="add"><a href="#">Thêm vào giỏ hàng</a></span>
                        </div>
                        <div class="product-size">
                            <select class="size-box1 size-box" id="Select1">
                                <option>--chọn kích thướt--</option>
                                <option>--chọn kích thướt 1--</option>
                                <option>--chọn kích thướt 2--</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 pad-0">
                    <div class="menu-prod">
                        <ul class="accordion">
		                    <li>
			                    <div class="link">chất liệu sản phẩm</div>
			                    <ul class="submenu">
				                    <li>Coton 90%
                                        <ul class="submenu2">
                                            <li>coton mềm: 20%</li>
                                            <li>coton cứng:20%</li>
                                        </ul>
				                    </li>
                                    <li>Vải 10%</li>
			                    </ul>
		                    </li>
                            <li class="line-sub"></li>
		                    <li>
			                   <div class="link">chăm sóc sản phẩm</div>
			                   <ul class="submenu">
				                    <li>Coton 90%
                                        <ul class="submenu2">
                                            <li>coton mềm: 20%</li>
                                            <li>coton cứng:20%</li>
                                        </ul>
				                    </li>
                                    <li>Vải 10%</li>
			                    </ul>
		                    </li>
	                    </ul>
                    </div>
                </div>
            </div>
            <div id="proList1" class="row detail">
                 <div class="col-md-5">
                    <div class="main-img1">
                        <a href="#"><img src="assets/images/hinh7.png" alt=""/></a>
                    </div>
                  </div>
                  <div class="col-md-5">
                    <div class="central">
                        <div class="central-box1">
                            <h1>KHĂN TRẢI GƯỜNG VÀ CHĂN THIẾT KẾ HÌNH HỌC MÀU XÁM SÁNG</h1>
                            <p class="code">Mã sản phẩm : KTG 1265</p>
                            <p class="price">2.000.000 VND  -  3.200.000 VND</p>
                        </div>
                        <div class="bnt-add bnt-add2">
                            <span class="add"><a href="#">Thêm vào giỏ hàng</a></span>
                        </div>
                        <div class="product-size">
                            <select class="size-box1 size-box" id="Select2">
                                <option>--chọn kích thướt--</option>
                                <option>--chọn kích thướt 1--</option>
                                <option>--chọn kích thướt 2--</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 pad-0">
                    <div class="menu-prod">
                        <ul class="accordion">
		                    <li>
			                    <div class="link">chất liệu sản phẩm</div>
			                    <ul class="submenu">
				                    <li>Coton 90%
                                        <ul class="submenu2">
                                            <li>coton mềm: 20%</li>
                                            <li>coton cứng:20%</li>
                                        </ul>
				                    </li>
                                    <li>Vải 10%</li>
			                    </ul>
		                    </li>
                            <li class="line-sub"></li>
		                    <li>
			                   <div class="link">chăm sóc sản phẩm</div>
			                   <ul class="submenu">
				                    <li>Coton 90%
                                        <ul class="submenu2">
                                            <li>coton mềm: 20%</li>
                                            <li>coton cứng:20%</li>
                                        </ul>
				                    </li>
                                    <li>Vải 10%</li>
			                    </ul>
		                    </li>
	                    </ul>
                    </div>
                </div>
            </div>
            <div id="proList2" class="row detail">
                 <div class="col-md-5">
                    <div class="main-img1">
                        <a href="#"><img src="assets/images/hinh7.png" alt=""/></a>
                    </div>
                  </div>
                  <div class="col-md-5">
                    <div class="central">
                        <div class="central-box1">
                            <h1>KHĂN TRẢI GƯỜNG VÀ CHĂN THIẾT KẾ HÌNH HỌC MÀU XÁM SÁNG</h1>
                            <p class="code">Mã sản phẩm : KTG 1265</p>
                            <p class="price">2.000.000 VND  -  3.200.000 VND</p>
                        </div>
                        <div class="bnt-add bnt-add2">
                            <span class="add"><a href="#">Thêm vào giỏ hàng</a></span>
                        </div>
                        <div class="product-size">
                            <select class="size-box1 size-box" id="Select3">
                                <option>--chọn kích thướt--</option>
                                <option>--chọn kích thướt 1--</option>
                                <option>--chọn kích thướt 2--</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 pad-0">
                    <div class="menu-prod">
                        <ul class="accordion">
		                    <li>
			                    <div class="link">chất liệu sản phẩm</div>
			                    <ul class="submenu">
				                    <li>Coton 90%
                                        <ul class="submenu2">
                                            <li>coton mềm: 20%</li>
                                            <li>coton cứng:20%</li>
                                        </ul>
				                    </li>
                                    <li>Vải 10%</li>
			                    </ul>
		                    </li>
                            <li class="line-sub"></li>
		                    <li>
			                   <div class="link">chăm sóc sản phẩm</div>
			                   <ul class="submenu">
				                    <li>Coton 90%
                                        <ul class="submenu2">
                                            <li>coton mềm: 20%</li>
                                            <li>coton cứng:20%</li>
                                        </ul>
				                    </li>
                                    <li>Vải 10%</li>
			                    </ul>
		                    </li>
	                    </ul>
                    </div>
                </div>
            </div>
            <div class="row seen">
                <h2><a href="#">sản phẩm đã xem gần đây</a></h2>
            </div>
            <div class="row produc-tblist">
                <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                    <div class="product-img">
                        <a href="#"><img class="img-responsive" src="assets/images/hinh11.png" alt=""/></a>
                        <div class="seen-price-bg">
                            <div class="seen-price">
                               <p>BỘ CHĂN MỀN CHỈ HỒNG<br>1.200.000 VND</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                    <div class="product-img">
                        <a href="#"><img class="img-responsive" src="assets/images/hinh8.png" alt=""/></a>
                        <div class="seen-price-bg">
                            <div class="seen-price">
                               <p>BỘ CHĂN MỀN CHỈ HỒNG<br>1.200.000 VND</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                    <div class="product-img">
                        <a href="#"><img class="img-responsive" src="assets/images/hinh9.png" alt=""/></a>
                        <div class="seen-price-bg">
                            <div class="seen-price">
                               <p>BỘ CHĂN MỀN CHỈ HỒNG<br>1.200.000 VND</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4 col-xs-6 element-item">
                    <div class="product-img">
                        <a href="#"><img class="img-responsive" src="assets/images/hinh10.png" alt=""/></a>
                        <div class="seen-price-bg">
                            <div class="seen-price">
                               <p>BỘ CHĂN MỀN CHỈ HỒNG<br>1.200.000 VND</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

