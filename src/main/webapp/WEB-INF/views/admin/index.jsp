<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CES DEMO Admin page</title>
    <link type="text/css" href="<c:url value='/css/bootstrap.css' />" rel="stylesheet" />
    
</head>
<body>
    <h2>List of Persons</h2>
    <table class="table table-bordered">
        <tr>
            <th>S.No</th>
            <th>PersonId</th>
            <th>PersonName</th>
            <th>Action</th>
        </tr>
        <tbody>
            <c:forEach items="${persons}" var="person" varStatus="itr">
                <tr>
                    <td>${itr.index+1}</td>
                    <td>${person.faceId}</td>
                    <td>${person.lastName}</td>
                    <td><a href="<c:url value="/remove/${person.faceId}" />" class="btn btn-danger btn-xs">Delete</a> </td>
                </tr>
            </c:forEach>
        </tbody>

    </table>
    <a href="<c:url value="/removeall" />" class="btn btn-danger">Remove All</a>

<script type="application/javascript" src="<c:url value='/js/jquery.min.js' />"></script>
<script type="application/javascript" src="<c:url value='/js/bootstrap.js' />"></script>


</body>
</html>