<%-- 
    Document   : addResident
    Created on : Jun 6, 2022, 10:44:57 AM
    Author     : Nhat Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new Residents</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            <div id="nhap">
                <div>
                    <input type="text" name="name"  />
                    <input type="date" name="dob"  />
                    <select name="gender">
                        <option value="1">Nam</option>
                        <option value="0">Nữ</option>
                    </select>
                    <input type="text" name="job" />
                    <input type="tel" name="phone" />
                </div>
            </div>


            <input type="submit" name="action" value="AddResident"/>
        </form>
        <button onclick="addElement()">+</button>
        <script>
            function addElement() {
                let nhap = document.getElementById("nhap");
                let div = document.createElement("div");
                div.innerHTML = '<div>'
                        + '\n<input type="text" name="name"  />'
                        + '\n<input type="date" name="dob"  />'
                        + '\n<select name="gender">'
                        + '\n    <option value="1">Nam</option>'
                        + '\n   <option value="0">Nữ</option>'
                        + '\n </select>'
                        + '\n<input type="text" name="job" />'
                        + '\n<input type="tel" name="phone" />'
                        + '\n</div>';
                nhap.appendChild(div);
            }


        </script>
    </body>
</html>
