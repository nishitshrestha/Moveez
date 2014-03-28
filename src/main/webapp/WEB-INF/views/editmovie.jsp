<%-- 
    Document   : editmovie
    Created on : Mar 15, 2014, 8:24:23 AM
    Author     : nishit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Movie Details</title>
    </head>
    <body>
        <form:form action="./editmovie.do" modelAttribute="movie">
            <table>
                <tr>
                    <td>
                        Movie Name:
                    </td>
                    <td>
                        <form:hidden path="movie_id"/>
                        <form:input path="movie_name"/>
                        <span class="errors"><form:errors path="movie_name"/></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        Actor Name:
                    </td>
                    <td>
                        <form:input path="actor"/>
                        <span class="errors"><form:errors path="actor"/></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        Actress Name:
                    </td>
                    <td>
                        <form:input path="actress"/>
                        <span class="errors"><form:errors path="actress"/></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        Director Name:
                    </td>
                    <td>
                        <form:input path="director"/>
                        <span class="errors"><form:errors path="director"/></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Edit"/>
                    </td>
                </tr>
            </table>
        </form:form>
    </body>
</html>
