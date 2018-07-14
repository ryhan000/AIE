<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<jsp:include page="header.jsp" />

<title>Log in SPDApp2</title>

<br>

<div class="container-fluid">

	<c:url value="/login" var="loginVar" />

	<div class="row">
		<div class="col"></div>
		<div class="col-4">
			<div class="card">
				<h2 class="card-header text-center">Login to the system</h2>
				<div class="card-body">
					<form action="${loginVar}" method="POST">
						<br>
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon1"> <i
								class="fa fa-user-circle" style="font-size: 24px;"></i>
							</span> <input type="text" name="custom_username" class="form-control"
								placeholder="User" aria-describedby="basic-addon1" />
						</div>
						<p>
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon1"> <i
								class="	fa fa-key" style="font-size: 24px;"></i>
							</span> <input type="password" name="custom_password"
								class="form-control" placeholder="Password"
								aria-describedby="basic-addon1" />
						</div>
						<p>
						<div class="input-group">
							<div class="row text-right">
								<div class="col text-right">
									<label> <c:out value="Remember me" /> <input
										type="checkbox" id="remember" name="remember-me" />
									</label>
								</div>
							</div>
						</div>
						<p>
							<sec:csrfInput />
							<c:if test="${param.logout != null}">
								<div class="alert alert-success text-center" role="alert">
									User successfully logged out</div>
							</c:if>
							<c:if test="${param.error != null}">
								<div class="alert alert-danger text-center" role="alert">

									Incorrect login and / or password</div>
							</c:if>
							<button id="btn-save" class="btn btn-lg btn-primary btn-block"
								type="submit">
								<i class="fa fa-sign-in"></i> To come in
							</button>
					</form>
				</div>
			</div>

			<div class="card">
				<div class="card-body">
					<form action="${loginVar}" method="POST">
						<h2 class="text-center">or</h2>
						<input type="hidden" name="custom_username"
							value="<c:out value="DemoUser" />" /> <input type="hidden"
							name="custom_password" value="<c:out value="123" />" />
						<sec:csrfInput />
						<button id="btn-save" class="btn btn-lg btn-primary btn-block"
							type="submit">
							<i class="fa fa-sign-in"></i> Log in as DemoUser
						</button>
					</form>
				</div>
			</div>
		</div>
		<div class="col"></div>
	</div>

</div>
<!-- .container-fluid -->

<!-- footer -->
<jsp:include page="footer.jsp" />