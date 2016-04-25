<%@ Page Title="" Language="C#" MasterPageFile="~/en/site.master" AutoEventWireup="true" CodeFile="search-not-result.aspx.cs" Inherits="Search_Not_Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-bg">
        <div class="container">
            <div class="search-not">
                <div class="row">
                  <div class="col-md-6 col-md-offset-3">Chúng tôi không tìm thấy sản phẩm nào với từ khoá “ <i>
                      <asp:Label ID="lblKeyword" runat="server"></asp:Label></i>”.
                     Xin vui lòng thử lại với những tìm kiếm khác trên trang chủ của chúng tôi,
                     hoặc các bạn có thể nhấn “vào đây” để quay lại trang chủ. Xin cảm ơn !
                  </div>
                 </div>   
             </div>
        </div>
    </div>
    
</asp:Content>

