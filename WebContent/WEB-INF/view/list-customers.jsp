<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
	<title>List Customer</title>
	<!-- reference our style sheet -->
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/style.css"/>
	
</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>CRM-Customer Relationship Manager</h2>
		</div>
	
	</div>
	
	<form:form action="search" method="POST">
    Search customer: <input type="text" name="theSearchName" />
                
    <input type="submit" value="Search" class="add-button" />
    </form:form>
	
	
	<div id="container">
		<div id="content">
		<!-- put new button:Add Customer -->
		<input type ="button" value="Add Customer" 
		onclick="window.location.href='showFormForAdd';return false;" class="add-button"/>		
		
		<table>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Action</th>
			</tr>
			<c:forEach var="tempCustomers" items="${customers}">
				<!-- construct the update link -->
				<c:url var = "updateLink" value="/customer/showFormForUpdate" >
					<c:param name="customerId" value ="${tempCustomers.id}" />
				</c:url>
				
				<!-- construct Delete link -->
				<c:url var = "deleteLink" value="/customer/delete" >
					<c:param name="customerId" value ="${tempCustomers.id}" />
				</c:url>
				<tr>
					<td>${tempCustomers.firstName}</td>
					<td>${tempCustomers.lastName}</td>
					<td>${tempCustomers.email}</td>
					<td>
						<a href="${updateLink}">Update</a>
						|
						<a href="${deleteLink}" onclick="if(!(confirm('are you sure delete this customer?'))) return false">Delete</a>
					</td>			
				</tr>			
			</c:forEach>
		</table>
		
		</div>	
	</div>

</body>


</html>




