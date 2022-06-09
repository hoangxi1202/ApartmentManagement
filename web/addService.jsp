<%-- 
    Document   : addService
    Created on : May 30, 2022, 8:33:29 PM
    Author     : Minh Hoàng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add service Page</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            Service ID
            <input type="text" name="serID" required=""><br>
            Service Name<input type="text" name="serName" required=""><br>
            Create Date<input type="date" name="serDate" required=""><br>
            Price<input type="text" name="serPrice" required=""><br>
            <input type="submit" name="action" value="AddService" >           
        </form>
        <%

            String error_message = (String) request.getAttribute("ERROR_MESSAGE");
            if (error_message == null) {
                error_message = "";
            }
        %>
        <h1 ><%= error_message%></h1>
    </body>
</html>
