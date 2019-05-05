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
import java.sql.ResultSetMetaData;
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
    static String queryFile = "src/main/java/SQL File/Show CPU Specifications.sql";
    static String queryFile2 = "src/main/java/SQL File/Show All GPU.sql";
    
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
    
    static String query3 = "SELECT \n" +
            "	cpubrand.cpu_brand_name AS `Brand`, \n" +
            "    cpu.cpu_modifier AS `Modifier`,\n" +
            "    cpu.cpu_model AS `Model`,\n" +
            "    cpumodel.core AS `Core(s)`,\n" +
            "    cpumodel.thread AS `Thread(s)`,\n" +
            "    cpumodel.cpu_base_freq AS `Base frequency (GHz)`,\n" +
            "    cpumodel.cpu_max_freq AS `Max frequency (GHz)`,\n" +
            "    cpumodel.cache AS `L3 cache (MB)`,\n" +
            "	integratedgpu.igpu_name AS `Integrated GPU`\n" +
            "FROM cpubrand, cpu, cpumodel, integratedgpu\n" +
            "WHERE\n" +
            "	cpubrand.cpu_brand_id = cpu.cpu_brand_id AND\n" +
            "    cpu.cpu_model = cpumodel.cpu_model AND\n" +
            "    cpumodel.integrated_gpu = integratedgpu.igpu_id;";
    
    static String query4 = "SELECT * FROM gpu";
    
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
        
        try{      
            Class.forName("com.mysql.cj.jdbc.Driver");  
            Connection con = DriverManager.getConnection(  
                    "jdbc:mysql://localhost:3306/laptop_store","root","tomnisa123");  	    

            Statement statement = con.createStatement();  
            
            System.out.println("Executing SQL...");
            
            ResultSet rs = statement.executeQuery(query1);  
            ResultSetMetaData rsmd = rs.getMetaData();
            
            System.out.println("Completed");

            int colCount = rsmd.getColumnCount();
            
            //Print column name
            out.println("<tr>");
            
            for (int i = 1; i <= colCount; i++){    
                out.println("   <th>" + rsmd.getColumnName(i) + "</td>");
            }
            out.println("</tr>");
            
            while(rs.next()) {
                out.println("<tr>");
                
                for (int i = 1; i <= colCount; i++){          
                    out.println("   <td>" + rs.getString(i) + "</td>");
                }
                
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
