<%-- 
    Document   : index
    Created on : Mar 2, 2023, 7:45:05 PM
    Author     : ASUS
--%>

<%@page import="mydao.PlantDao"%>
<%@page import="mybasicobject.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pretty Meadow</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>
            <%
            String keyword = request.getParameter("txtsearch");
            String searchby = request.getParameter("searchby");
            ArrayList<Plant> list;
            String [] tmp = {"out of stock","availble"};
            if (keyword == null && searchby == null) //when the page is loaded, all products will be displayed
                list = PlantDao.getPlants("", "");
            else
                list = PlantDao.getPlants(keyword, searchby);//only get products by name/category
            if (list!=null && !list.isEmpty()) {
                    for (Plant p : list) { %>
                    <table class="product" style="border: 1px solid black; text-align: center">
                        <tr>
                            <td><img src='<%= p.getImgpath() %>' class='plantimg'/></td>
                            <td>Product ID: <%= p.getId() %></td>
                            <td>Product name: <%= p.getName() %></td>
                            <td>Price: <%= p.getPrice() %></td>
                            <td>Status: <%= tmp[p.getStatus()] %></td>
                            <td>Category: <%= p.getCatename() %></td>
                            <td><a href="mainController?action=addtocart&pid=<%= p.getId() %>" style="box-shadow: 1px 1px 1px 1px gray; border-radius: 2px">Add to cart</a></td>
                        </tr>
                    </table>
            <%            }
                }
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
