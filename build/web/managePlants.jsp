<%-- 
    Document   : managePlants
    Created on : Mar 15, 2023, 8:40:36 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <input type="submit" value="searchPlant" name="action">
                </form>
                <h1></h1>
                <table class="order">
                    <tr><th> Plant ID</th>
                        <th> Plant name</th>
                        <th> Plant price</th>
                        <th> Plant img</th>
                        <th> Plant description</th>
                        <th> Plant status</th>
                        <th> Category id</th>
                        <th> Category name</th>
                        <th> Update status</th>
                    </tr>
                <c:forEach var="plant" items="${requestScope.plantList}" >
                    <tr><td><c:out value="${plant.getId()}"></c:out></td>
                        <td><c:out value="${plant.getName()}"></c:out></td>
                        <td><c:out value="${plant.getPrice()}"></c:out></td>
                        <td><img src="<c:out value="${plant.getImgpath()}"></c:out>" style="width: 100px; height: 100px" /></td>
                        <td><c:out value="${plant.getDescription()}"></c:out></td>
                        <td><c:choose>
                                <c:when test="${plant.getStatus() eq 1}">Available</c:when>
                                <c:otherwise>Not available</c:otherwise>
                            </c:choose>
                        </td>
                        <td><c:out value="${plant.getCateid()}"></c:out></td>
                        <td><c:out value="${plant.getCatename()}"></c:out></td>
                        <td>        <c:url var="mylink" value="mainController">
                                <c:param name="plantName" value="${plant.getName()}"></c:param>
                                <c:param name="status" value="${plant.getStatus()}"></c:param>
                                <c:param name="action" value="updateStatusPlant"></c:param>
                            </c:url>
                            <a href="${mylink}">Available/Not available</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </section>
            <footer>
            <c:import url="footer.jsp"/>
        </footer>
    </body>
</html>
