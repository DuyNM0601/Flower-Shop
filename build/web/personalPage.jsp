<%-- 
    Document   : personalPage
    Created on : Mar 2, 2023, 8:31:42 PM
    Author     : ASUS
--%>

<%@page import="mydao.AccountDao"%>
<%@page import="mybasicobject.Account"%>
<%@page import="mydao.OrderDao"%>
<%@page import="mybasicobject.Order"%>
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
            String email = (String) session.getAttribute("email");
            boolean login = false;
            Cookie[] c = request.getCookies();
            if (c != null) {
                if (name == null) {
                    String token = "";
                    for (Cookie aCookie : c) {
                        if (aCookie.getName().equals("selector")) {
                            token = aCookie.getValue();
                            Account acc = AccountDao.getAccount(token);
                            if (acc != null) {
                                name = acc.getFullname();
                                email = acc.getEmail();
                                login = true;
                            }
                        }
                    }
                }
            } else {
                login = true;
            }
            // show content if true
            if (login) {
        %> 
        <p><font color="red">you must login to view personal page</p>
        <p></p>
        <%} else {%>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>Welcome  <%= name%> come back</h3>
            <h3><a href="mainController?action=logout">Logout</a></h3>
        </section>
        <section>  <!-- load all orders of the user at here --> 
            <%
                ArrayList<Order> list = OrderDao.getOrders(email);
                String[] status = {"", "processing", "completed", "canceled"};
                ArrayList<Order> dateList = new ArrayList<>();
                String from = request.getParameter("from");
                String to = request.getParameter("to");
                if (request.getAttribute("searchbydate") != null) {
                    dateList = (ArrayList<Order>) request.getAttribute("searchbydate");
                }
                if (dateList.isEmpty() || dateList == null) {
                    if (from != null && to != null) {
            %>
            <p>We dont have any order from <%=from%> to <%=to%>   !</p>
            <% }
            } else {
            %>
            <p>From <%= from%> to <%= to%> orders we have:</p>
            <%for (Order ord : dateList) {
            %>
            <table class="order">
                <tr><td>Order ID</td><td>Order Date</td><td>Ship Date</td><td>Order's Status</td><td>action</td></tr>
                <tr>
                    <td><%= ord.getOrderID()%></td>
                    <td><%= ord.getOrderDate()%></td>
                    <td><%= ord.getShipDate()%></td>
                    <td><%= status[ord.getStatus()]%>
                        <br/><% if (ord.getStatus() == 3) {%>
                        <a href="mainController?action=orderagain&orderID=<%= ord.getOrderID()%>">Order again</a>
                        <% } %>
                        <br/><% if (ord.getStatus() == 1) {%>
                        <a href="mainController?action=cancelOrder&orderID=<%= ord.getOrderID()%>" >cancel order</a>
                        <% }%>
                    </td>
                    <td><a href="OrderDetail.jsp?orderid= <%= ord.getOrderID()%>">detail</a></td>
                </tr>
            </table>
            <%
                    }

                }
                if (list != null && !list.isEmpty()) {
            %>
            <p>All orders:</p>
            <%
                for (Order ord : list) {
            %>
            <table class="order">
                <tr><td>Order ID</td><td>Order Date</td><td>Ship Date</td><td>Order's status</td><td>action</td></tr>
                <tr><td><%=   ord.getOrderID()%></td>
                    <td><%=   ord.getOrderDate()%></td>
                    <td><%=   ord.getShipDate()%></td>
                    <td><%= status[ord.getStatus()]%>
                        <br/><% if (ord.getStatus() == 1) {%>
                        <a href="mainController?action=cancelOrder&orderID=<%= ord.getOrderID()%>" >Cancel order</a>
                        <% }%>
                        <br/><% if (ord.getStatus() == 3) {%>
                        <a href="mainController?action=orderagain&orderID=<%= ord.getOrderID()%>">Order again</a>
                        <% }%>
                    </td>
                    <td><a href="OrderDetail.jsp?orderID=<%= ord.getOrderID()%>">Detail</a></td>
                </tr>
            </table>        
            <%
                }
            } else {
            %>
            <p>You don't have any order</p>
            <%
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
