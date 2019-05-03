/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
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
    static String query1 = ""
            + "SELECT * FROM laptop_store.cpu\n" 
            + "LEFT JOIN laptop_store.cpumodel ON laptop_store.cpu.cpu_model = laptop_store.cpumodel.cpu_model\n" 
            + "UNION\n" 
            + "SELECT * FROM laptop_store.cpu\n" 
            + "RIGHT JOIN laptop_store.cpumodel ON laptop_store.cpu.cpu_model = laptop_store.cpumodel.cpu_model";
    
    static String query2 = ""
            + "USE laptop_store;\n" 
            + "SELECT cpubrand.cpu_brand_name, cpu.cpu_modifier, cpumodel.*\n" 
            + "FROM cpubrand, cpu, cpumodel\n" 
            + "WHERE cpubrand.cpu_brand_id = cpu.cpu_brand_id AND\n" 
            + "	cpu.cpu_model = cpumodel.cpu_model;";
    
    
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
        out.println("       <h1>Laptop's CPU Specification</h1>");
        out.println("       <table cellspacing=\"10\">");
        out.println("           <tr>");
        out.println("               <th>Brand ID</th>");
        out.println("               <th>Modifier</th>");
        out.println("               <th>Model</th>");
        out.println("               <th>Core</th>");
        out.println("               <th>Thread</th>");
        out.println("               <th>Base Freq</th>");
        out.println("               <th>Max Freq</th>");
        out.println("               <th>Cache(MB)</th>");
        out.println("               <th>Integrated GPU</th>");
        out.println("           </tr>"); 
        
        try{      
            Class.forName("com.mysql.cj.jdbc.Driver");  
            Connection con = DriverManager.getConnection(  
                    "jdbc:mysql://localhost:3306/laptop_store","root","tomnisa123");  	    

            Statement statement = con.createStatement();  

            System.out.println("Executing SQL...");

            ResultSet rs = statement.executeQuery(query1);  

            System.out.println("Result");

            while(rs.next()) {
                out.println("<tr>");
                out.println("   <td>" + rs.getString(1) + "</td>");
                out.println("   <td>" + rs.getString(2) + "</td>");
                out.println("   <td>" + rs.getString(4) + "</td>");
                out.println("   <td>" + rs.getString(5) + "</td>");
                out.println("   <td>" + rs.getString(6) + "</td>");
                out.println("   <td>" + rs.getString(7) + "</td>");
                out.println("   <td>" + rs.getString(8) + "</td>");
                out.println("   <td>" + rs.getString(9) + "</td>");
                out.println("   <td>" + rs.getString(10) + "</td>");
                out.println("</tr>");
            }
            System.out.println();
            con.close();  
        } catch(Exception e){ 
            System.out.println(e);
        }  
        
        out.println("       </table>");
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

}
