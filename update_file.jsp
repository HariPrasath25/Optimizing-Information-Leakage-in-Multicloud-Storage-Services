<%-- 
    Document   : update_file1
    Created on : 27 Jan, 2021, 6:34:51 PM
    Author     : JAVA-JP
--%>

<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="javax.el.ELException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String fid = request.getParameter("fid");
    String fname = request.getParameter("filename");
    String ublock = request.getParameter("ublock");
    String block = request.getParameter("block");

    String temp = null;
    if (block == "block1") {
        temp = "mod_hash1";
    } else if (block == "block2") {
        temp = "mod_hash2";
    } else {
        temp = "mod_hash3";
    }
    System.out.println(block);
    System.out.println(temp);
    System.out.println("print value :");
    Connection conn = SQLconnection.getconnection();
    Statement st = conn.createStatement();
    DateFormat dateFormat = new SimpleDateFormat("YYYY/MM/dd HH:mm:ss");
    Date date = new Date();
    String time = dateFormat.format(date);

    String letters = "0123457896";
    String hc1 = "";
    Random RANDOM = new SecureRandom();
    int PASSWORD_LENGTH = 9;
    for (int i = 0; i < PASSWORD_LENGTH; i++) {

        int index = (int) (RANDOM.nextDouble() * letters.length());

        hc1 += letters.substring(index, index + 1);

    }

    try {
        int i = st.executeUpdate("update data_files set  " + temp + " = '" + hc1 + "', ori_"+ block +" = '"+ ublock +"', status ='Updated' WHERE id='" + fid + "'");
        if (i != 0) {
            System.out.println("success");
            response.sendRedirect("My_files.jsp?file_updated");
        } else {
            System.out.println("failed");
            response.sendRedirect("My_files.jsp?failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>

