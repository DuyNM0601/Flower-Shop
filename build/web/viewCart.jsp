<%-- 
    Document   : viewCart
    Created on : Mar 8, 2023, 8:37:24 AM
    Author     : ASUS
--%>

<%@page import="mydao.PlantDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>
            <%
                String name = (String) session.getAttribute("name");
                if (name != null) {
            %>
            <h3>Welcome <%= session.getAttribute("name")%> come back</h3>
            <h3><a href="mainController?action=logout">Logout</a></h3>
            <h3><a href="personalPage.jsp">Personal page</a></h3>
            <%
                }
            %>
            <font style='color:red'><%= (request.getAttribute("WARNING") == null) ? "" : (String)request.getAttribute("WARNING") %> </font>
            <table width="100%" class="shopping">
                <tr><td>Product id</td><td>Quantity</td><td>Action</td></tr>

                <%
                    HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
                    int total = 0;
                    if (cart != null) {
                        Set<String> pids = cart.keySet();
                        for (String pid : pids) {
                            int quantity = cart.get(pid);
                %>
                <form action="mainController" method="post">
                    <tr><td><input type="hidden" value="<%= pid%>" name="pid"><a href="mainController?action=showPlant&pid=<%= pid%>"><%= pid%></a></td>
                        <td><input type="number" value="<%= quantity%>" name="quantity"></td>
                        <td><img src="<%= PlantDao.getPlant(Integer.parseInt(pid)).getImgpath() %>" style="width: 200px; height: 200px"></td>
                        <td><%= PlantDao.getPlant(Integer.parseInt(pid)).getPrice() %></td>
                        <%= total=total + PlantDao.getPlant(Integer.parseInt(pid)).getPrice()*quantity %>
                        <td><input type="submit" value="update" name="action">
                            <input type="submit" value="delete" name="action"></td>
                    </tr>
                </form>  
                <%                }
                } else {
                %>
                <tr><td>Your cart is empty</td></tr>
                <%  }
                %>
                <tr><td>Total money: <%= total %></td></tr>
                <tr><td>Order Date: <%= (new Date()).toString()%></td></tr>
                <tr><td>Ship Date: N/A </td></tr>
            </table>
        </section>
        <section>
            <form action="mainController" method="post">
                <input type="submit" value="saveOrder" name="action" class="submitorder">
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
