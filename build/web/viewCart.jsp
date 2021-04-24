<%-- 
    Document   : viewCart
    Created on : Apr 14, 2021, 8:10:37 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="nguyenps.cart.CartDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <style type="text/css">
      /* Default CSS */
      body,#body_style {margin: 0; padding: 0; background: #f9f9f9; font-size: 14px; color: #5b656e;}
      a {color: #09c;}
      a img {border: none; text-decoration: none;}
      table, table td {border-collapse: collapse;}
      td, h1, h2, h3 {font-family: tahoma, geneva, sans-serif; color: #313a42;}
      h1, h2, h3, h4 {color: #313a42 !important; font-weight: normal; line-height: 1.2;}
      h1 {font-size: 24px;}
      h2 {font-size: 18px;}
      h3 {font-size: 16px;}
      p {margin: 0 0 1.6em 0;}
      
      /* Force Outlook to provide a "view in browser" menu link. */
      #outlook a {padding:0;}
      
      /* Preheader and webversion */
      .preheader {background-color: #be7d06;}
      .preheaderContent,.webversion,.webversion a {color: white; font-size: 15px;}
      .preheaderContent{width: 440px;}
      .preheaderContent,.webversion {padding: 15px 10px;}
      .webversion {width: 200px; text-align: right;}
      .webversion a {text-decoration: none;}
      .webversion,.webversion a {color: #ffffff; font-size: 17px;}
      
      /* Topheader */
      .topHeader {background: #ffffff;}
      
      /* Logo (branding) */
      .logoContainer {padding: 20px 0 10px 0px; width: 320px;}
      .logoContainer a {color: #ffffff;}
      
      /* Whitespace (imageless spacer) and divider */
      .whitespace, .whitespaceDivider {font-family: 0px; line-height: 0px;}
      .whitespaceDivider {border-bottom: 1px solid #cccccc;}
      
      /* Button */
      .buttonContainer {padding: 10px 0px 10px 0px;}
      .button {padding: 5px 5px 5px 5px; text-align: center; background-color: orange}
      .button a {color: #ffffff; text-decoration: none; font-size: 13px;}
      
      /* Section */
      .sectionMainTitle{font-family: Tahoma, sans-serif; font-size: 16px; padding: 0px 0px 5px 0;}
      .sectionArticleTitle, .sectionMainTitle {color: #5b656e;}
      
      /* An article */
      .sectionArticleTitle, .sectionArticleContent {text-align: center; padding: 0px 5px 0px 5px;}
      .sectionArticleTitle {font-size: 12px; font-weight: bold;}
      .sectionArticleContent {font-size: 10px; line-height: 12px;}
      .sectionArticleImage {padding: 8px 0px 0px 0px;}
      .sectionArticleImage img {padding: 0px 0px 10px 0px; -ms-interpolation-mode: bicubic; display: block;}
      
      /* Footer and Social media */
      .footer {background-color: #51c4d4;}
      .footNotes {padding: 0px 20px 0px 20px;}
      .footNotes a {color: #ffffff; font-size: 13px;}
      .socialMedia {background: #5b656e;}
      
      /* Article image */
      .sectionArticleImage {padding: 8px 0px 0px 0px;}
      .sectionArticleImage img {padding: 0px 0px 10px 0px; -ms-interpolation-mode: bicubic; display: block;}
      
      /* Product card */
      .card {background-color: #ffffff; border-bottom: 2px solid #5b656e;}
      
      /* Column */
      .column {padding-bottom: 20px;}
      
      
      /* CSS for specific screen width(s) */
      @media only screen and (max-width: 480px) {
          body[yahoofix] table {width: 100% !important;}
          body[yahoofix] .webversion {display: none; font-size: 0; max-height: 0; line-height: 0; mso-hide: all;}
          body[yahoofix] .logoContainer {text-align: center;}
          body[yahoofix] .logo {width: 80%;}
          body[yahoofix] .buttonContainer {padding: 0px 20px 0px 20px;}
          body[yahoofix] .column {float: left; width: 100%; margin: 0px 0px 30px 0px;}
          body[yahoofix] .card {padding: 20px 0px;}
        }
    </style>
    <body yahoofix>
        <c:if test="${empty sessionScope.USER.fullname}">
            <c:redirect url="login1.jsp"/>
        </c:if>
        <c:set var="sum" value=""/>
        <span id="body_style" style="display:block">
            <table class="preheader" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                  <td>
                    <table border="0" cellpadding="0" cellspacing="0" summary="" width="840" align="center">
                      <tr>
                        <td class="preheaderContent">Sign in now to see the latest offers & book a delivery slot.</td>
                        <c:if test="${not empty sessionScope.USER.fullname}">
                            <td class="webversion">
                                Welcome, ${sessionScope.USER.fullname}
                                <a href="DispatchController?btAction=Logout" title="Logout" id="js-login-btn" class="btn btn-warning btn-block btn-lg" style="padding: 5px 20px">
                                    Logout
                                </a>
                            </td>
                        </c:if>
                        <c:if test="${empty sessionScope.USER.fullname}">
                            <td class="webversion">
                                <a href="login1.jsp" title="Login" id="js-login-btn" class="btn btn-warning btn-block btn-lg" style="padding: 5px 20px">
                                    Login
                                </a>

                            </td>
                        </c:if>

                      </tr>
                    </table>
                  </td>
                </tr>
            </table>
        </span>
        <div class="container">
            <div class="row">
                    <div class="col-xl-9">
                            <div class="panel panel-info">
                                    <div class="panel-heading">
                                            <div class="panel-title">
                                                    <div class="row">
                                                            <div class="col-xs-6">
                                                                    <h5><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</h5>
                                                            </div>
                                                        <div class="col-xs-3" style="float: right !important;">
                                                            <a href="index.jsp" type="button" class="btn btn-primary btn-xl">
                                                                            <span class="glyphicon glyphicon-share-alt"></span> Continue shopping
                                                                    </a>
                                                            </div>
                                                    </div>
                                            </div>
                                    </div>
                                <div class="panel-body">
                                    <c:if test="${sessionScope != null}">
                                        <c:set var="cart" value="${sessionScope.CART}"/>
                                        <c:if test="${cart != null}">
                                            <c:set var="items" value="${cart.getItems()}"/>
                                            <c:if test="${items != null}">
                                                <form action="DispatchController">
                                                    <c:forEach var="buy" items="${applicationScope.LIST_ALL_FOOD}" varStatus="counter">
                                                        <c:forEach var="title" items="${items.keySet()}" varStatus="counter">
                                                            <c:if test="${buy.productID.toString() eq title.toString()}">
                                                                <div class="row">
                                                                    <div class="col-xs-2"><img class="img-responsive" height="200" width="100" src="${buy.image}">
                                                                    </div>
                                                                    <div class="col-xs-4">
                                                                            <h4 class="product-name"><strong>${buy.productName}</strong></h4><h4><small>${buy.description}</small></h4>
                                                                    </div>
                                                                    <div class="col-xs-6">
                                                                            <div class="col-xs-6 text-right">
                                                                                    <h6><strong>${buy.price} VND <span class="text-muted">x</span></strong></h6>
                                                                            </div>
                                                                            <div class="col-xs-4">
                                                                                    <input type="number" name="txtQuantity" class="form-control input-sm" value="${items.get(title)}">
                                                                                    <input type="hidden" name="ID" value="${title}"/>
                                                                            </div>
                                                                            <div class="col-xs-2">
                                                                                
                                                                                <a type="button" class="btn btn-link btn-xs" href="DispatchController?btAction=DeleteItemLink&itemID=${title}"><span class="glyphicon glyphicon-trash"> </span></a>
<!--                                                                                <button class="btn btn-link btn-xs" type="submit">
                                                                                            <span class="glyphicon glyphicon-trash"> </span>
                                                                                </button>-->
                                                                            </div>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:forEach>
                                                
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                    <c:set var="cart" value="${sessionScope.CART}"/>
                                    <c:set var="items" value="${cart.getItems()}"/>
                                    <c:if test="${items == null}">
                                        <font style="color: red">No foods have been selected</font>
                                    </c:if>
                                    <hr>
                                    <c:if test="${requestScope.ERROR_UPDATE != null}">
                                        <font style="color: red; float: right; margin-right: 80px">The quantity you input more than total product quantity</font>
                                    </c:if>
                                     <c:if test="${requestScope.ERROR_UPDATE_QUANTITY != null}">
                                        <font style="color: red; float: right; margin-right: 80px">${requestScope.ERROR_UPDATE_QUANTITY}</font>
                                    </c:if>
                                            <div class="row">
                                                    <div class="text-center">
                                                            <div class="col-xs-9">
                                                                    <h6 class="text-right">Added items?</h6>
                                                            </div>
                                                            <div class="col-xs-2">
                                                                    <button type="submit" value="UpdateCart" name="btAction" class="btn btn-default btn-sm btn-block">
                                                                            Update cart
                                                                    </button>
                                                            </div>
                                                    </div>
                                            </div>
                                    </form>
                                </div>
                                    <div class="panel-footer">
                                            <div class="row text-center">
                                                    <div class="col-xs-9">
                                                        <h4 class="text-right">Total Amount:  <strong style="color: red">${sessionScope.TOTAL_AMOUNT} VND</strong></h4>
                                                            
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <a href="DispatchController?btAction=CheckOut" type="button" class="btn btn-success btn-block">
                                                                    Checkout
                                                            </a>
                                                    </div>
                                            </div>
                                    </div>
                            </div>
                    </div>
	</div>
    </div>
    </body>
</html>
