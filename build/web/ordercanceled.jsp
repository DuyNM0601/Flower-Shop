<%-- 
    Document   : ordercanceled
    Created on : Mar 4, 2023, 7:40:26 PM
    Author     : ASUS
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <%
            String name = (String) session.getAttribute("name");
            if (name == null) {

        %>        
        <p><font color="red">You must login to view personal page</font></p>
        <p></p>
        <%  } else {
        %>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>Canceled Order</h3>
            <h3><a href="mainController?action=logout">Logout</a></h3>
        </section>
        <section> <!-- load all completed orders at here -->
            <%
                String email = (String) session.getAttribute("email");
                ArrayList<Order> list = OrderDao.getOrders(email);
                String status = "canceled";
                if (list != null && !list.isEmpty()) {
                    for (Order ord : list) {
                        if (ord.getStatus() == 3) {
            %>
            <table class="order">
                <tr><td>Order ID</td><td>Order Date</td><td>Ship Date</td><td>Order's status</td><td>action</td></tr>
                <tr><td><%=   ord.getOrderID()%></td>
                    <td><%=   ord.getOrderDate()%></td>
                    <td><%=   ord.getShipDate()%></td>
                    <td><%= status%>
                    </td>
                    <td><a href="OrderDetail.jsp?orderID=<%= ord.getOrderID()%>">Detail</a></td>
                    <td><a href="mainController?action=orderagain&orderID=<%=   ord.getOrderID()%>">Order again</a></td>
                </tr>
            </table>        
            <%
                    }
                }
            } 
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <%
                
            }
        %>
    </body>
</html>
