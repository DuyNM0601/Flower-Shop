<%-- 
    Document   : manageCategories
    Created on : Mar 16, 2023, 4:43:02 PM
    Author     : ASUS
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css"/>
    </head>
    <body>
        <header>
            <c:import url="header_loginedAdmin.jsp"></c:import>
        </header>
        <section>
        <form action="mainController" method="post">
            <input type="text" name="txtSearch">
            <input type="submit" value="searchCategory" name="action">
        </form>
        <h1></h1>
        <table class="order">
            <tr><th> Category ID</th>
                <th> Category Name</th>
            </tr>
        <c:forEach var="cate" items="${requestScope.categoriesList}" >
            <tr><td><c:out value="${cate.getCateId()}"></c:out></td>
                <td><c:out value="${cate.getCateName()}"></c:out></td>
            </tr>
        </c:forEach>
        </table>
        </section>
    </body>
</html>
