<%@ page import="ServiceRequest" %>

<!DOCTYPE html>
<html>
<head>
    <title>Service Request Acknowledgement</title>
</head>

<body>

<%
    ServiceRequest sr =
        (ServiceRequest) request.getAttribute("serviceRequest");

    String requestNumber =
        (String) request.getAttribute("requestNumber");
%>

<h2>Request Submitted Successfully!</h2>

<p>Your IT service request has been submitted.</p>

<table border="1" cellpadding="10">

    <tr>
        <td><b>Service Request Number</b></td>
        <td><%= requestNumber %></td>
    </tr>

    <tr>
        <td><b>Employee ID</b></td>
        <td><%= sr.getEmployeeId() %></td>
    </tr>

    <tr>
        <td><b>Employee Name</b></td>
        <td><%= sr.getEmployeeName() %></td>
    </tr>

    <tr>
        <td><b>Department</b></td>
        <td><%= sr.getDepartment() %></td>
    </tr>

    <tr>
        <td><b>Problem Category</b></td>
        <td><%= sr.getProblemCategory() %></td>
    </tr>

    <tr>
        <td><b>Priority</b></td>
        <td><%= sr.getPriority() %></td>
    </tr>

    <tr>
        <td><b>Problem Description</b></td>
        <td><%= sr.getProblemDescription() %></td>
    </tr>

</table>

<h3>MVC Architecture</h3>

<p>
<b>Model:</b> ServiceRequest.java
</p>

<p>
<b>View:</b> serviceRequest.jsp and acknowledgement.jsp
</p>

<p>
<b>Controller:</b> ServiceRequestServlet
</p>

<p>
Employee → JSP → Servlet → Validation → Model Object
→ Request Attributes → Acknowledgement JSP
</p>

</body>
</html>
