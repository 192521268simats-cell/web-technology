<!DOCTYPE html>
<html>
<head>
    <title>IT Service Request</title>
</head>

<body>

<h2>IT Service Request Management System</h2>

<%
    if (request.getAttribute("errorMessage") != null) {
%>
    <p style="color:red;">
        <%= request.getAttribute("errorMessage") %>
    </p>
<%
    }
%>

<form action="ServiceRequestServlet" method="post">

    Employee ID:
    <input type="text" name="employeeId" required>
    <br><br>

    Employee Name:
    <input type="text" name="employeeName" required>
    <br><br>

    Department:
    <input type="text" name="department" required>
    <br><br>

    Problem Category:
    <select name="problemCategory" required>
        <option value="">Select Category</option>
        <option value="Network">Network</option>
        <option value="Software">Software</option>
        <option value="Hardware">Hardware</option>
        <option value="Account">Account</option>
        <option value="Other">Other</option>
    </select>
    <br><br>

    Problem Description:
    <br>
    <textarea name="problemDescription"
              rows="5" cols="40" required></textarea>
    <br><br>

    Priority:
    <select name="priority" required>
        <option value="">Select Priority</option>
        <option value="Low">Low</option>
        <option value="Medium">Medium</option>
        <option value="High">High</option>
    </select>
    <br><br>

    <input type="submit" value="Submit">

</form>

</body>
</html>
