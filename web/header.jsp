<%-- 
    Document   : header
    Created on : Mar 2, 2023, 6:46:28 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href="index.jsp"><img src="images/logo.jpg" id="logo"></a></li>
                    <li><a href="mainController?action=">Home</a></li>
                    <li><a href="registration.jsp">Register</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="mainController?action=viewcart">View cart</a></li>
                    <li><form action="mainController" method="post" class="form_search">
                            <input type="text" name="txtsearch" value="<%= (request.getParameter("txtsearch")==null)?"": request.getParameter("txtsearch") %>">
                            <select name="searchby"><option value="byname">by name</option>
                                <option value="bycate">by category</option>
                            </select>
                            <input type="submit" value="search" name="action">
                        </form></li>
                </ul>
            </nav>
        </header>
    </body>
</html>
