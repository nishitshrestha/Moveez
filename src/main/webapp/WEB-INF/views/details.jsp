<%-- 
    Document   : details
    Created on : Mar 10, 2014, 10:58:03 PM
    Author     : nishit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .detail{
                margin: 0 auto;
            }
            .detail td{
                width: 300px;
                border:1px solid #999999
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
        <table class="detail">
            <tr>
                <td>
                    Movie Name:
                </td>
                <td>
                    ${movie.movie_name}
                </td>
            </tr>
            <tr>
                <td>
                    Actor Name:
                </td>
                <td>
                    ${movie.actor}
                </td>
            </tr>
            <tr>
                <td>
                    Actress Name:
                </td>
                <td>
                    ${movie.actress}
                </td>
            </tr>
            <tr>
                <td>
                    Director:
                </td>
                <td>
                    ${movie.director}
                </td>
            </tr>
        </table>
        <div style="margin:0 auto;width:500px;">
            <table>
                <tr>
                    <td style="padding:10px;">
                        <a href="./moviedetail.view">Go back to movie details</a>
                    </td>
                    <td style="padding:10px;">
                        <a href="./editmovie.view?id=${movie.movie_id}">Edit this detail</a>
                    </td>
                    <td style="padding:10px;">
                        <a href="./delete.do?id=${movie.movie_id}">Delete this record</a>
                    </td>
                </tr>
            </table>

        </div>
    </body>
</html>
