<%-- 
    Document   : moviedetail
    Created on : Mar 10, 2014, 8:13:34 PM
    Author     : nishit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Details</title>
        <style>
            table{
                margin: 0 auto;
            }
            table td{
                width:200px;
                border :1px solid #999999;
            }
            .message{
                width:300px;
                margin:0 auto;
                background-color: #66ff66;
                text-align: center;
                padding:5px;
            }
        </style>
    </head>
    <body>
        <c:if test="${not empty msg }">
            <div class="message">
                <span class="message-text">${msg }</a>
            </div>
        </c:if>  
        <table>
            <tr>
                <td>
                    <a href="./newmovie.view">Add new movie</a>
                </td>
            </tr>
        </table>
        <table>
            <c:forEach var="movie" varStatus="status" items="${movieList}">
                <tr>
                    <td>
                        ${status.count}
                    </td>
                    <td>
                        Movie Name:
                    </td>
                    <td>
                        ${movie.movie_name}
                    </td>
                    <td>
                        <a href="./details.view?id=${movie.movie_id}">see full details</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
