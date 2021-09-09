/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Multicloud_Storage;

/**
 *
 * @author JAVA-JP
 */
import DBconnection.SQLconnection;
import static com.sun.org.apache.xerces.internal.xinclude.XIncludeHandler.BUFFER_SIZE;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author java1
 */
/**
 *
 * @author Lenovo
 */
public class Download extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String fileid = request.getParameter("fid");
            System.out.println("Fileid===" + fileid);

            HttpSession user = request.getSession();
            String uid = user.getAttribute("uid").toString();
            String uname = user.getAttribute("uname").toString();
            String umail = user.getAttribute("umail").toString();

            Connection conn = SQLconnection.getconnection();
            Statement st = conn.createStatement();
            Statement st1 = conn.createStatement();
            Statement st2 = conn.createStatement();

            ResultSet rs1 = st.executeQuery(" Select * from data_files where id ='" + fileid + "' ");
            if (rs1.next()) {
                
                String filename = rs1.getString("filename");
                String doid = rs1.getString("uid");
                String doname = rs1.getString("uname");
                String file = rs1.getString("enc_data");
                String dkey = rs1.getString("dkey");
                
                String ori_block1 = rs1.getString("ori_block1");
                String ori_block2 = rs1.getString("ori_block2");
                String ori_block3 = rs1.getString("ori_block3");

                long aTime = System.nanoTime();
                Decryption d1 = new Decryption();
                String decrypted = d1.decrypt(file, dkey);
                long bTime = System.nanoTime();
                float decryptTime = (bTime - aTime) / 1000;

                System.out.print("\nPlain Text             --------  " + file);
                System.out.print("\nDecrypted Text             --------  " + decrypted);
                System.out.println("Time taken to Decrypt File: " + decryptTime + " microseconds.");
                System.out.println("filename,fileid==" + filename + fileid);

                String is = ori_block1+ori_block2+ori_block3;

                response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
                out.write(is);
                out.close();
                int i = st1.executeUpdate("insert into download (uid, uname, filename, time , fileid, decrypt_time)values('" + uid + "','" + uname + "','" + filename + "',now(),'" + fileid + "','" + decryptTime + "')");

                if (i != 0) {
                    System.out.println("Download success...");
                } else {
                    System.out.println("error  while updating information...");
                }
            } else {
                System.out.println("file not found...");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            response.sendRedirect("Download_files.jsp?download_failed");
        } catch (IOException ex) {
            ex.printStackTrace();
            response.sendRedirect("Download_files.jsp?download_failed");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
