<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<form:form modelAttribute="sbean" action="first" method="POST">
				<table>
					<tr>
						<td><form:hidden path="stdId" /></td>
					</tr>
					<tr>
						<td>FirstName</td>
						<td>:</td>
						<td><form:input path="stdName" placeholder="stdName" /></td>
					</tr>
					<tr>
						<td>Address</td>
						<td>:</td>
						<td><form:input path="stdAddr" placeholder="stdAddr" />
					<tr>
						<td>Cell</td>
						<td>:</td>
						<td><form:input path="stdPhone" placeholder="stdPhone" /></td>
					</tr>
					<tr>
						<td>Gender</td>
						<td>:</td>
						<td><form:radiobutton path="stdGender" value="M" />Male <form:radiobutton
								path="stdGender" value="F" />Female</td>
								</tr>
								<tr><td>Date</td>
								<td>:</td>
								<td><form:input type="datetime-local" path="stdDate" /></td></br>
					<br><td><input type="submit" value="Submit" /><br></td>
					<td><input type="reset" id="reset" value="Cancel" /></td>


					</tr>
				</table>
			</form:form>
		</div>


		<div>
			<h2>Student List</h2>
			<table border="2">
				<thead>
					<th>Std_Id</th>
					<th>Std_Name</th>
					<th>Std_Addr</th>
					<th>Std_Phone</th>
					<th>StdGender</th>
					<th>stdDate</th>
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
							<td>${student1.stdDate}</td> 

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