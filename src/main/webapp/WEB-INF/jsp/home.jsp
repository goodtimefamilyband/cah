<%@ page session="false"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:page>
    <jsp:attribute name="title">Welcome!</jsp:attribute>
    <jsp:body>
    	<div class="container fill" style="width: 100%">
	        <div class="row black card" style="height: 40%">
	        	Black cards here
	        </div>
	        <div class="row cardbar">
	        	White cards here
	        </div>
	        <div class="row white card">
	        	<div class="card-nav" id="btn-card-left">
	        		<span class="card-nav-inner">&lt;</span>
	        	</div>
	        	<div class="card-text">
	        		Card
	        	</div>
	        	<div class="card-nav" id="btn-card-right">
	        		<span class="card-nav-inner">&gt;</span>
	        	</div>
	        </div>
	        <div class="row cardbar">
	        	Submit button, etc
	        </div>
        </div>
    </jsp:body>
</t:page>