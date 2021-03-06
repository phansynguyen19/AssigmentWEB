<%-- 
    Document   : index
    Created on : Apr 13, 2021, 12:08:33 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
      
      <!-- Preheader -->
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
      <!-- End preheader -->
      
      <!-- topHeader -->
      <table border="0" cellspacing="0" cellpadding="0" width="100%" summary="" class="topHeader">
        
        <tr>
          <td>
            <table border="0" cellspacing="0" cellpadding="0" width="840" align="center" summary="">
                <tr>
                    <td class="logoContainer">
                        <form action="DispatchController">
                                <div class="input-group">
                                    <div class="form-outline">
                                      <input type="text" class="form-control" name="txtSearchValue"/>
                                      
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
              <tr>
                  <td class="logoContainer" style="text-align: center">
                  <a href="index.jsp" title="PC shop logo">
                    <img class="logo" src="images/logo.png" alt="PC shop logo" />
                  </a>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!-- End topHeader -->
      
      <table border="0" cellspacing="0" cellpadding="0" summary="" width="100%">
        <tr>
          <td valign="top">
            <table border="0" cellspacing="0" cellspacing="" summary="" width="840" align="center">
              <tr><td class="whitespace" height="20">&nbsp;</td></tr>
              <tr><td align="center" class="sectionMainTitle">Top 4 New products</td></tr>
              <tr><td align="center" class="sectionMainContent" style="color: green">If you quality is considerably large, we can offer you 3% off</td></tr>
              <tr><td class="whitespaceDivider" height="10">&nbsp;</td></tr>
              <tr><td class="whitespace" height="20">&nbsp;</td></tr>
            </table>
            <c:if test="${not empty applicationScope.LIST_1}">
                    <table border="0" cellspacing="0" cellspacing="" summary="" width="840" align="center">
                        <tr>
                          <c:forEach items="${applicationScope.LIST_1}" var="product">
                          <!-- Column and product card -->
                          <td class="column" valign="top">
                            <table border="0" cellpadding="0" cellspacing="0" width="200" summary="" class="card">
                              <tr>
                                <td class="sectionArticleImage" align="center">
                                  <img src="${product.image}" width="198" height = "250" alt="" />
                                </td>
                              </tr>
                              <tr><td class="sectionArticleTitle" valign="top">${product.productName}</td></tr>
                              <tr>
                                <td class="sectionArticleContent" valign="top" align="left">
                                  ${product.description}.<br />
                                  <span style="font-weight: bold; color: red; font-size: 13px">${product.price} VND</span>
                                </td>
                              </tr>
                              <tr>
                                <td class="buttonContainer">
                                  <table border="0" cellpadding="0" cellspacing="0" summary="" align="center" width="50%">
                                    <tr>
                                        <td class="button">
                                            <c:url var="addToCardLink" value="DispatchController">
                                                <c:param name="pk" value="${product.productID}"/>
                                                <c:param name="btAction" value="AddToCart"/>
                                            </c:url>
                                            <a href="${addToCardLink}" title="Add this product to your cart">Add to card</a>
                                        </td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>  
                            </table>  
                          </td>
                          <!-- End Column -->
                        </c:forEach>
                    </tr>
                </table>
            </c:if>
            
          </td>
        </tr>
      </table>
      
      <table border="0" cellspacing="0" cellpadding="0" summary="" width="100%">
        <tr>
          <td valign="top">
            <table border="0" cellspacing="0" cellspacing="" summary="" width="840" align="center">
              <tr><td class="whitespace" height="20">&nbsp;</td></tr>
              <tr><td align="center" class="sectionMainTitle">CPU Category</td></tr>
              <tr><td align="center" class="sectionMainContent" style="color: green">A central processing unit (CPU), also called a central processor.</td></tr>
              <tr><td class="whitespaceDivider" height="10">&nbsp;</td></tr>
              <tr><td class="whitespace" height="20">&nbsp;</td></tr>
            </table>
            <c:if test="${not empty applicationScope.LIST_2}">
                    <table border="0" cellspacing="0" cellspacing="" summary="" width="840" align="center">
                        <tr>
                          <c:forEach items="${applicationScope.LIST_2}" var="product">
                          <!-- Column and product card -->
                          <td class="column" valign="top">
                            <table border="0" cellpadding="0" cellspacing="0" width="200" summary="" class="card">
                              <tr>
                                <td class="sectionArticleImage" align="center">
                                  <img src="${product.image}" width="198" height = "250" alt="" />
                                </td>
                              </tr>
                              <tr><td class="sectionArticleTitle" valign="top">${product.productName}</td></tr>
                              <tr>
                                <td class="sectionArticleContent" valign="top" align="left">
                                  ${product.description}.<br />
                                  <span style="font-weight: bold; color: red; font-size: 13px;">${product.price} VND</span>
                                </td>
                              </tr>
                              <tr>
                                <td class="buttonContainer">
                                  <table border="0" cellpadding="0" cellspacing="0" summary="" align="center" width="50%">
                                    <tr>
                                        <td class="button">
                                            <c:url var="addToCardLink" value="DispatchController">
                                                <c:param name="pk" value="${product.productID}"/>
                                                <c:param name="btAction" value="AddToCart"/>
                                            </c:url>
                                            <a href="${addToCardLink}" title="Add this product to your cart">Add to card</a>
                                        </td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>  
                            </table>  
                          </td>
                          <!-- End Column -->
                        </c:forEach>
                    </tr>
                </table>
            </c:if>
            
          </td>
        </tr>
      </table>
      
      <table border="0" cellspacing="0" cellpadding="0" summary="" width="100%">
        <tr>
          <td valign="top">
            <table border="0" cellspacing="0" cellspacing="" summary="" width="840" align="center">
              <tr><td class="whitespace" height="20">&nbsp;</td></tr>
              <tr><td align="center" class="sectionMainTitle">Mainboard Category</td></tr>
              <tr><td align="center" class="sectionMainContent" style="color: green">Mainboard - Intel / AMD Genuine Motherboards, the latest full line of chipsets.</td></tr>
              <tr><td class="whitespaceDivider" height="10">&nbsp;</td></tr>
              <tr><td class="whitespace" height="20">&nbsp;</td></tr>
            </table>
            <c:if test="${not empty applicationScope.LIST_3}">
                    <table border="0" cellspacing="0" cellspacing="" summary="" width="840" align="center">
                        <tr>
                          <c:forEach items="${applicationScope.LIST_3}" var="product">
                          <!-- Column and product card -->
                          <td class="column" valign="top">
                            <table border="0" cellpadding="0" cellspacing="0" width="200" summary="" class="card">
                              <tr>
                                <td class="sectionArticleImage" align="center">
                                  <img src="${product.image}" width="198" height = "250" alt="" />
                                </td>
                              </tr>
                              <tr><td class="sectionArticleTitle" valign="top">${product.productName}</td></tr>
                              <tr>
                                <td class="sectionArticleContent" valign="top" align="left">
                                  ${product.description}.<br />
                                  <span style="font-weight: bold; color: red; font-size: 13px;">${product.price} VND</span>
                                </td>
                              </tr>
                              <tr>
                                <td class="buttonContainer">
                                  <table border="0" cellpadding="0" cellspacing="0" summary="" align="center" width="50%">
                                    <tr>
                                        <td class="button">
                                            <c:url var="addToCardLink" value="DispatchController">
                                                <c:param name="pk" value="${product.productID}"/>
                                                <c:param name="page" value="home"/>
                                                <c:param name="btAction" value="AddToCart"/>
                                            </c:url>
                                            <a href="${addToCardLink}" title="Add this product to your cart">Add to card</a>
                                        </td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>  
                            </table>  
                          </td>
                          <!-- End Column -->
                        </c:forEach>
                    </tr>
                </table>
            </c:if>
            
          </td>
        </tr>
      </table>
      
