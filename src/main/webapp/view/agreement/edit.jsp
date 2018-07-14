<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<jsp:include page="../header.jsp" />

<title>Contract No. <c:out value="${agreement.number}" /> | Editing</title>

<div class="container-fluid">

	<c:set var="spd" value="${agreement.spd}"/>

	<form class="form" role="form" action="agreement" method="post">
		<input type="hidden" name="edit"> 
		<input type="hidden" name="id" value="${agreement.id}"> 

		<nav class="breadcrumb">
			<div class="row">
				<div class="col">
					<a class="breadcrumb-item" href="spds">Entrepreneurs</a> 
					<a class="breadcrumb-item" href="${spd.url}">SPD <c:out	value="${spd.alias}" /></a> 
					<span class="breadcrumb-item active"><b>Contract No. <c:out value="${agreement.number}" /></b></span>
				</div>
			</div>
			<p>
			<div class="row">
				<div class="col-2">
					<sec:csrfInput/>
					<input type="submit" class="btn btn-success" id="button" value="Write down"> 	
					<a class="btn btn-danger" href="${spd.url}" role="button">Cancel</a>
				</div>
				<div class="col-2">
					<a class="btn btn-info" href=<c:url value="/agreement/printpdf/agr?id=${agreement.id}"/> role="button">
						< i  class = " fa fa-file-pdf-o " > </ i > Print the contract
					</a>
				</div>
			</div>
		</nav>
	
		<p>
		
		<div class="row">
			<div class="col-4">
				<label for="number"><b>room</b></label>
				<input type="text" class="form-control" id="number" name="number" placeholder="Enter contract number"
						value="${agreement.number}">
			</div>
			<div class="col-2">
				<label for="date"><b>date</b></label>
				<input type="date" class="form-control" id="dateStart" name="dateStart" placeholder="Enter the start date"
						value="${agreement.dateStart}">
			</div>
			<div class="col-2"></div>
			<div class="col-2">
				<label for="company"><b>Company-employer</b></label>
				<select name="company_id" class="form-control">
					<c:forEach var="company" items="${companies}">
						<c:choose>
							<c:when test="${company == agreement.company}">
								<option value="${company.id}" selected>${company.title}</option>
							</c:when>
							<c:otherwise>
								<option value="${company.id}">${company.title}</option>
							</c:otherwise>
						</c:choose>
  					</c:forEach>
				</select>
			</div>
		</div>
	</form>
	
	<p>
	<p>
	
	<! - Download the signed contract in PDF ->
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modalAgreementUpload">
		<i  class = "fa fa-file-pdf-o" > </i> Download the signed contract
	</button>
	<!-- Modal -->
	<div class="modal fade bd-example-modal" id="modalAgreementUpload" tabindex="-1" role="dialog" aria-labelledby="exampleModalAgreementUpload"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5  class = " modal-title "  id = " exampleModalAgreementUpload " > Download the signed contract </h5 >
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<c:url value="agreementFile" var="agreementFileUrl"/>
					<form action="${agreementFileUrl}" method="post" enctype="multipart/form-data" >
						<input type="hidden" name="add">
						<input type="hidden" name="agreementId" value="${agreement.id}">
						
						<input type="text" class="form-control" name="filename" ><br>
						<input type="text" class="form-control" name="description" ><br>
						<input type="file" class="form-control-file" name="file"><br>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<sec:csrfInput/>
							<input type="submit" class="btn btn-primary" value="Download"> 
						</div>	
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<p>

	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
	<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#spec" role="tab">Specifications</a></li>
		<li class="nav-item"><a class="nav-link"
			data-toggle="tab" href="#tarif" role="tab">Betting</a></li>
		
	</ul>
	<p>
	
	<!-- Tab panes -->
	<div class="tab-content">
	
	<!-- Specification Tab -->
	<div class="tab-pane active" id="spec" role="tabpanel">
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalSpec">
			<i  class = " fa fa-plus " > </i > Add specification
		</button>
		<!-- Modal -->
		<div class="modal fade bd-example-modal-sm" id="modalSpec" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">New Specification</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="specification" method="post">
							<input type="hidden" name="add"> 
							<input type="hidden" name="agreementId"	value="${agreement.id}">
							
							<div class="row">
								<div class="col">
									<label for="specificationNumber"><b>No. p/p</b></label>
								</div>
								<div class="col">
									<input type="text" class="form-control text-center" id="specificationNumber" name="specificationNumber" 
										value="${specificationNumber}">
								</div>
							</div>
							<p>
							<div class="row">
								<div class="col">
									<label for="dateStart"><b>Start date</b></label>
								</div>
								<div class="col">
									<input type="date" class="form-control" id="dateStart" name="dateStart"
										placeholder="" value="${dateStart}">
								</div>
							</div>
							<p>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								<sec:csrfInput/>
								<input type="submit" class="btn btn-primary" id="button" value="Upload">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<p>
		<table class="table table-sm table-hover">
			
			<c:set var="totalAgreementCount" />
			<c:set var="totalAgreementAmount" />
			
			<thead class="thead-default">
				<tr>
					<th class="text-center">No.</th>
					<th class="text-center">Beginning date</th>
					<th class="text-center">Finish date</th>
					<th class="text-center">Amount</th>
					<th></th>
				</tr>
			</thead>
			<c:forEach items="${agreement.specifications}" var="specification">
				<tr>
					<td class="text-center" onclick="goToAddress('${specification.url}')">${specification.specificationNumber}</td>
					<td class="text-center" onclick="goToAddress('${specification.url}')"><fmt:formatDate value="${specification.dateStart}" pattern="dd.MM.yyyy" /></td>
					<td class="text-center" onclick="goToAddress('${specification.url}')"><fmt:formatDate value="${specification.dateFinish}" pattern="dd.MM.yyyy" /></td>
					<td class="text-center" onclick="goToAddress('${specification.url}')"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${specification.specificationSum}" /></td>
					<td>
						<div class="d-flex justify-content-end">
							<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
								<div class="btn-group mr-2" role="group" aria-label="First group">
									<a class="btn btn-success btn-sm" href="${specification.url}" role="button">
										<i class="fa fa-edit"></i> Learn More
									</a>
								</div>
								<div class="btn-group mr-2" role="group" aria-label="Second group">
									<form action="specification" method="post">
										<input type="hidden" name="delete">
										<input type="hidden" name="id" value="${specification.id}">
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
				<c:set var="totalAgreementAmount" value="${totalAgreementAmount + specification.specificationSum}"/>
				<c:set var="totalAgreementCount" value="${totalAgreementCount + 1}" />
				</c:forEach>
				<thead class="thead-default">
					<tr>
						<th class="text-center">Total: <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${totalAgreementCount}" /></th>
						<th></th>
						<th></th>
						<th class="text-center"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${totalAgreementAmount}" /></th>
						<th></th>
					</tr>
				</thead>
		</table>
	</div>
	
	<!-- Tarif Tab -->
	<div class="tab-pane" id="tarif" role="tabpanel">
	
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalTarif">
			<i class="fa fa-plus"></i> Add bids
		</button>
		<!-- Modal -->
		<div class="modal fade bd-example-modal-lg" id="modalTarif" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">New rates to Contract No. ${agreement.number}</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="agreementTarif" method="post">
								<input type="hidden" name="add">
								<input type="hidden" name="agreementId" value="${agreement.id}"/>
								
								<div class="row">
									<div class="col">
										<label for="configuring"><b>Configuring, UAH</b></label>
										<input type="text" class="form-control text-center" id="configuring" name="configuring">
									</div>
									<div class="col">
										<label for="programming"><b>Programming, UAH</b></label>
										<input type="text" class="form-control text-center" id="programming" name="programming">
									</div>
									<div class="col">
										<label for="architecting"><b>Architecting</b></label>
										<input type="text" class="form-control text-center" id="architecting" name="architecting">
									</div>
								</div>
								<p>
								<div class="row">
									<div class="col"></div>
									<div class="col-4">
										<label for="dateStart"><b>Date Start</b></label>
										<input type="date" class="form-control" id="dateStart" name="dateStart">
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
				
				<c:set var="totalTarifCount" />
				
				<thead class="thead-default">
					<tr>
						<th class="text-center" >Configuring</th>
						<th class="text-center" >Programming</th>
						<th class="text-center" >Arch</th>
						<th class="text-center" >Effective from</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach items="${agreement.tarifs}" var="tarif">
					<tr>
						<c:set var="openModal" value="$('#modalTarifEdit${tarif.id}').modal('show')" />
						<td class="text-center" onclick="${openModal}"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${tarif.configuring}" /></td>
						<td class="text-center" onclick="${openModal}"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${tarif.programming}" /></td>
						<td class="text-center" onclick="${openModal}"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${tarif.architecting}" /></td>
						<td class="text-center" onclick="${openModal}"><fmt:formatDate value="${tarif.dateStart}" pattern="dd.MM.yyyy" /></td>
						<td>
							<div class="d-flex justify-content-end">
								<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
									<div class="btn-group mr-2" role="group" aria-label="First group">
									<!-- Button trigger modal -->
										<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#modalTarifEdit${tarif.id}"><i class="fa fa-pencil-square-o"></i> Change Rate</button>
									</div>
									<!-- Modal -->
									<div class="modal fade bd-example-modal-lg" id="modalTarifEdit${tarif.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
										<div class="modal-dialog modal-lg" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Editing of rates to the Contract No. ${agreement.number}</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<form action="agreementTarif" method="post">
														<input type="hidden" name="edit">
														<input type="hidden" name="id" value="${tarif.id}"/>
														
														<div class="row">
															<div class="col">
																<label for="configuring"><b>Configuring, UAH</b></label>
																<input type="text" class="form-control text-center" id="configuring" name="configuring" 
																	value="${tarif.configuring}" >
															</div>
															<div class="col">
																<label for="programming"><b>Programming, UAH</b></label>
																<input type="text" class="form-control text-center" id="programming" name="programming" 
																	value="${tarif.programming}" >
															</div>
															<div class="col">
																<label for="architecting"><b>Arch. refinement</b></label>
																<input type="text" class="form-control text-center" id="architecting" name="architecting" 
																	value="${tarif.architecting}" >
															</div>
														</div>
														<p>
														<div class="row">
															<div class="col"></div>
															<div class="col-4">
																<label for="dateStart" ><b>Date Start</b></label>
																<input type="date" class="form-control" id="dateStart" name="dateStart" 
																	value="${tarif.dateStart}" >
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
									<div class="btn-group mr-2" role="group" aria-label="Second group">
										<form action="agreementTarif" method="post">
											<input type="hidden" name="delete"> 
											<input type="hidden" name="id" value="${tarif.id}">
											<sec:csrfInput/>
											<button type="submit" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i> Remove</button>
										</form>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<c:set var="totalTarifCount" value="${totalTarifCount + 1}" />
				</c:forEach>
				<thead class="thead-default">
					<tr>
						<th class="text-center">Total: <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${totalTarifCount}" /></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div> <!-- .container-fluid -->
	
<!-- footer -->
<jsp:include page="../footer.jsp" />
