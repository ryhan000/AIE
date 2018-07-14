<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<jsp:include page="../header.jsp" />

<title>Access denied</title>

<div class="container-fluid">
	
	<strong>HTTP Status 403 - Access is denied!!!</strong>
	

	<button class="btn btn-danger" onclick="goBack()">Go back</button>
				
	

</div> <!-- .container-fluid -->
	
<!-- footer -->
<jsp:include page="../footer.jsp" />