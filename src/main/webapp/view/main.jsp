<%@ page session="false" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<jsp:include page="header.jsp" />

<title>home</title>

<div class="container-fluid">

	<div class="row">
		<div class="col-md-3">
			<div class="alert alert-dark" role="alert">
				<h4 class="text-center">
					<strong> <a href="spds" class="text-dark">
							Entrepreneurs</a>
					</strong>
				</h4>
			</div>
		</div>
		<div class="col-md-9">
			<div class="alert alert-dark" role="alert">
				<h4 class="text-center">
					<strong>Documentation</strong>
				</h4>
			</div>
		</div>
	</div>

	<p>
	<div class="row">
		<div class="col-md-3">
			<div class="list-group" id="list-tab" role="tablist">
				<c:forEach items="${spds}" var="spd">
					<a class="list-group-item list-group-item-action"
						id="list-spd-${spd.id}-list" data-toggle="list"
						href="#list-spd-${spd.id}" role="tab"
						aria-controls="spd-${spd.id}"
						ondblclick="goToAddress('${spd.url}')"> <strong>${spd.alias}</strong>
					</a>
				</c:forEach>
			</div>
		</div>

		<div class="col-md-9">
			<div class="tab-content" id="nav-tabContent">

				<c:forEach items="${spds}" var="spd">
					<div class="tab-pane fade" id="list-spd-${spd.id}" role="tabpanel"
						aria-labelledby="list-spd-${spd.id}-list">

						<c:forEach items="${spd.agreements}" var="agreement">

							<c:set var="totalSpecificationAmount" value="${0}" />

							<div class="card">
								<h5 class="card-header alert alert-dark text-center">
									Contract: <a class="text-danger" href="${agreement.url}"> <c:out
											value="${agreement.number}" /> from<fmt:formatDate
											value="${agreement.dateStart}" pattern="dd.MM.yyyy" />in
									</a>
								</h5>

								<div class="card-body">

									<table class="table table-sm ">

										<thead>

											<tr>
												<th class="text-center table-active"><strong
													class="text-dark"> Specifications </strong></th>
												<th class="text-center table-active"><strong
													class="text-dark"> Calculations </strong></th>
												<th class="text-center table-active"><strong
													class="text-dark"></strong></th>
											</tr>
										</thead>

										<c:forEach var="specification"
											items="${agreement.specifications}">

											<tr>
												<td class="text-center align-middle"><a
													href="${specification.url}" class="text-success"> <strong>No.
															<c:out value="${specification.specificationNumber}" />
															from <fmt:formatDate value="${specification.dateStart}"
																pattern="dd.MM.yyyy" />in (<fmt:formatNumber
																type="number" minFractionDigits="2"
																maxFractionDigits="2"
																value="${specification.specificationSum}" /> UAH)
													</strong>
												</a></td>
												<td class="text-center align-middle"><c:forEach
														var="calculation" items="${specification.calculations}">
														<a href="${calculation.url}" class="text-info"> <strong>No.
																<c:out value="${calculation.partNumber}" />behind<fmt:formatDate
																	value="${calculation.dateStart}" pattern="MMMM" /> <fmt:formatDate
																	value="${calculation.dateStart}" pattern="yyyy" />in (<fmt:formatNumber
																	type="number" minFractionDigits="2"
																	maxFractionDigits="2" value="${calculation.turnover}" />
																UAH)
														</strong>
														</a>
														<br>
													</c:forEach></td>
												<td class="text-right align-middle">

													<div class="dropdown">
														<button class="btn btn-info dropdown-toggle" type="button"
															id="dropdownMenuButton" data-toggle="dropdown"
															aria-haspopup="true" aria-expanded="false">
															<i class="fa fa-print"></i> Printing
														</button>
														<div class="dropdown-menu"
															aria-labelledby="dropdownMenuButton">
															<a class="dropdown-item"
																href=<c:url value="/specification/printpdf/spec?id=${specification.id}"/>>
																<i class="fa fa-file-pdf-o"></i> Specification
															</a> <a class="dropdown-item"
																href=<c:url value="/specification/printpdf/cert?id=${specification.id}"/>>
																<i class="fa fa-file-pdf-o"></i> Act of. of work
															</a>
														</div>
													</div>

												</td>
											<tr>
												<c:set var="totalSpecificationAmount"
													value="${totalSpecificationAmount + specification.specificationSum}" />
										</c:forEach>
										<thead class="thead-default">
											<tr>
												<th class="text-center"><strong class="text-dark">

														Number of: <fmt:formatNumber type="number"
															minFractionDigits="0" maxFractionDigits="0"
															value="${fn:length(agreement.specifications)}" />
												</strong></th>
												<th class="text-center"><strong class="text-dark">

														Total amount: <fmt:formatNumber type="number"
															minFractionDigits="2" maxFractionDigits="2"
															value="${totalSpecificationAmount}" /> UAH
												</strong></th>
												<th></th>
											</tr>
										</thead>
									</table>

								</div>
							</div>
							<br>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<br>

</div>

<!-- footer -->
<jsp:include page="footer.jsp" />