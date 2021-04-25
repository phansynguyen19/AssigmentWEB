<%-- 
    Document   : search
    Created on : Apr 24, 2021, 2:07:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>  
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>PC Shop</title>
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
    </head>
    <body yahoofix>
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
                                        <a href="login1.jsp?page=search&searchValue=${requestScope.SEARCH_VALUE}" title="Login" id="js-login-btn" class="btn btn-warning btn-block btn-lg" style="padding: 5px 20px">
                                            Login
                                        </a>

                                    </td>
                                </c:if>

                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table border="0" cellspacing="0" cellpadding="0" width="840" align="center" summary="">
                <tr>
                    <td><a class="btn btn-warning" href="index.jsp">Home</a></td>
                    <td class="logoContainer">
                        <form action="DispatchController">
                                <div class="input-group">
                                    <div class="form-outline">
                                        <input type="text" class="form-control" name="txtSearchValue" value="${requestScope.SEARCH_VALUE}"/>
                                      
                                    </div>
                                    <button type="submit" class="btn btn-warning" value="Search" name="btAction">
                                      Search
                                    </button>
                                </div>
                        </form>
                    </td>
                    
                    <td>
                        <a href="DispatchController?btAction=viewCart" title="See your cart">
                            <img style="width: 34px; height: 34px; float: right; margin-right: 20px" class="logo" src="images/shopping-cart.jpg" alt="Lorem logo" /> 
                        </a>
                    </td>
                </tr>
            </table>
            <c:if test="${not empty requestScope.SEARCH_RESULT}">
                <div class="wrapper">
                    <div class="container" style="width: 1000px;">
                        <div class="row g-1">
                            <c:forEach var="dto" items="${requestScope.SEARCH_RESULT}">
                                <div class="col-md-3">
                                    <div class="card p-3">
                                        <div class="text-center"> <img src="${dto.image}" width="200" height="250"> </div>
                                        <div class="product-details" style="text-align: center"> <span class="font-weight-bold d-block" style="color: red; margin-top: 4px">${dto.price} VND</span> <span>${dto.productName}</span>
                                            <div class="buttons d-flex flex-row" style="margin: 0px 50px;">
                                                <div class="cart"></div>
                                                <c:url var="addToCardLink" value="DispatchController">
                                                    <c:param name="pk" value="${dto.productID}"/>
                                                    <c:param name="page" value="search"/>
                                                    <c:param name="searchValue" value="${requestScope.SEARCH_VALUE}"/>
                                                    <c:param name="btAction" value="AddToCart"/>
                                                </c:url>
                                                <a href="${addToCardLink}" class="btn btn-warning cart-button btn-block">Add to cart </a>
                                            </div>
                                            <div class="weight"> <small>${dto.description}</small> </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${empty requestScope.SEARCH_RESULT}">
                <font style="color: red; text-align: center">No product found!!!</font>
            </c:if>
            <table border="0" cellspacing="0" cellpadding="0" width="100%" summary="" class="footer">
                <tr><td class="whitespace" height="50">&nbsp;</td></tr>
                <tr>
                  <td>
                    <table border="0" cellspacing="0" cellpadding="0" width="120" align="center" summary="">
        <!--              <tr>
                        <td class="footNotes" align="center">
                          <a href="#" title="Unsubscribe">Unsubscribe</a>
                        </td>
                        <td class="footNotes" align="center">
                          <a href="#" title="Lorem">Lorem</a>
                        </td>
                        <td class="footNotes" align="center">
                          <a href="#" title="Dolor">Dolor</a>
                        </td>
                      </tr>-->
                    </table>
                  </td>
                </tr>
                <tr><td class="whitespace" height="10">&nbsp;</td></tr>
              </table>
        </span>
    </body>
</html>
