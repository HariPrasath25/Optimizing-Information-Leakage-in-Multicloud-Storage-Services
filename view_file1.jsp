<%-- 
    Document   : index
    Created on : 29 Mar, 2021, 4:51:20 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>

        <title>Optimizing Information Leakage</title>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <!-- MAIN CSS -->
        <link rel="stylesheet" href="css/templatemo-style.css"
    </head>
    <body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

        <!-- PRE LOADER -->
        <section class="preloader">
            <div class="spinner">
                <span class="spinner-rotate"></span>
            </div>
        </section>
        <!-- MENU -->
        <section class="navbar custom-navbar navbar-fixed-top" role="navigation">
            <div class="container">

                <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                    </button>

                    <!-- lOGO TEXT HERE -->
                    <a class="navbar-brand">Multicloud Storage</a>
                </div>
                <!-- MENU LINKS -->
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="User_Home.jsp" class="smoothScroll">Home</a></li>
                        <li><a href="Upload_file.jsp" class="smoothScroll">Upload File</a></li>
                        <li class="active"><a href="My_files.jsp" class="smoothScroll">My Files</a></li>
                        <li><a href="Download_files.jsp" class="smoothScroll">Download File</a></li>
                        <li><a href="view_downloads.jsp" class="smoothScroll">View Downloads</a></li>
                        <li><a href="index.jsp" class="smoothScroll">Logout</a></li>
                    </ul>
                </div>

            </div>
        </section>
        <section id="home">
            <div class="row">
                <div class="owl-carousel owl-theme home-slider">
                    <div class="item item-first">
                        <div class="caption">
                            <div class="container">
                                <div class="col-md-12">
                                    <center><h1>Optimizing Information Leakage in Multicloud
                                            Storage Services</h1></center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="about">
            <div class="container">
                <div class="row">
                    <div class="about-info">
                        <center><h2>Decrypt File</h2></center>
                    </div>
                    <br><br>
                    <div class="col-md-6 col-sm-12">
                        <div class="contact-image">
                            <br><br>
                            <img src="images/req.png" class="img-responsive">
                        </div>
                    </div>
                    <%
                        String fid = request.getParameter("fid");
                    %>
                    <div class="col-md-6 col-sm-12">
                        <form id="contact-form" role="form" action="view_file2.jsp" method="post">
                            <div class="col-md-12 ">
                                <div class="form-group">
                                    <input type="hidden" name="fid" value="<%=fid%>" readonly="">
                                    <label>File Block :</label><br>
                                    <select style="width: 300px; height: 50px;" name="block" required="">
                                        <option value="">Select File Block</option>
                                        <option>block1</option>
                                        <option>block2</option>
                                        <option>block3</option>
                                    </select><br><br>
                                    <label>Decryption Key :</label><br>
                                    <input type="text" placeholder="Enter Decryption key" style="width: 300px;" name="dkey" required="" autocomplete="off"><br><br>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12">
                                <button type="submit" class="btn-success btn-lg">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- SCRIPTS -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/smoothscroll.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
