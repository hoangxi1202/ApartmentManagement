<%-- 
    Document   : createTrouble
    Created on : May 27, 2022, 10:36:10 AM
    Author     : Nhat Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Báo cáo sự cố</title>
    </head>
    <body>
        <%-- Not support yet --%>
        <form action="MainController">
            Tòa: <input type="text" name="apartmentId" alt="" required=""/></br>
            Hợp đồng: <input type="text" name="contractId" alt="" required=""/></br>
            <select>
                !-- not now
            </select>
            Nội dung: <input type="text" name="detail" required="" alt="Nội dung chi tiết" />
            Giải pháp: <input type="text" name="solution" alt="Giải pháp mong muốn"/>
            <input type="submit" name="action" value="SendTrouble"/>

        </form>
        <a href="user.jsp">Hủy<a/>
    </body>
</html>
