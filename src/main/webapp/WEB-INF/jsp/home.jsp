<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Registration Page</title>
<script>
	window.setTimeout(function() {
		$(".msgcss").fadeTo(500, 0).slideUp(500, function() {
			$(this).remove();
		});
	}, 5000);
</script>
</head>
<body>
	<div class="container">
		<c:if test="${not empty msg}">
			<div class="msgcss row">
				<div class="col-sm-4 col-sm-offset-4">
					<div class="form-group">
						<div class="alert alert-${cssMsg} fadeIn animated">${msg}</div>
					</div>
				</div>
			</div>
		</c:if>
	</div>
	<div align="center" style="color: green">
		<div>
			<h2>Student Details</h2>
			<form:form modelAttribute="sbean" action="first" enctype="multipart/form-data" method="POST">
				<table>
					<tr>
						<td><form:hidden path="stdId" /></td>
					</tr>
<tr>
					<td>FirstName</td>
					<td>:</td>
					<td><form:input path="stdName" placeholder="Name" /></td>
					</tr>
					<tr>
						<td>Address</td>
						<td>:</td>
						<td><form:input path="stdAddr" placeholder="Addr" /></td></tr>
					<tr>
						<td>Cell</td>
						<td>:</td>
						<td><form:input path="stdPhone" placeholder="Phone" /></td>
					</tr>
					<tr>
						<td>Gender</td>
						<td>:</td>
						<td><form:radiobutton path="stdGender" value="M" />Male <form:radiobutton
								path="stdGender" value="F" />Female</td>
					</tr>
					<tr>
						<td>Country</td>
						<td>:</td>
						<td><form:select path="stdCountry">
								<form:option value="" label="--- Select ---" />
								<form:option value="India" label="India" />
								<form:option value="Japan" label="Japan	" />
								<form:option value="America	" label="America	" />
								<form:option value="Singapore" label="Singapore" />
								<form:options items="${countryList}" />
						</form:select></td>
					</tr>
					<tr>
						<td>Date</td>
						<td>:</td>
						<td><form:input type="datetime-local" path="stdDate" /></td></tr>
					<tr>
						<td>Select file</td>
							<td>:</td>
						<td><input type="file" name="fileUpload" id="fileUpload" fileUpload /></td>
						
				
					</tr>
					
				<tr>
					<td><input type="submit" value="Submit" />
					<input type="reset" id="reset" value="Cancel" /></td>


					</tr>
				</table>
			</form:form>
		</div>


		<div>
			<h2>Student List</h2>
			<table border="1">
				<thead align="justify">
					<th>StudentId</th>
					<th>StudentName</th>
					<th>StudentAddr</th>
					<th>StudentPhone</th>
					<th>StudentGender</th>
					<th>StudentCountry</th>
					<th>StudentDate</th>
					<th>fileUpload</th>
					<th>Action</th>
				</thead>

				<tbody>
					<c:forEach var="student1" items="${studentList}">
						<tr>
							<td>${student1.stdId}</td>
							<td>${student1.stdName}</td>
							<td>${student1.stdAddr}</td>
							<td>${student1.stdPhone}</td>
							<td>${student1.stdGender}</td>
							<td>${student1.stdCountry }</td>
							<td>${student1.stdDate}</td>
							<td><c:if test="${not empty student1.fileUpload}">
			    <c:forTokens items="${student1.fileUpload}" delims="*" var="mySplit">
			<a class="attachments" target="_blank" href="reportDocuments/${mySplit}">
			<i class="fa fa-download fa-md grey" title="${mySplit}"></i></a>
		    </c:forTokens>
		   </c:if></td>
							
							<td><a href="editStudent?stdId=${student1.stdId}">Edit</a> <a
								href="deleteStudent?stdId=${student1.stdId}">Delete</a></td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>