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
        <!--        <link href="../theme/css/bootstrap.min.css" rel="stylesheet">-->
        <link href="./theme/css/bootstrap-yeti.min.css" rel="stylesheet">
        <link href="./theme/css/main.css" rel="stylesheet">
        <!--        <link href="../theme/css/bootstrap-theme.min.css" rel="stylesheet">-->
        <script src="./theme/js/bootstrap.min.js"></script>

    </head>
    <body>

        <!-----Header this is repetive. I will later use tiles ------------>
        <div class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="./moviedetail.view">Moveez</a>
                </div>
                <div class="navbar-collapse collapse navbar-responsive-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="./moviedetail.view">Home</a>
                        </li>
                        <li>
                            <a href="./newmovie.view">Add New Movie</a>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left">
                        <input class="form-control col-lg-8" type="text" placeholder="Search By Movie Name">
                    </form>
                </div>
            </div>
        </div>

        <div class="container">
            <div id="banner" class="header-block">
                <div class="row">
                    <div class="col-lg-6">
                        <h1>Moveez</h1>
                        <p class="lead">Find Your Movie Details</p>
                    </div>
                </div>
            </div>
            <div style="clear:both"></div>
            <!-----------------------End of repetitive header------------------------------------------------>

            <div class="row">
                <!-------Div for movie details --------->
                <c:forEach var="movie" items="${movieList}">
                    <div class="col-lg-6" style="width:80%;">
                        <div class="well sponsor" style="overflow: auto;">
                            <span style="float: left; margin-right: 15px;">
                                <img width="175" height="180" src="./img/${movie.movie_img}">
                            </span>
                            <h4 style="margin-bottom: 0.4em;font-size: 25px;">${movie.movie_name} (${movie.movie_year})</h4>
                            <div class="clearfix">
                                <h6><strong>Description: </strong>${movie.movie_detail}</h6>
                                <h6><strong>Stars: </strong>${movie.actor}</h6>
                                <h6><strong>Director: </strong>${movie.director}</h6>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <!------End of div-------------------------->
            </div>
        </div>
    </body>
</html>
