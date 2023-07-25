<%-- 
    Document   : OrderDetail
    Created on : Mar 3, 2023, 8:17:31 PM
    Author     : ASUS
--%>

<%@page import="mybasicobject.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mydao.OrderDao"%>
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
            <h3>Welcome  <%= name%> come back</h3>
            <h3><a href="mainController?action=logout">Logout</a></h3>
            <a href="personalPage.jsp">View all orders</a>
        </section>
        <section><!--load all orders of the user at here -->
            <%  String orderid = request.getParameter("orderID");
                if (orderid != null) {
                    int orderID = Integer.parseInt(orderid.trim());
                    ArrayList<OrderDetail> list = OrderDao.getOrderDetail(orderID);
                    if (list != null && !list.isEmpty()) {
                        int money = 0;
                        for (OrderDetail detail : list) {%>
            <table class="order">
                <tr><td>Order ID</td><td>Plant ID</td><td>Plant Name</td><td>Image</td><td>Price</td><td>Quantity</td></tr>
                <tr><td><%= detail.getOrderID()%></td><td><%= detail.getPlantID()%></td>
                    <td><%= detail.getPlantName()%></td>
                    <td><img src='<%= detail.getImgPath()%>' class='plantimg'/></td>
                    <td><%= detail.getPrice()%></td>
                    <td><%= detail.getQuantity()%></td>
                    <% money = money + detail.getPrice() * detail.getQuantity(); %>
                </tr>
            </table>
            <%                        }//end for%>
            <h3>  Total money: <%= money%></h3>
            <%                }//end if
            else {
            %>
            <p>You don't have any order</p>
            <%  }
                }//end if
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
