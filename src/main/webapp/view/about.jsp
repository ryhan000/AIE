<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<jsp:include page="header.jsp" />

<title>About</title>

<div class="container-fluid">

	<br>
	<h1 class="text-center">Briefly about the application SPDApp2</h1>
	<h5 class="text-center">(The application is under construction,
		therefore some elements either can be absent, or have the limited
		functional)</h5>
	<br>

	<div class="row">
		<div class="col-1"></div>
		<div class="col">

			<p class="lead text-justify">
				<strong>he SPDApp2 application was created to help
					accountants in the IT industry and is intended for automation
					accounting calculations with business entities.</strong>
			</p>
			<br>
			<p class="lead text-justify">
				<strong> This application allows you to significantly
					reduce the time to prepare documents related to the maintenance
					workflow between SAP and a legal entity.</strong>
			</p>
			<br>
			<p class="lead text-justify">
				<strong>Technologies used in this application: </strong>
			</p>
			<ul>
				<li><em>Java 8</em></li>
				<li><em>Spring Framework (MVC, Data, Security)</em></li>
				<li><em>JPA/Hibernate, MySQL</em></li>
				<li><em>JSP + Bootstrap 4 + Javascript</em></li>
				<li><em>JasperReports (for generation PDF)</em></li>
				<li><em>Maven</em></li>
				<li><em>Tomcat 8</em></li>
			</ul>
		</div>
		<div class="col-1"></div>
	</div>

</div>
<!-- .container-fluid -->

<!-- footer -->
<jsp:include page="footer.jsp" />