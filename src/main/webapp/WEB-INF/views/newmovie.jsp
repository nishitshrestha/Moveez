<%-- 
    Document   : newjsp
    Created on : Mar 12, 2014, 9:51:36 PM
    Author     : nishit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Movie Detail</title>
        <style>
            .detail{
                margin: 0 auto;
            }
            .detail td{
                width: 300px;
                border:1px solid #999999
            }
            .detail td input{
                width:300px;
            }
            .message{
                width:300px;
                margin:0 auto;
                background-color: #66ff66;
                text-align: center;
                padding:5px;
            }
            .errors{
                color:#ff3333
            }
        </style>
    </head>
    <body>
        <c:if test="${not empty msg }">
            <div class="message">
                <span class="message-text">${msg }</a>
            </div>
        </c:if>  
        <form:form method="POST" action="insertMovie.do" modelAttribute="newMovie">
            <table class="detail">
                <tr>
                    <td>
                        Movie Name:
                    </td>
                    <td>
                        <form:input path="movie_name"/>
                        <span class="errors">
                            <form:errors path="movie_name"/>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        Actor Name:
                    </td>
                    <td>
                        <form:input path="actor"/>
                        <span class="errors">
                            <form:errors path="actor"/>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        Actress Name:
                    </td>
                    <td>
                        <form:input path="actress"/>
                        <span class="errors">
                            <form:errors path="actress"/>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        Director Name:
                    </td>
                    <td>
                        <form:input path="director"/>
                        <span class="errors">
                            <form:errors path="director"/>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Save"/>
                    </td>
                </tr>
            </table>
        </form:form>
        <table>
            <tr>
                <td>
                    <a href="./moviedetail.view">Go back to movie detail</a>
                </td>
            </tr>
        </table>

    </body>
</html>
