<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<!DOCTYPE html>

<head>
<title>
	List Customers
</title>
		
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" /> 
<body>
	
		<div id  = "wrapper">
		
			<div id = "header">
				<h2> CRM Application</h2>
			</div>
			
		
		</div>
		
		
		<div id = "container">
			
			<div id = "content">
			
			<input type = "button" value = "Add Customer" 
						onclick = "window.location.href='showFormForAdd';"
						class = "add-button"/>
			<!-- Search Customer -->

			<form:form action="search" method="GET">
					 Search customer: <input type="text" name="theSearchName" />
					 
					    <input type="submit" value="Search" class="add-button" />
					 

			</form:form>				
				<table>
					<tr>
					
						<th> First Name</th>
						<th> Last Name</th>
						<th> Email</th>
						<th> Action</th>
					</tr>
					<!--  loop over customers and add data -->
						<c:forEach var = "temp" items = "${customers}">
							<!-- construct update link with customer id -->
							
							<c:url var = "updateLink" value = "/customer/showFormForUpdate">
								<c:param name="customerId" value = "${temp.id}"></c:param>
							</c:url>
							
							<c:url var = "deleteLink" value = "/customer/delete">
								<c:param name="customerId" value = "${temp.id}"></c:param>
							</c:url>
							
							<tr>
								<td> ${temp.fname} </td>
								<td> ${temp.lname}</td>
								<td> ${temp.email}</td>
								<td> 
								<!-- display -->
									<a href = "${updateLink}">Update</a>
									|
									<a href = "${deleteLink}" onclick = " if (!(confirm('Are you sure you want to delete'))) return false">
									
									Delete</a>
								</td>
							</tr>
						
						</c:forEach>
				
				</table>
			
			</div>
			
		</div>
		<div style = "clear: both;">
					<p>
						<a href="${pageContext.request.contextPath}/customer/list"> Back to list</a>
					</p>
				
				</div>
</body>
</head>