<%@ page session="false"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<t:page>
    <jsp:attribute name="title">Welcome!</jsp:attribute>
    <jsp:body>
    	<h1>Games</h1>
    	<div class="container fill" style="width: 100%">
	        <c:forEach var="game" items="${games}">
		        <div class="row">
			        <div class="white card">
			        	<a href="/app/${game.id}"><c:out value="${game.getName()}" /></a>
			        </div>
		        </div>
	        </c:forEach>
	        <div class="row">
	        	<h2>Create a new game:</h2>
	        	<form action="create" method="POST">
	        		<input type="text" class="form-control" name="gname" placeholder="name" />
	        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        		<button type="submit" class="btn btn-info">Create</button>
	        	</form>
	        </div>
        </div>
        
        
    </jsp:body>
</t:page>