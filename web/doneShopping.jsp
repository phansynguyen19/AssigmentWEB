<%-- 
    Document   : doneShopping
    Created on : Apr 15, 2021, 9:07:13 AM
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
        <title>Successfully Shopping Page</title>
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
        <c:if test="${empty requestScope.DONE_SHOPPING}">
            <c:redirect url="index.jsp"/>
        </c:if>
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
        <h1 style="color: green; text-align: center">Successfully shopping</h1>
        <div class="container" style="text-align: center; margin: 0px 700px">
            <a href="index.jsp" title="Home" id="js-login-btn" class="btn btn-warning btn-block btn-lg" style="padding: 5px 20px; width: 100px;">
                                    Home
        </a>
        </div>
    </body>
</html>
