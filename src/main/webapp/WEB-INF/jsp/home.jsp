<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Registration Page</title>
</head>
<body>
<h2>StudentForm</h2>
<form:form  modelAttribute="sbean" action="first" method="POST">
<table>
   <%--  <tr>
        <td>std_Id:</td>
        <td><form:input path="stdId" placeholder="stdId"/></td>
    </tr> --%>
    <tr>
        <td>StudentName:</td>
        <td><form:input path="stdName" placeholder="stdName"/></td>
    </tr>
    <tr>
        <td>StudentAddr :</td>
        <td>
            <form:input path="stdAddr" placeholder="stdAddr" /> 
             <tr>
        <td>StudentPhone:</td>
        <td><form:input path="stdPhone" placeholder="stdPhone"/></td>
    </tr>
    <tr>
        <td>StudentGender :</td>
        <td>
            <form:radiobutton path="stdGender" value="M" label="Male"/>
            <form:radiobutton path="StdGender" value="F" label="Female"/>
            <input type="submit" value="Submit"/><br> 
   
        </td>
        </tr>
</table>
</form:form>

</body>
</html>