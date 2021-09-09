<%-- 
    Document   : index
    Created on : 29 Mar, 2021, 4:51:20 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.gson.Gson"%>
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
                        <li><a href="Cloud_Home.jsp" class="smoothScroll">Home</a></li>
                        <li><a href="Cloud_files.jsp" class="smoothScroll">Cloud Files</a></li>
                        <li><a href="User_details.jsp" class="smoothScroll">User Details</a></li>
                        <li><a href="downloaded_files1.jsp" class="smoothScroll">Downloaded Files</a></li>
                        <li class="active"><a href="graph.jsp" class="smoothScroll">Graph</a></li>
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
                        <center><h2>Analysis</h2></center>
                    </div>
                    <br><br>
                    <div class="col-md-12">
                        <%
                            String val1 = "", val2 = "", val3 = "";
                            String val11 = "", val22 = "", val33 = "";
                            int i = 0;

                            try {
                                Connection con = SQLconnection.getconnection();

                                Statement st1 = con.createStatement();
                                ResultSet rs2 = st1.executeQuery("SELECT  AVG(enc_time) FROM  data_files ");
                                rs2.next();
                                {
                                    val2 = rs2.getString("AVG(enc_time)");
                                }
                                rs2.close();
                                Statement st2 = con.createStatement();
                                ResultSet rs3 = st2.executeQuery("SELECT  AVG(decrypt_time) FROM  download ");
                                rs3.next();
                                {
                                    val3 = rs3.getString("AVG(decrypt_time)");
                                }
                                System.out.println("count------------------> " + val2);
                                System.out.println("count------------------> " + val3);

                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }

                        %>
                        <script type="text/javascript">
                            window.onload = function () {

                                var chart = new CanvasJS.Chart("chartContainer", {
                                    animationEnabled: true,
                                    exportEnabled: true,
                                    theme: "light2", // "light1", "light2", "dark1", "dark2"
                                    title: {
                                        text: ""
                                    },
                                    axisY: {
                                        title: "Time in MS"
                                    },
                                    data: [{
                                            type: "column",
                                            showInLegend: true,
                                            legendMarkerColor: "grey",
                                            legendText: "Entities",
                                            dataPoints: [
                                                {y: <%=val2%>, label: "Avg Encryption_Time in MS"},
                                                {y: <%=val3%>, label: "Avg Decryption_Time in MS"}

                                            ]
                                        }]
                                });
                                chart.render();
                            }
                        </script>
                        <div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
                    </div>
                </div>
        </section>
        <!-- SCRIPTS -->
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <!-- About us Skills Circle progress  -->
        <script>
                            // First circle
                            new Circlebar({
                                element: "#circle-1",
                                type: "progress",
                                maxValue: "90"
                            });

                            // Second circle
                            new Circlebar({
                                element: "#circle-2",
                                type: "progress",
                                maxValue: "84"
                            });

                            // Third circle
                            new Circlebar({
                                element: "#circle-3",
                                type: "progress",
                                maxValue: "60"
                            });

                            // Fourth circle
                            new Circlebar({
                                element: "#circle-4",
                                type: "progress",
                                maxValue: "74"
                            });

        </script>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/smoothscroll.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
