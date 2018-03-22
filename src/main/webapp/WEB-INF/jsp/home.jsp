<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Registration Page</title>
</head>
<body>
<div align="center">
<div>
<h2>Student Details</h2>
<form:form  modelAttribute="sbean" action="first" method="POST">
<table>
   <%--  <tr>
        <td>std_Id:</td>
        <td><form:input path="stdId" placeholder="stdId"/></td>
    </tr> --%>
    <tr>
        <td>StudentName</td>
        <td>:</td>
        <td><form:input path="stdName" placeholder="stdName"/></td>
    </tr>
    <tr>
        <td>StudentAddr</td>
        <td>:</td>
        <td>
            <form:input path="stdAddr" placeholder="stdAddr" /> 
             <tr>
        <td>StudentPhone</td>
        <td>:</td>
        <td><form:input path="stdPhone" placeholder="stdPhone"/></td>
    </tr>
    <tr>
        <td>StudentGender</td>
        <td>:</td>
        <td>
            <form:radiobutton path="stdGender" value="M" label="Male"/>
            <form:radiobutton path="StdGender" value="F" label="Female"/>
   
        </td>
        </tr>
        <td> <input type="submit" value="Submit"/><br> </td>
        
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

<td>
<a href="editStudent?stdId=${editStudent.stdId}">Edit</a>
							 <a
							href="deleteStudent?stdId=${deleteStudent.stdId}">Delete</a>
</td>

</tr>
</c:forEach>
</tbody>
</table>
</div></div>

</body>
</html>