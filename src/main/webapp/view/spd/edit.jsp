<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<jsp:include page="../header.jsp" />

<title>Editing | SPD <c:out value="${spd.alias}" /></title>

<div class="container-fluid">

	<c:set var="address" value="${spd.address}" scope="page" />
	<c:set var="registrationInfo" value="${spd.registrationInfo}"
		scope="page" />

	<form class="form" role="form" action="spd" method="post">
		<input type="hidden" name="edit"> <input type="hidden"
			name="id" value="${spd.id}">

		<nav class="breadcrumb">
			<div class="row">
				<div class="col">
					<a class="breadcrumb-item" href="spds"> List of SAP</a> <span
						class="breadcrumb-item active"><b>SPD <c:out
								value="${spd.alias}" /> => Editing
					</b></span>
				</div>
			</div>
			<p>
			<div class="row">
				<div class="col">
					<sec:csrfInput />
					<input type="submit" class="btn btn-success" id="button"
						value="Write down"> <a class="btn btn-danger"
						href="${spd.url}" role="button">Cancel</a>
				</div>
			</div>
		</nav>

		<div id="accordion" role="tablist" aria-multiselectable="true">
			<div class="card">
				<div class="card-header" role="tab" id="headingOne">
					<h5 class="mb-0">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne"> Basic data </a>
					</h5>
				</div>
				<div id="collapseOne" class="collapse show" role="tabpanel"
					aria-labelledby="headingOne">
					<div class="card-body">
						<div class="row">
							<div class="col-sm">
								<label for="surname" class="col-sm"><b> Surname</b></label> <input
									type="text" class="form-control" id="surname" name="surname"
									placeholder="Enter surname" value="${spd.surname}">
							</div>
							<div class="col-sm">
								<label for="firstname" class="col-sm"><b>First name</b></label> <input
									type="text" class="form-control" id="firstname"
									name="firstname" placeholder="Enter your name"
									value="${spd.firstname}">
							</div>
							<div class="col-sm">
								<label for="lastname" class="col-sm"><b>Last name</b></label>
								<input type="text" class="form-control" id="lastname"
									name="lastname" placeholder="Enter last name"
									value="${spd.lastname}">
							</div>
						</div>
						<p>
						<div class="row">
							<div class="col">
								<label for="alias"><b>Short Name</b></label> <input type="text"
									class="form-control" id="alias" name="alias"
									placeholder="Enter a short name" value="${spd.alias}">
							</div>
							<div class="col-4">
								<label for="inn"><b>TIN</b></label> <input type="text"
									class="form-control" id="inn" name="inn"
									placeholder="Enter the identification number"
									value="${spd.inn}">
							</div>
						</div>
						<p>
						<div class="row">
							<div class="col">
								<label for="passport"><b> Passport</b></label> <input
									type="text" class="form-control" id="passport" name="passport"
									placeholder="Enter your passport information"
									value="${spd.passport}">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" role="tab" id="headingTwo">
					<h5 class="mb-0">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">Address
							activities </a>
					</h5>
				</div>
				<div id="collapseTwo" class="collapse" role="tabpanel"
					aria-labelledby="headingTwo">
					<div class="card-body">
						<div class="row">
							<div class="col-3">
								<label for="country"><b> Country</b></label> <input type="text"
									class="form-control" id="country" name="country"
									placeholder="country" value="${address.country}">
							</div>
							<div class="col">
								<label for="region"><b> Region</b></label> <input type="text"
									class="form-control" id="region" name="region"
									placeholder="Region" value="${address.region}">
							</div>
							<div class="col">
								<label for="city"><b> Local city</b></label> <input type="text"
									class="form-control" id="city" name="city"
									placeholder="Locality" value="${address.city}">
							</div>
						</div>
						<p>
						<div class="row">
							<div class="col-6">
								<label for="street"><b>Street</b></label> <input type="text"
									class="form-control" id="street" name="street"
									placeholder="Street" value="${address.street}">
							</div>
							<div class="col-1">
								<label for="building"><b>House No.</b></label> <input
									type="text" class="form-control" id="building" name="building"
									placeholder="House number" value="${address.building}">
							</div>
							<div class="col-1">
								<label for="flat"><b>Apartment</b></label> <input type="text"
									class="form-control" id="flat" name="flat"
									placeholder="Apartment" value="${address.flat}">
							</div>
							<div class="col-2">
								<label for="zip"><b>Index</b></label> <input type="text"
									class="form-control" id="zip" name="zip" placeholder="Index"
									value="${address.zip}">
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" role="tab" id="headingThree">
					<h5 class="mb-0">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">
							Information about the state. registration </a>
					</h5>
				</div>
				<div id="collapseThree" class="collapse" role="tabpanel"
					aria-labelledby="headingThree">
					<div class="card-body">
						<div class="row">
							<div class="col">
								<label for="description"><b>Description</b></label> <input
									type="text" class="form-control" id="description"
									name="description" placeholder="Description"
									value="${registrationInfo.description}">
							</div>
							<div class="col-2">
								<label for="dated"><b>Date</b></label> <input type="date"
									class="form-control" id="dated" name="dated" placeholder="date"
									value="${registrationInfo.dated}">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</form>

</div>
<!-- .container-fluid -->

<!-- footer -->
<jsp:include page="../footer.jsp" />