<%-- 
    Document   : viewPlant
    Created on : Mar 13, 2023, 7:38:58 PM
    Author     : ASUS
--%>

<%@page import="mybasicobject.Plant"%>
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
        <!--<%
                Plant p = (Plant) session.getAttribute("plant");
                String[] tmp = {"out of stock", "available"};
                if (p != null) {
            %>
            <table class="product">
                <tr><td></td><td>Product id</td><td>Product name</td><td>Price</td><td>Status</td>Category</tr>
                <tr><td><img src="<%= p.getImgpath()%>" class="plantimg"/></td>
                    <td><%= p.getId()%></td>
                    <td><%= p.getName()%></td>
                    <td><%= p.getPrice()%></td>
                    <td><%= tmp[p.getStatus()]%></td>
                    <td><%= p.getCatename()%></td>
                </tr>
            </table>
            <%
                }
            %>-->
        <jsp:useBean id="plantObj" class="mybasicobject.Plant" scope="request" />
        <!--<table>
            <tr><td rowspan="8"><img src="<jsp:getProperty name="plantObj" property="imgpath"></jsp:getProperty>"</td></tr>
            <tr><td>id:<jsp:getProperty name="plantObj" property="id"></jsp:getProperty></td></tr>
            <tr><td>Product name:<jsp:getProperty name="plantObj" property="name"></jsp:getProperty></td></tr>
            <tr><td>Price:<jsp:getProperty name="plantObj" property="price"></jsp:getProperty></td></tr>
            <tr><td>Description:<jsp:getProperty name="plantObj" property="description"></jsp:getProperty></td></tr>
            <tr><td>Status:<jsp:getProperty name="plantObj" property="status"></jsp:getProperty></td></tr>
            <tr><td>Cate id:<jsp:getProperty name="plantObj" property="cateid"></jsp:getProperty></td></tr>
            <tr><td>Category:<jsp:getProperty name="plantObj" property="catename"></jsp:getProperty></td></tr>
            </table>-->

            <!--su dung EL-->
            <table>
                <tr><td rowspan="8"><img src="${plantObj.imgpath}" style="width: 200px; height: 200px"></td></tr>
            <tr><td>id:${plantObj.id}</td></tr>
            <tr><td>product name:${plantObj.name}</td></tr>
            <tr><td>price:${plantObj.price}</td></tr>
            <tr><td>description:${plantObj.description}</td></tr>
            <tr><td>status:${plantObj.status}</td></tr>
            <tr><td>cate id:${plantObj.cateid}</td></tr>
            <tr><td>category:${plantObj.catename}</td></tr>
        </table>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
