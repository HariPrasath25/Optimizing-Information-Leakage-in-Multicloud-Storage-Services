<%-- 
    Document   : index
    Created on : 29 Mar, 2021, 4:51:20 PM
    Author     : JAVA-JP
--%>

<%@page import="Multicloud_Storage.Decryption"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
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
    <style>

        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            font-size: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td, #customers th {
            border: 2px solid black;
            align:"center";  cellpadding:"0"; cellspacing:"2";
            padding: 15px;
        }


        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #009999;
            color: white;
        }
    </style>
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

        <%
            String fid = request.getParameter("fid");
            String dkey = request.getParameter("dkey");
            String block = request.getParameter("block");

            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();
            try {
                ResultSet rs = st.executeQuery("SELECT * FROM data_files WHERE id = '" + fid + "' AND dkey = '" + dkey + "' ");
                if (rs.next()) {
                    String block1 = rs.getString(block);
                    Decryption d = new Decryption();
                    String dblock = d.decrypt(block1, dkey);


        %>
        <section id="about">
            <div class="container">
                <div class="row">
                    <div class="about-info">
                        <center><h2>Update File</h2></center>
                    </div>
                    <br><br>
                    <div class="col-md-5">
                        <div class="contact-image">
                            <img src="images/update.jpg" width="400" height="400">
                        </div>
                    </div> 
                    <div class="col-md-7 col-sm-12">
                        <form action="update_file.jsp" method="post">
                            <div class="col-md-7">
                                <div class="form-group">
                                    <input type="hidden" name="fid" value="<%=rs.getString("id")%>" readonly="">
                                    <input type="hidden" name="block" value="<%=block%>" readonly="">
                                    <label>File Name :</label><br>
                                    <input type="text" style="width: 400px; height: 50px;" name="filename" value="<%=rs.getString("filename")%>" readonly=""><br><br><br>
                                    <label><%=block%> :</label><br>
                                    <textarea name="ublock"  style="width: 400px; height: 120px; resize: none;"><%=dblock%></textarea><br><br>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn-primary btn-lg">Update</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <%   } else {
                    response.sendRedirect("My_files.jsp?Incorrect_key_values");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <!-- SCRIPTS -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/smoothscroll.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
