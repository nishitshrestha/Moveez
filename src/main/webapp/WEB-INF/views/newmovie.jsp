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
                    <a class="navbar-brand" href="../">Moveez</a>
                </div>
                <div class="navbar-collapse collapse navbar-responsive-collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="./moviedetail.view">Home</a>
                        </li>
                        <li class="active">
                            <a href="#">Add New Movie</a>
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
                <div class="col-lg-6 width-increased-60">
                    <div class="well bs-component">
                        <form:form class="form-horizontal" method="POST" action="insertMovie.do" modelAttribute="newMovie" enctype="multipart/form-data">
                            <fieldset>
                                <legend>Add Movie</legend>
                                <div class="form-group">
                                    <label class="col-lg-2 control-label" for="inputMovieName">Movie Name</label>
                                    <div class="col-lg-10">                                      
                                        <form:input path="movie_name" id="inputMovieName" class="form-control" placeholder="Movie Name"/>
                                        <!--                                        <label class="control-label" for="inputMovieName"></label>-->
                                        <label class="control-label" for="inputMovieName"><form:errors path="movie_name"/></label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-2 control-label" for="inputStarsName">Stars</label>
                                    <div class="col-lg-10">                         
                                        <form:input path="actor" id="inputStarsName" class="form-control" placeholder="Stars"/>
                                        <label class="control-label" for="inputMovieName"><form:errors path="actor"/></label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-2 control-label" for="inputDirectorName">Director</label>
                                    <div class="col-lg-10">                        
                                        <form:input path="director" id="inputDirectorName" class="form-control" type="text" placeholder="Director"/>
                                        <label class="control-label" for="inputMovieName"><form:errors path="director"/></label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-2 control-label" for="inputDescription">Description</label>
                                    <div class="col-lg-10">                             
                                        <form:input path="movie_detail" id="inputDescription" class="form-control" type="text" placeholder="Brief Detail"/>
                                        <label class="control-label" for="inputMovieName"><form:errors path="movie_detail"/></label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-2 control-label" for="inputReleasedYear">Released Year</label>
                                    <div class="col-lg-10">      
                                        <form:input path="movie_year" id="inputYear" class="form-control" type="text" placeholder="Released Year"/>
                                        <form:errors path="movie_year" class="control-label" for="inputMovieName"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-2 control-label" for="inputImage">Image</label>
                                    <div class="col-lg-10">                                
                                        <input id="fileInput" name="image" type="file"/>
                                        <label class="control-label" for="inputImage">${fileError}</label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-10 col-lg-offset-2">
                                        <input type="reset" class="btn btn-default"/>
                                        <input class="btn btn-primary" type="submit" value="Save"/>
                                    </div>
                                </div>

                            </fieldset>
                        </form:form>
                    </div>
                </div>
            </div>
    </body>
</html>