<!--      <table border="0" cellspacing="0" cellspacing="" summary="" width="840" align="center" style="background-color: #ffffff;">
        <tr><td colspan="2" class="whitespace" height="20">&nbsp;</td></tr>
        <tr>
          <td class="column" width="50%" align="center">
            <img src="images/payment-options.jpg" alt="Lorem ipsum" />
          </td>
          <td class="column" width="50%" align="center">
            <img src="images/shipping.jpg" alt="Lorem ipsum" />
          </td>
        </tr>
      </table>-->
      
      <!-- Social media -->
<!--      <table border="0" cellspacing="0" cellpadding="0" width="100%" summary="" class="socialMedia">
        <tr><td class="whitespace" height="20">&nbsp;</td></tr>
        <tr>
          <td>
            <table border="0" cellspacing="0" cellpadding="0" width="120" align="center" summary="">
              <tr>
                <td align="center" width="32">
                  <a href="https://www.twitter.com" title="Twitter"><img src="images/twitt.png" width="29"  alt="Twitter" /></a>
                </td>
                <td align="center" width="32">
                  <a href="https://www.facebook.com" title="Facebook"><img src="images/faceb.png" width="29" alt="Facebook" /></a>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr><td class="whitespace" height="10">&nbsp;</td></tr>
      </table>-->
      <!-- End Social media -->
      
      <!-- Footer -->
      <table border="0" cellspacing="0" cellpadding="0" width="100%" summary="" class="footer">
        <tr><td class="whitespace" height="10">&nbsp;</td></tr>
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
      <!-- End Footer -->
    </span>
  </body>
</html>
