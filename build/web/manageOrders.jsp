<%-- 
    Document   : manageOrders
    Created on : Mar 15, 2023, 6:04:14 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <header>
            <c:import url="header_loginedAdmin.jsp"></c:import>
            </header>
        <form action="mainController" method="post">
            <input type="text" name="txtSearch" pattern="\d+" title="Please enter numbers only">
            <input type="submit" value="searchOrder" name="action">
        </form>
        <h1></h1>
        <table class="order">
            <tr><th> Order ID</th>
                <th> Order Date</th>
                <th> Ship Date</th>
                <th> Status</th>
                <th> Account ID</th>
                <th> Action</th>
            </tr>
            <c:forEach var="ord" items="${requestScope.orderList}" >
                <tr><td><c:out value="${ord.getOrderID()}"></c:out></td>
                    <td><c:out value="${ord.getOrderDate()}"></c:out></td>
                    <td><c:out value="${ord.getShipDate()}"></c:out></td>
                    <td><c:choose>
                            <c:when test="${ord.getStatus() eq 1}"> Processing order</c:when>
                            <c:when test="${ord.getStatus() eq 2}"> Completed order</c:when>
                            <c:otherwise> Canceled order</c:otherwise>
                        </c:choose>
                    </td>
                    <td><c:out value="${ord.getAccID()}"></c:out></td>
                    <td><c:if test="${ord.getStatus()eq 1 || ord.getStatus() eq 3}"><!-- only bl/unbl user account -->
                        <c:url var="mylink" value="mainController">
                            <c:param name="orderid" value="${ord.getOrderID()}"></c:param>
                            <c:param name="orderstatus" value="${ord.getStatus()}"></c:param>
                            <c:param name="action" value="updateStatusOrder"></c:param>
                        </c:url>
                        <a href="${mylink}">Cancel/Order again</a>
                </c:if></td>
                </tr>
            </c:forEach>
        </table>
        <footer>
            <c:import url="footer.jsp"/>
        </footer>
    </body>
</html>
