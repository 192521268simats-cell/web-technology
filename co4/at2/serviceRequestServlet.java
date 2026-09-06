import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ServiceRequestServlet")
public class ServiceRequestServlet extends HttpServlet {

    private static int requestCounter = 1000;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String employeeId = request.getParameter("employeeId");
        String employeeName = request.getParameter("employeeName");
        String department = request.getParameter("department");
        String problemCategory = request.getParameter("problemCategory");
        String problemDescription = request.getParameter("problemDescription");
        String priority = request.getParameter("priority");

        // Validation
        if (employeeId == null || employeeId.trim().isEmpty() ||
            employeeName == null || employeeName.trim().isEmpty() ||
            department == null || department.trim().isEmpty() ||
            problemCategory == null || problemCategory.trim().isEmpty() ||
            problemDescription == null || problemDescription.trim().isEmpty() ||
            priority == null || priority.trim().isEmpty()) {

            request.setAttribute("errorMessage",
                    "All fields are mandatory!");

            request.getRequestDispatcher("serviceRequest.jsp")
                   .forward(request, response);

            return;
        }

        // Create Model object
        ServiceRequest serviceRequest =
                new ServiceRequest(
                        employeeId,
                        employeeName,
                        department,
                        problemCategory,
                        problemDescription,
                        priority
                );

        // Generate Request Number
        String requestNumber = "SR-" + (++requestCounter);

        // Store data
        request.setAttribute("serviceRequest", serviceRequest);
        request.setAttribute("requestNumber", requestNumber);

        // Forward to acknowledgement page
        request.getRequestDispatcher("acknowledgement.jsp")
               .forward(request, response);
    }
}
