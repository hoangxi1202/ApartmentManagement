

<%@page import="dao.ApartmentError"%>
<%@page import="java.util.List"%>
<%@page import="dto.ApartmentDTO"%>
<%@page import="dto.ApartmentDTO"%>
<%@page import="java.util.List"%>
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
            String search = (String) request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <%
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <a href="managerAccount.jsp">Manager Account</a>

        <h1>Hello Admin: <%= loginUser.getFullName()%></h1>
        <form action="MainController" method="POST">
            <input type="submit" name="action" value="Logout"/>
        </form>
        <form action="MainController">
            Search Apartment<input type="text" name="search" value="<%= search%>"/>
            <input type="submit" name="action" value="SearchApartment"/>
        </form>
        <%
            List<ApartmentDTO> listApartment = (List<ApartmentDTO>) request.getAttribute("LIST_APARTMENT");
            if (listApartment != null) {
                if (listApartment.size() > 0) {


        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form>
        <!--        <form action="MainController" method="POST">
                    Email<input type="email" name="email" />
                    <input type="submit" name="action" value="SendMail"/>
                </form>-->
        <form action="MainController">
            Search<input type="text" name="search" value="<%=search%>"/>
            <input type="submit" name="action" value="Search"/>
        </form>
        <%
            List<UserDTO> list = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (list != null) {
                if (!list.isEmpty()) {

        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>

                    <th>Apartment ID</th>
                    <th>Image</th>
                    <th>Details</th>
                    <th>Building Name</th>
                    <th>Rent Price</th>
                    <th>Sale Price</th>
                    <th>Status</th>

                    <th>User ID</th>
                    <th>Role ID</th>
                    <th>Password</th>
                    <th>Delete</th>
<!--                    <th>Update</th>-->

                </tr>
            </thead>
            <tbody>
                <%

                    ApartmentError apartmentError = (ApartmentError) request.getAttribute("APARTMENT_ERROR");
                    if (apartmentError == null) {
                        apartmentError = new ApartmentError();
                    }

                %>

                <%= apartmentError.getSizeError()%>
                <%= apartmentError.getImageError()%>
                <%= apartmentError.getBuildingNameError()%>
                <%= apartmentError.getRentPriceError()%>
                <%= apartmentError.getSalePriceError()%>
                <%= apartmentError.getStatusError()%>

                <%
                    int count = 1;
                    for (ApartmentDTO apartment : listApartment) {
                %>
            <form action="MainController">
                <tr>
                    <td><%= count++%></td>
                    <td>
                        <input type="text" name="apartmentId" value="<%= apartment.getApartmentId()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="size" value="<%= apartment.getSize()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="details" value="<%= apartment.getImage()%>" required=""/>
                        <img    src="<%=apartment.getImage()%>" width="50px" height="50px"/>
                    </td>
                    <td>
                        <input type="text" name="buildingName" value="<%= apartment.getBuildingName()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="number" name="rentPrice" value="<%= apartment.getRentPrice()%>" required=""/>
                    </td>
                    <td>
                        <input type="number" name="salePrice" value="<%= apartment.getSalePrice()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="status" value="<%= apartment.getStatus()%>" required=""/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="UpdateApartment"/>
                        <input type="hidden" name="search" value="<%= search%>"/>
                    </td>

                    int count = 1;
                    for (UserDTO user : list) {
                %>
            <form action="MainController" >
                <tr>
                    <td><%= count++%></td>
                    <td><%= user.getUserID()%></td>          
                    <td>
                        <%=user.getRoleID()%>
                    </td>                   
                    <td><%= user.getPassword()%></td>
                    <td>
             <!--//            <a href="MainController?action=Delete&userID=<%=user.getUserID()%>&search=<%=search%> " >Delete</a>--> 
                        <input type="submit" name="action" value="Delete"/>
                        <input type="hidden" name="userID" value="<%=user.getUserID()%>"/>
                        <input type="hidden" name="search" value="<%=search%>"/> 
                    </td>
<!--                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="userID" value="<%=user.getUserID()%>"/>
                        <input type="hidden" name="search" value="<%=search%>"/> 
                    </td>-->

                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <%
            }
        }
    %>
</body>
        }
        String error_message = (String) request.getAttribute("ERROR_MESSSAGE");
        if (error_message == null) {
            error_message = "";
        }
    %>
    <h1 ><%= error_message%></h1>
    <%
        }
    %>
</body>

<form action="MainController">
    <input type="submit" name="action" value="ViewTrouble"/>
</form>
<form action="MainController">
    <input type="submit" name="action" value="ViewResident"/>
</form>

</body>


</html>
