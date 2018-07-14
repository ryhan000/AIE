<%@ page session="false" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<jsp:include page="../header.jsp" />

<title>Contracts with SAP</title>

<div class="container-fluid">

	<nav class="breadcrumb">
		<span class="breadcrumb-item active"><b>Contracts</b></span>
	</nav>
	
	<form action="agreement" method="get">
		<input type="hidden" name="add"> 
		<button type="submit" class = "btn btn-primary">
			<i class="fa fa-plus"></i>
			<c:out value=" New contract" />
		</button>
	</form>
	
	<p>

	<table class="table table-sm table-hover">
		<thead class="thead-default">
			<tr>
				<th class="text-center align-middle">ID</th>
				<th class="text-center align-middle">SPD</th>
				<th class="text-center align-middle">Contract number</th>
				<th class="text-center align-middle">Date</th>
				<th></th>
			</tr>
		</thead>

		<c:forEach items="${agreements}" var="agreement">
			<c:set var="spd" value="${agreement.spd}"/>
			<tr>
				<td class="text-center align-middle" onclick="goToAddress('${agreement.url}')">${agreement.id}</td>
				<td class="text-center align-middle" onclick="goToAddress('${agreement.url}')">${spd.alias}</td>
				<td class="text-center align-middle" onclick="goToAddress('${agreement.url}')">${agreement.number}</td>
				<td class="text-center align-middle" onclick="goToAddress('${agreement.url}')">
					<fmt:formatDate pattern="dd.MM.yyyy" value="${agreement.dateStart}" />
				</td>
				<td>
					<div class="d-flex justify-content-end">
						<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
							<div class="btn-group mr-2" role="group" aria-label="First group">
								<a class="btn btn-success btn-sm" href="${agreement.url}" role="button">
									<i class="fa fa-edit"></i> Learn More
								</a>
							</div>
							<div class="btn-group mr-2" role="group" aria-label="Second group">
								<form action="agreements" method="post">
									<input type="hidden" name="delete"> 
									<input type="hidden" name="id" value="${agreement.id}"> 
									<sec:csrfInput/>
									<button type="submit" class="btn btn-danger btn-sm">
										<i class="fa fa-trash-o"></i> Remove
									</button>
								</form>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</c:forEach>
		<thead class="thead-default">
			<tr>
				<th class="text-center">Total: ${fn:length(agreements)}</th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
		</thead>
	</table>

</div>

<!-- footer -->
<jsp:include page="../footer.jsp" />