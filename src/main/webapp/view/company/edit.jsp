<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<jsp:include page="../header.jsp" />

<title><c:out value="${company.title}" /></title>

<div class="container-fluid">

	<form class="form" role="form" action="company" method="post">
		<input type="hidden" name="edit">
		<input type="hidden" name="id" value="${company.id}">

		<nav class="breadcrumb">
			<div class="row">
				<div class="col">
					<a class="breadcrumb-item" href="companies">Company Profile</a>
					<span class="breadcrumb-item active"><b><c:out value="${company.title}" /></b></span>
				</div>
			</div>
			<p>
			<div class="row">
				<div class="col">
					<sec:csrfInput/>
					<input type="submit" class="btn btn-success" id="button" value="Write down"> 	
					<a class="btn btn-danger" href="companies" role="button">Cancel</a>
				</div>
			</div>
		</nav>
	
		<p>	
			
		<div class="row">
			<div class="col-3">
				<label for="title"><b>Name</b></label>
				<input type="text" class="form-control" id="title" name="title" 
					placeholder="Enter company name" value="${fn:replace(company.title, '"', '&quot;')}" >  
			</div>
			<div class="col-3">
				<label for="edrpou"><b>EDRPOU</b></label>
				<input type="text" class="form-control" id="edrpou" name="edrpou" 
					placeholder="Enter EDRPOU" value=<c:out value="${company.edrpou}"/> >
			</div>
			<div class="col-3">
				<label for="inn"><b>TIN</b></label>
				<input type="text" class="form-control" id="inn" name="inn" 
					placeholder="Enter INN" value="${company.inn}">
			</div>
			<div class="col-3">
				<label for="vatCertificate"><b>No. of fees. VAT</b></label>
				<input type="text" class="form-control" id="vatCertificate"	name="vatCertificate" 
					placeholder="Enter the certificate no" value="${company.vatCertificate}">
			</div>
		</div>
	
	</form>

	<!-- Nav tabs -->
	<p>
	
	<ul class="nav nav-tabs nav-fill" role="tablist">
		<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#address" role="tab">Address</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#director" role="tab">Director</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#account" role="tab">Bank details</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#agreements" role="tab">Related treaties</a></li>
	</ul>

	<p>

	<!-- Tab panes -->
	<div class="tab-content">
		
		<!-- Tab pane 'Address'  -->
		<div class="tab-pane fade show active" id="address" role="tabpanel">
			<p>
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalCompanyAddressAdd">
				<i class="fa fa-plus"></i>New address
			</button>
			<!-- Modal -->
			<div class="modal fade" id="modalCompanyAddressAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
				aria-hidden="true" >
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel"><c:out value="${company.title}"/> |New address</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="companyAddress" method="post">
								<input type="hidden" name="add"> 
								<input type="hidden" name="companyId" value="${company.id}"> 
								<div class="row">
									<div class="col-sm">
										<label for="presentation" class="col-sm"><b>Performance</b></label> 
										<input type="text" class="form-control" id="presentation"
											name="presentation" placeholder="Enter the performance">
									</div>
								</div>
								<p>
								<div class="row">
									<div class="col-6">
										<label for="dateStart" class="col-sm"><b>Effective from</b></label> 
										<input type="date" class="form-control" id="dateStart"
											name="dateStart" placeholder="Enter the start date for the action">
									</div>
								</div>
								<p>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
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
				
				<c:set var="totalAddressCount" />
				
				<thead class="thead-default">
					<tr>
						<th class="text-center">ID</th>
						<th class="text-center">Address</th>
						<th class="text-center">Effective from</th>
						<th class="text-center"></th>
					</tr>
				</thead>
				<c:forEach items="${company.addresses}" var="address">
					<tr>
						<c:set var="openModal" value="$('#modalCompanyAddressEdit${address.id}').modal('show')" />
						<td class="text-center" onclick="${openModal}"><c:out value="${address.id}"/></td>
						<td class="text-center" onclick="${openModal}"><c:out value="${address.presentation}"/></td>
						<td class="text-center" onclick="${openModal}"><fmt:formatDate	value="${address.dateStart}" pattern="dd.MM.yyyy" /></td>
						<td>
							<div class="d-flex justify-content-end">
								<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
									<div class="btn-group mr-2" role="group" aria-label="First group">
									<!-- Button trigger modal -->
										<button type="button" class="btn btn-success btn-sm" data-toggle="modal" 
											data-target="#modalCompanyAddressEdit${address.id}">
											<i class="fa fa-edit"></i> Edit
										</button>
									</div>
									<!-- Modal -->
									<div class="modal fade" id="modalCompanyAddressEdit${address.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel"><c:out value="${company.title}"/> | Edit address</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<form action="companyAddress" method="post">
														<input type="hidden" name="edit"> 
														<input type="hidden" name="id" value="${address.id}"> 
														<div class="row">
															<div class="col-sm">
																<label for="presentation" class="col-sm"><b>Performance</b></label> 
																<input type="text" class="form-control" id="presentation"
																	name="presentation" placeholder="Enter the performance" value="${address.presentation}">
															</div>
														</div>
														<p>
														<div class="row">
															<div class="col-6">
																<label for="dateStart" class="col-sm"><b>Effective from</b></label> 
																<input type="date" class="form-control" id="dateStart"
																	name="dateStart" placeholder="Enter the start date" value="${address.dateStart}">
															</div>
														</div>
														<p>	
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
															<sec:csrfInput/>
															<input type="submit" class="btn btn-primary" id="button" value="Save">
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
									<div class="btn-group mr-2" role="group" aria-label="Second group">
										<form action="companyAddress" method="post">
											<input type="hidden" name="delete"> 
											<input type="hidden" name="id" value="${address.id}">
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
					<c:set var="totalAddressCount" value="${totalAddressCount + 1}" />
				</c:forEach>
				<thead class="thead-default">
					<tr>
						<th class="text-center">Total: <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${totalAddressCount}" /></th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
			</table>
		</div>
		
		<!-- Tab pane 'Director'  -->
		<div class="tab-pane fade" id="director" role="tabpanel">
			<p>
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalCompanyDirectorAdd">
				<i class="fa fa-plus"></i> Upload
			</button>
			<!-- Modal -->
			<div class="modal fade" id="modalCompanyDirectorAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
				aria-hidden="true" >
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel"><c:out value="${company.title}"/> | New director</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="companyDirector" method="post">
								<input type="hidden" name="add">
								<input type="hidden" name="companyId" value="${company.id}"> 
								<div class="row">
									<div class="col">
										<label for="fullName"><b>Full name</b></label> 
										<input type="text" class="form-control" id="fullName" name="fullName" >
									</div>
								</div>
								<p>
								<div class="row">
									<div class="col">
										<label for="shortName"><b>Surname, initials</b></label> 
										<input type="text" class="form-control" id="shortName" name="shortName" >
									</div>
								</div>
								<p>
								<div class="row">
									<div class="col">
										<label for="post"><b>Position</b></label> 
										<input type="text" class="form-control" id="post" name="post" >
									</div>
								</div>
								<p>
								<div class="row">
									<div class="col"></div>
									<div class="col">
										<label for="employmentDate"><b>Employment Date</b></label> 
										<input type="date" class="form-control" id="employmentDate" name="employmentDate" >
									</div>
								</div>
								<p>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
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
				
				<c:set var="totalDirectorCount" />
				
				<thead class="thead-default">
					<tr>
						<th class="text-center">ID</th>
						<th class="text-center">Full name</th>
						<th class="text-center">Surname, initials</th>
						<th class="text-center">Employment Date</th>
						<th class="text-center"></th>
					</tr>
				</thead>
				<c:forEach items="${company.directors}" var="director">
					<tr>
						<c:set var="openModal" value="$('#modalCompanyDirectorEdit${director.id}').modal('show')" />
						<td class="text-center" onclick="${openModal}"><c:out value="${director.id}"/></td>
						<td class="text-center" onclick="${openModal}"><c:out value="${director.fullName}"/></td>
						<td class="text-center" onclick="${openModal}"><c:out value="${director.shortName}"/></td>
						<td class="text-center" onclick="${openModal}"><fmt:formatDate	value="${director.employmentDate}" pattern="dd.MM.yyyy" /></td>
						<td>
							<div class="d-flex justify-content-end">
								<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
									<div class="btn-group mr-2" role="group" aria-label="First group">
									<!-- Button trigger modal -->
										<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#modalCompanyDirectorEdit${director.id}">
											<i class="fa fa-edit"></i> Edit
										</button>
									</div>
									<!-- Modal -->
									<div class="modal fade" id="modalCompanyDirectorEdit${director.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel"><c:out value="${company.title}"/> | Editing of data about the director</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<form action="companyDirector" method="post">
														<input type="hidden" name="edit">
														<input type="hidden" name="id" value="${director.id}">
														
														<div class="row">
															<div class="col">
																<label for="fullName"><b>Full name</b></label> 
																<input type="text" class="form-control" id="fullName" name="fullName" 
																	value="${director.fullName}" >
															</div>
														</div>
														<p>
														<div class="row">
															<div class="col">
																<label for="shortName"><b>Surname, initials</b></label> 
																<input type="text" class="form-control" id="shortName" name="shortName" 
																	value="${director.shortName}" >
															</div>
														</div>
														<p>
														<div class="row">
															<div class="col">
																<label for="post"><b>Position</b></label> 
																<input type="text" class="form-control" id="post" name="post" 
																	value="${director.post}" >
															</div>
														</div>
														<p>
														<div class="row">
															<div class="col">
																<label for="employmentDate"><b>Start date</b></label> 
																<input type="date" class="form-control" id="employmentDate" name="employmentDate" 
																	value="${director.employmentDate}" >
															</div>
															<div class="col">
																<label for="firedDate"><b>Date of dismissal</b></label> 
																<input type="date" class="form-control" id="firedDate" name="firedDate" 
																	value="${director.firedDate}">
															</div>
														</div>
														<p>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
															<sec:csrfInput/>
															<input type="submit" class="btn btn-primary" id="button" value="Save">
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
									<div class="btn-group mr-2" role="group" aria-label="Second group">
										<form action="companyDirector" method="post" >
											<input type="hidden" name="delete">
											<input type="hidden" name="id" value="${director.id}">
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
					<c:set var="totalDirectorCount" value="${totalDirectorCount + 1}" />
				</c:forEach>
				<thead class="thead-default">
					<tr>
						<th class="text-center">Total: <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${totalDirectorCount}" /></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
			</table>
		</div>
		
		<!-- Tab pane 'Account'  -->
		<div class="tab-pane fade" id="account" role="tabpanel">
			<p>
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalCompanyAccountAdd">
				<i class="fa fa-plus"></i> New account
			</button>
			<!-- Modal -->
			<div class="modal fade" id="modalCompanyAccountAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
				aria-hidden="true" >
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel"><c:out value="${company.title}"/> |The new bank. score</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="companyAccount" method="post">
								<input type="hidden" name="add"> 
								<input type="hidden" name="companyId" value="${company.id}"> 
								<div class="row">
									<div class="col-sm">
										<label for="presentation" class="col-sm"><b>Performance</b></label> 
										<input type="text" class="form-control" id="presentation"
											name="presentation" placeholder="">
									</div>
								</div>
								<p>
								<div class="row">
									<div class="col-6">
										<label for="dateStart" class="col-sm"><b>Start Date</b></label> 
										<input type="date" class="form-control" id="dateStart"
											name="dateStart" placeholder="">
									</div>
								</div>
								<p>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
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
				
				<thead class="thead-default">
					<tr>
						<th class="text-center">ID</th>
						<th class="text-center">Name</th>
						<th class="text-center">Date Start</th>
						<th class="text-center"></th>
					</tr>
				</thead>
				<c:forEach items="${company.accounts}" var="account">
					<tr>
						<c:set var="openModal" value="$('#modalCompanyAccountEdit${account.id}').modal('show')" />
						<td class="text-center" onclick="${openModal}"><c:out value="${account.id}"/></td>
						<td class="text-center" onclick="${openModal}"><c:out value="${account.presentation}"/></td>
						<td class="text-center" onclick="${openModal}"><fmt:formatDate	value="${account.dateStart}" pattern="dd.MM.yyyy" /></td>
						<td>
							<div class="d-flex justify-content-end">
								<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
									<div class="btn-group mr-2" role="group" aria-label="First group">
									<!-- Button trigger modal -->
										<button type="button" class="btn btn-success btn-sm" data-toggle="modal" 
											data-target="#modalCompanyAccountEdit${account.id}">
											<i class="fa fa-edit"></i>Edit
										</button>
									</div>
									<!-- Modal -->
									<div class="modal fade" id="modalCompanyAccountEdit${account.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel"><c:out value="${company.title}"/> | Edit the bank. score</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<form action="companyAccount" method="post">
														<input type="hidden" name="edit"> 
														<input type="hidden" name="id" value="${account.id}"> 
														<div class="row">
															<div class="col-sm">
																<label for="presentation" class="col-sm"><b>Performance</b></label> 
																<input type="text" class="form-control" id="presentation"
																	name="presentation" placeholder="Enter the address" value="${fn:replace(account.presentation, '"', '&quot;')}">
															</div>
														</div>
														<p>
														<div class="row">
															<div class="col-6">
																<label for="dateStart" class="col-sm"><b>Date Start</b></label> 
																<input type="date" class="form-control" id="dateStart"
																	name="dateStart" placeholder="Enter the start date for the action" value="${account.dateStart}">
															</div>
														</div>
														<p>	
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
															<sec:csrfInput/>
															<input type="submit" class="btn btn-primary" id="button" value="Save">
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
									<div class="btn-group mr-2" role="group" aria-label="Second group">
										<form action="companyAccount" method="post">
											<input type="hidden" name="delete"> 
											<input type="hidden" name="id" value="${account.id}">
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
						<th class="text-center">Total: <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" 
							value="${fn:length(company.accounts)}" /></th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
			</table>
		</div>
		
		<div class="tab-pane fade" id="agreements" role="tabpanel">
			...
		</div>
		
	</div>


</div> <!-- .container-fluid -->
	
<!-- footer -->
<jsp:include page="../footer.jsp" />