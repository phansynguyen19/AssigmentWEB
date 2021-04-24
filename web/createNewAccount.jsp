<%-- 
    Document   : createNewAccount
    Created on : Apr 14, 2021, 7:14:43 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<!DOCTYPE html>
<html>
    <head>
        <title>Sign up Page</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    </head>
    <style>
    body,
		html {
			margin: 0;
			padding: 0;
			height: 100%;
			background: #60a3bc !important;
		}
		.user_card {
			height: 550px;
			width: 400px;
			margin-top: auto;
			margin-bottom: auto;
			background: #f39c12;
			position: relative;
			display: flex;
			justify-content: center;
			flex-direction: column;
			padding: 10px;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			-webkit-box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			-moz-box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			border-radius: 5px;

		}
		.brand_logo_container {
			position: absolute;
			height: 170px;
			width: 170px;
			top: -75px;
			border-radius: 50%;
			background: #60a3bc;
			padding: 10px;
			text-align: center;
		}
		.brand_logo {
			height: 150px;
			width: 150px;
			border-radius: 50%;
			border: 2px solid white;
		}
		.form_container {
			margin-top: 100px;
		}
		.login_btn {
			width: 100%;
			background: #c0392b !important;
			color: white !important;
		}
		.login_btn:focus {
			box-shadow: none !important;
			outline: 0px !important;
		}
		.login_container {
			padding: 0 2rem;
		}
		.input-group-text {
			background: #c0392b !important;
			color: white !important;
			border: 0 !important;
			border-radius: 0.25rem 0 0 0.25rem !important;
		}
                .input-group {
                    width: 350px;
                }
		.input_user,
		.input_pass:focus {
			box-shadow: none !important;
			outline: 0px !important;
		}
		.custom-checkbox .custom-control-input:checked~.custom-control-label::before {
			background-color: #c0392b !important;
		}
</style>
    <body>
        <div class="container h-100">
		<div class="d-flex justify-content-center h-100">
			<div class="user_card">
				<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<img src="https://cdn.freebiesupply.com/logos/large/2x/pinterest-circle-logo-png-transparent.png" class="brand_logo" alt="Logo">
					</div>
				</div>
                                
				<div class="d-flex justify-content-center form_container">
					<form action="DispatchController" method="POST">
						<div class="input-group mb-2">
                                                        <c:set var="errors" value="${requestScope.CREATE_ERROR}"/>
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" name="txtUsername" class="form-control input_user" value="${param.txtUsername}" placeholder="Username* (6-20 char)">
                                                        <c:if test="${not empty errors.usernameLengthErr}">
                                                            <font color="red">
                                                            ${errors.usernameLengthErr}
                                                            </font>
                                                        </c:if>
						</div>
						<div class="input-group mb-2">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" name="txtPassword" class="form-control input_pass" value="" placeholder="Password* (6-30 char)">
                                                        <c:if test="${not empty errors.passwordLengthErr}">
                                                            <font color="red">
                                                                ${errors.passwordLengthErr}
                                                            </font></br>
                                                        </c:if>
						</div>
                                                <div class="input-group mb-2">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" name="txtConfirm" class="form-control input_pass" value="" placeholder="Confirm* (6-30 char)">
                                                        <c:if test="${not empty errors.confirmNotMatched}">
                                                            <font color="red">
                                                            ${errors.confirmNotMatched}
                                                            </font></br>
                                                        </c:if>
						</div>
                                                <div class="input-group mb-2">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" name="txtFullName" class="form-control input_pass" value="${param.txtFullName}" placeholder="Full name* (2-50 char)">
                                                        <c:if test="${not empty errors.fullNameLengthErr}">
                                                            <font color="red">
                                                            ${errors.fullNameLengthErr}
                                                            </font></br>
                                                        </c:if>
						</div>
						
							<div class="d-flex justify-content-center mt-3 login_container">
				 	<button type="submit" value="Create New Account" name="btAction" class="btn login_btn">Create New Account</button>
				   </div>
					</form>
                                    
				</div>
                            <div style="text-align: center">
                                <c:if test="${not empty errors.usernameIsExisted}">
                                    <font color="red">
                                    ${errors.usernameIsExisted}
                                    </font></br>
                                </c:if>
                            </div>
				<div class="mt-4">
					<div class="d-flex justify-content-center links">
						Have an account? <a href="login1.jsp" class="ml-2">Sign in</a>
					</div>
				</div>
			</div>
		</div>
	</div>
    </body>
</html>
