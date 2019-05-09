/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author KiroHikaru
 */
@WebServlet(urlPatterns = {"/MySQLTest"})
public class MySQLTest extends HttpServlet {
    static String queryFile = "F:\\Learning\\Database 2019\\Project\\Laptop-Store\\LaptopStore\\src\\main\\java\\SQL File\\Show Laptop Specification.sql";
    static String queryString2 = "SELECT * FROM gpu";
    
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
        PrintWriter out = response.getWriter();
 
        /* TODO output your page here. You may use following sample code. */
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("   <head>");
        out.println("       <title>Laptop CPU</title>");            
        out.println("   </head>");
        out.println("   <body>");
        //out.println("       <h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
        out.println("       <h1 align=\"center\">List of Products</h1>");   
        showLaptop(request, response);
        out.println("   </body>");
        out.println("</html>");
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

    public static void showLaptop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        try{      
            Class.forName("com.mysql.cj.jdbc.Driver");  
            Connection con = DriverManager.getConnection(  
                    "jdbc:mysql://localhost:3306/laptop_store","root","tomnisa123");  	    

            Statement statement = con.createStatement();  
            
            System.out.println("Executing SQL...");
            
            ResultSet rs = statement.executeQuery(readUsingScanner(queryFile));  
            ResultSetMetaData rsmd = rs.getMetaData();
            
//            String laptopModel = rs.getString(2);
//            String cpu = rs.getString(3);
//            String ram = rs.getString(4);
//            String gpu = rs.getString(5);
//            String hdd = rs.getString(6);
//            String ssd = rs.getString(7);
//            String display = rs.getString(8);
//            String battery = rs.getString(9);
//            String os = rs.getString(10);

            int colCount = rsmd.getColumnCount();
            
            out.println("<table cellspacing=\"10\" align=\"center\" border=\"0\">");
            
            //Print column name
            out.println("<tr>");
            out.println("   <th style=\"background-color: #F2F2F2; \">Image</th>");            
            out.println("   <th style=\"background-color: #F2F2F2; \">Laptop</th>"); 
            out.println("   <th style=\"background-color: #F2F2F2; \">Price</th>");  
            out.println("   <th></th>");
            out.println("</tr>");
            
            
            
            while(rs.next()) {
                out.println("<tr>");        
                out.println("   <td><img src=\"file:///F:/Learning/Database%202019/Project/Laptop-Store/LaptopStore/src/main/java/Laptop%20Image/Laptop-Acer-Predator-Helios-300-G3-572-50XL-2.jpg\"></td>");
                out.println("   <td>");
                out.println("       <table>");
                out.println("           <tr><td colspan=\"2\" style=\"font-size: 125%;\"><b>" + rs.getString(2) + "</b></td></tr>");
                
//                for (int i = 3; i < colCount; i++){
//                    if (rs.getString(i) != null){
//                        out.println("           <tr>");
//                        out.println("               <th>" + rsmd.getColumnName(i) + "</th>");
//                        out.println("               <td>" + rs.getString(3) + "</td>");
//                        out.println("           </tr>");
//                    }
//                }
                out.println("           <tr>");
                out.println("               <th>CPU</th>");
                out.println("               <td>" + rs.getString(3) + "</td>");
                out.println("           </tr>");
                
                out.println("           <tr>");
                out.println("               <th>RAM</th>");
                out.println("               <td>" + rs.getString(4) + "</td>");
                out.println("           </tr>");
                
                out.println("           <tr>");
                out.println("               <th>GPU</th>");
                out.println("               <td>" + rs.getString(5) + "</td>");
                out.println("           </tr>");
                
                if (rs.getString(6) != null){
                    out.println("           <tr>");
                    out.println("               <th>HDD</th>");
                    out.println("               <td>" + rs.getString(6) + "</td>");
                    out.println("           </tr>");
                }
                if (rs.getString(7) != null){
                    out.println("           <tr>");
                    out.println("               <th>SSD</th>");
                    out.println("               <td>" + rs.getString(7) + "</td>");
                    out.println("           </tr>");
                }
                
                out.println("           <tr>");
                out.println("               <th>Display</th>");
                out.println("               <td>" + rs.getString(8) + "</td>");
                out.println("           </tr>");
                
                out.println("           <tr>");
                out.println("               <th>Battery</th>");
                out.println("               <td>" + rs.getString(9) + "</td>");
                out.println("           </tr>");
                
                out.println("           <tr>");
                out.println("               <th>OS</th>");
                out.println("               <td>" + rs.getString(10) + "</td>");
                out.println("           </tr>");

                out.println("       </table>");
                out.println("   </td>");
                out.println("   <td>" + rs.getString(11) + "</td>");
                out.println("   <td><input type=\"button\" value=\"Add to Cart\"></td>");
                out.println("</tr>");
            }

            con.close();  
        } catch(Exception e){ 
            System.out.println(e);
        } 
        
        out.println("       </table>");
        
        out.println("<table border=\"1\" cellpadding=\"5\" cellspacing=\"5\">");
        out.println("   <tr>");
        out.println("       <td colspan=\"2\">DELL STUDIO</td>");
        out.println("   </tr>");
        out.println("   <tr>");
        out.println("       <td>Cell 3</td> ");
        out.println("       <td>Cell 4</td>");
        out.println("   </tr>");
        out.println("</table>");
    }
    
    public static String readUsingScanner(String fileName) {
        Scanner scanner = null;
        try {
            scanner = new Scanner(Paths.get(fileName), StandardCharsets.UTF_8.name());
            // we can use Delimiter regex as "\\A", "\\Z" or "\\z"
            String data = scanner.useDelimiter("\\A").next();
            return data;
        } catch (IOException e) {
            e.printStackTrace();
                return null;
        } finally {
            if (scanner != null)
                scanner.close();
        }
    }
}
