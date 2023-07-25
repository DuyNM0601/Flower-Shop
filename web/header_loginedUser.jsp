<%-- 
    Document   : header_loginedUser
    Created on : Mar 2, 2023, 8:36:18 PM
    Author     : ASUS
--%>

<%@page import="mydao.OrderDao"%>
<%@page import="mybasicobject.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="personalPage.jsp">Main Menu</a></li>
                <li><a href="changeprofile.jsp">Change profile</a></li>
                <li><a href="ordercompleted.jsp">Completed orders</a></li>
                <li><a href="ordercanceled.jsp">Canceled orders</a></li>
                <li><a href="orderprocessing.jsp">Processing orders</a></li>
                <form action="mainController" method="post">
                <li>from<input type="date" name="from"> to <input type="date" name="to">
                    <input type="submit" value="searchByDate" name="action">
                </li>
                </form>
            </ul>
        </nav>
    </body>
</html>
