<%-- 
    Document   : index
    Created on : 29 Mar, 2021, 4:51:20 PM
    Author     : JAVA-JP
--%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="Multicloud_Storage.Encryption"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="Multicloud_Storage.SplitFile"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%

    final String filepath = "D:/";
    String f1, f2, f3;

    try {
        MultipartRequest m = new MultipartRequest(request, filepath);
        String filekeyword = m.getParameter("keyword");
        File file = m.getFile("fileToUpload");
        String filename = file.getName().toLowerCase();
        session.setAttribute("filename", filename);
        session.setAttribute("filepath", filepath);

        Connection con = SQLconnection.getconnection();
        Statement st = con.createStatement();

        ResultSet rs = st.executeQuery("Select * from data_files where filekeyword ='" + filekeyword + "'");
        if (rs.next()) {

            response.sendRedirect("Upload_file.jsp?msg=FileKeyword_Already_Exists");
        }

        BufferedReader br = new BufferedReader(new FileReader(filepath + filename));
        StringBuffer sb = new StringBuffer();
        String temp;

        while ((temp = br.readLine()) != null) {
            sb.append(temp);
            sb.append("\n");
        }

        session.setAttribute("filecontent", sb.toString());
        KeyGenerator Attrib_key = KeyGenerator.getInstance("AES");
        Attrib_key.init(128);
        SecretKey secretKey = Attrib_key.generateKey();
        System.out.println("++++++++ key:" + secretKey);
        session.setAttribute("secretKey", secretKey);

        Encryption e = new Encryption();
        String encryptedtext = e.encrypt(sb.toString(), secretKey);
        session.setAttribute("EncryptText", encryptedtext);
        byte[] b = secretKey.getEncoded();
        String Dkey = Base64.encode(b);
        System.out.println("converted secretkey to string: " + Dkey);
        session.setAttribute("Dkey", Dkey);

        SplitFile splitFile = new SplitFile();
        splitFile.split(filepath + "\\" + filename);
        f1 = filepath + "\\" + filename + "1";
        f2 = filepath + "\\" + filename + "2";
        f3 = filepath + "\\" + filename + "3";

        BufferedReader br1 = new BufferedReader(new FileReader(f1));
        BufferedReader br2 = new BufferedReader(new FileReader(f2));
        BufferedReader br3 = new BufferedReader(new FileReader(f3));

        StringBuffer sb1 = new StringBuffer();
        StringBuffer sb2 = new StringBuffer();
        StringBuffer sb3 = new StringBuffer();
        String temp1 = null;
        String temp2 = null;
        String temp3 = null;

        while ((temp1 = br1.readLine()) != null) {
            sb1.append(temp1);
            sb1.append("\n");
        }
        while ((temp2 = br2.readLine()) != null) {
            sb2.append(temp2);
            sb2.append("\n");
        }
        while ((temp3 = br3.readLine()) != null) {
            sb3.append(temp3);
            sb3.append("\n");
        }
        System.out.println("\n Block 1 : " + sb1.toString());
        System.out.println("\n Block 2 : " + sb2.toString());
        System.out.println("\n Block 3 : " + sb3.toString());

        session.setAttribute("ori_block1", sb1.toString());
        session.setAttribute("ori_block2", sb2.toString());
        session.setAttribute("ori_block3", sb3.toString());

        String encryptedtext1 = e.encrypt(sb1.toString(), secretKey);
        String encryptedtext2 = e.encrypt(sb2.toString(), secretKey);
        String encryptedtext3 = e.encrypt(sb3.toString(), secretKey);

%>
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
                        <li><a href="User_Home.jsp" class="smoothScroll">Home</a></li>
                        <li class="active"><a href="Upload_file.jsp" class="smoothScroll">Upload File</a></li>
                        <li><a href="My_files.jsp" class="smoothScroll">My Files</a></li>
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
                        <center><h2>Upload File</h2></center>
                    </div>
                    <br><br>
                    <div class="col-md-4">
                        <div class="contact-image">
                            <br><br><br><br><br>
                            <img src="images/upload.png" class="img-responsive">
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-12">
                        <form id="contact-form" role="form" action="upload" method="post" enctype="multipart/form-data">
                            <div class="col-md-12 ">
                                <div class="form-group">
                                    <input type="hidden" name="keyword" value="<%=filekeyword%>" readonly="">
                                    <label>File Name :</label><br>
                                    <input type="text" style="width: 300px;" name="filename" value="<%=filename%>" readonly=""><br><br><br>
                                    <label>Block 1 :</label><br>
                                    <textarea name="block1" readonly=""  style="width: 400px; height: 120px; resize: none;"><%=encryptedtext1%></textarea><br><br>
                                    <label>Block 2 :</label><br>
                                    <textarea name="block2" readonly=""  style="width: 400px; height: 120px; resize: none;"><%=encryptedtext2%></textarea><br><br>
                                    <label>Block 3 :</label><br>
                                    <textarea name="block3" readonly=""  style="width: 400px; height: 120px; resize: none;"><%=encryptedtext3%></textarea><br><br>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <button type="submit" class="btn-primary btn-lg">Upload</button>
                                </div>
                            </div>
                            <div class="col-md-1 "></div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <%   } catch (Exception e) {
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
