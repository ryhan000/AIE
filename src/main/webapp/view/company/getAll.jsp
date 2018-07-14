<%@ page session="false" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<jsp:include page="../header.jsp" />

<title>Company Profile</title>

<div class="container-fluid">

	<nav class="breadcrumb">
		<span class="breadcrumb-item active"><b>Company Profile</b></span>
	</nav>

	<!-- 'Add Company' -->
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalAgreement">
		<i class="fa fa-plus"></i> New company
	</button>
	<!-- Modal -->
	<div class="modal fade" id="modalAgreement" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"><b>New company</b></h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="company" method="post">
						<input type="hidden" name="add"> 
							<div class="form-group">
								<label for="title" class="col-sm-10 control-label"><b>Name</b></label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="title"
										name="title" placeholder="Enter the title">
								</div>
							</div>
							<div class="form-group">
								<label for="edrpou" class="col-sm-10 control-label"><b>EDRPOU</b></label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edrpou"
										name="edrpou" placeholder="Enter the code EDRPOU">
								</div>
							</div>
							<div class="form-group">
								<label for="inn" class="col-sm-10 control-label"><b>TIN</b></label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inn"
										name="inn" placeholder="Enter INN">
								</div>
							</div>
							<div class="form-group">
								<label for="vatCertificate" class="col-sm-10 control-label"><b>No. of fees. VAT</b></label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="vatCertificate"
										name="vatCertificate" placeholder="Enter No. of VAT">
								</div>
							</div>
						<p>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<sec:csrfInput/>
							<input type="submit" class="btn btn-primary" id="button" value="Save">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<p>

	<table class="table table-sm table-hover">
	
		<c:set var="totalCount" />
	
		<thead class="thead-default">
			<tr>
				<th class="text-center">ID</th>
				<th class="text-center">Name</th>
				<th class="text-center">EDRPOU</th>
				<th class="text-center"></th>
			</tr>
		</thead>

		<c:forEach items="${companies}" var="company">
			<tr>
				<td class="text-center" onclick="goToAddress('${company.url}')">${company.id}</td>
				<td class="text-center" onclick="goToAddress('${company.url}')">${company.title}</td>
				<td class="text-center" onclick="goToAddress('${company.url}')">${company.edrpou}</td>
				<td class="text-center">
					<div class="d-flex justify-content-end">
						<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
							<div class="btn-group mr-2" role="group" aria-label="First group">
								<a class="btn btn-success btn-sm" href="${company.url}" role="button">
									<i class="fa fa-edit"></i> Learn More
								</a>
							</div>
							<div class="btn-group mr-2" role="group" aria-label="Second group">
								<form action="company" method="post">
									<input type="hidden" name="delete"> 
									<input type="hidden" name="id" value="${company.id}"> 
									<sec:csrfInput/>
									<sec:authorize access="hasRole('ROLE_ADMIN')" >
										<button type="submit" class="btn btn-danger btn-sm">
											<i class="fa fa-trash-o"></i> Remove
										</button>
									</sec:authorize>
								</form>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<c:set var="totalCount" value="${totalCount + 1}" />
		</c:forEach>
		<thead class="thead-default">
					<tr>
						<th class="text-center">Total: <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${totalCount}" /></th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
	</table>

</div>

<!-- footer -->
<jsp:include page="../footer.jsp" />