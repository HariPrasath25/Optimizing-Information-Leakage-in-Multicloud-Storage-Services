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
                        <li><a href="index.jsp" class="smoothScroll">Home</a></li>
                        <li class="active"><a href="User_login.jsp" class="smoothScroll">User</a></li>
                        <li><a href="Cloud_loginjsp" class="smoothScroll">Cloud</a></li>
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
                    <div class="col-md-6 col-sm-12">
                        <div class="contact-image">
                            <br><br>
                            <img src="images/reg.jpg" class="img-responsive" alt="Smiling Two Girls">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <form id="contact-form" role="form" action="user_reg" method="post">
                            <div class="section-title">
                                <h2>User Register</h2>
                            </div>
                            <div class="col-md-12 ">
                                <div class="form-group">
                                    <label>Name :</label><br>
                                    <input type="text" placeholder="Enter Your Name" style="width: 350px;" name="username" required=""><br><br>
                                    <label>Email :</label><br>
                                    <input type="email" placeholder="Enter Your Email" style="width: 350px;" name="email" required=""><br><br>
                                    <label>DOB :</label><br>
                                    <input type="date" style="width: 350px;" name="dob" required=""><br><br>
                                    <label>Gender :</label><br>
                                    <select placeholder="Enter Your Email" style="width: 350px; height: 50px;" name="gender" required="">
                                        <option value="">Select Your Gender</option>
                                        <option>Male</option>
                                        <option>Femaile</option>
                                        <option>Others</option>
                                    </select><br><br>
                                    <label>Phone :</label><br>
                                    <input type="text" placeholder="Enter Your Phone No" style="width: 350px;" name="phone" required=""><br><br>
                                    <label>Address :</label><br>
                                    <input type="text" placeholder="Enter Your Address" style="width: 350px;" name="address" required=""><br><br>
                                    <label>Password :</label><br>
                                    <input type="password" placeholder="Enter Your Password" style="width: 350px;" name="pass" required=""><br><br>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12">
                                <button type="submit" class="btn-success btn-lg">Sign Up</button>
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
