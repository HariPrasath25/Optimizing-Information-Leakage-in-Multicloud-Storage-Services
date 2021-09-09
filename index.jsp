<%-- 
    Document   : index
    Created on : 29 Mar, 2021, 4:51:20 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <li class="active"><a href="index.jsp" class="smoothScroll">Home</a></li>
                        <li><a href="User_login.jsp" class="smoothScroll">User</a></li>
                        <li><a href="Cloud_login.jsp" class="smoothScroll">Cloud</a></li>
                        <li><a href="MetaServer_login.jsp" class="smoothScroll">Meta Data Server</a></li>
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
                        <center><h2>ABSTRACT</h2></center>
                    </div>
                    <br><br>
                    <div class="col-md-12">
                        <p align="justify" style="font-size: 20px;color: black;"> 
                            Many schemes have been recently advanced for storing data on multiple clouds. Distributing data over different cloud storage providers
                            (CSPs) automatically provides users with a certain degree of information leakage control, for no single point of attack can leak all the information.
                            However, unplanned distribution of data chunks can lead to high information disclosure even while using multiple clouds. In this paper, we study an
                            important information leakage problem caused by unplanned data distribution in multicloud storage services. Then, we present StoreSim, an information
                            leakage aware storage system in multicloud. StoreSim aims to store syntactically similar data on the same cloud, thus minimizing the user’s information
                            leakage across multiple clouds. We design an approximate algorithm to efficiently generate similarity-preserving signatures for data chunks based on
                            MinHash and Bloom filter, and also design a function to compute the information leakage based on these signatures. Next, we present an effective storage
                            plan generation algorithm based on clustering for distributing data chunks with minimal information leakage across multiple clouds. Finally, we evaluate
                            our scheme using two real datasets from Wikipedia and GitHub. We show that our scheme can reduce the information leakage by up to 60% compared to
                            unplanned placement. Furthermore, our analysis on system attackability demonstrates that our scheme makes attacks on information more complex.
                        </p>
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
