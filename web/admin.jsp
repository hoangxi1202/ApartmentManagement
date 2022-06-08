<%-- 
    Document   : admin
    Created on : May 23, 2022, 9:32:30 PM
    Author     : Minh Hoàng
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                session.setAttribute("ERROR_MESSAGE", "Please Login as admin!");
                return;
            }
        %>
        <a href="managerAccount.jsp">Manager Account</a>
        <h1>Hello Admin: <%= loginUser.getFullName()%></h1>
        <form action="MainController">
            <input type="submit" name="action" value="ViewTrouble"/>
        </form>
        <form action="MainController">
            <input type="submit" name="action" value="ViewResident"/>
        </form>
        
    </body>
</html>
