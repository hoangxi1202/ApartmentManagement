<%-- 
    Document   : employee
    Created on : May 23, 2022, 9:37:19 PM
    Author     : Minh Hoàng
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"EM".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                session.setAttribute("ERROR_MESSAGE", "Please Login as employee!");
                return;
            }
        %>
        <h1>Hello Employee: <%= loginUser.getFullName()%></h1>
    </body>
</html>
