<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <table>
    <tr>
        <td>ID</td>
        <td>${stdId}</td>
    </tr>
    <tr>
        <td>Name</td>
        <td>${stdName}</td>
    </tr>
    <tr>
        <td>Address</td>
        <td>${stdAddr}</td>
    </tr>
    <tr>
        <td>Phone</td>
        <td>${stdPhone}</td>
    </tr>
    <tr>
        <td>Gender</td>
        <td>${stdGender}</td>
    </tr>
</table>  

</body>
</html>