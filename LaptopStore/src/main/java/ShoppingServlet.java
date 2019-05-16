

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Laptop;
import org.springframework.util.ResourceUtils;

/**
 *
 * @author KiroHikaru
 */
@WebServlet(urlPatterns = {"/ShoppingServlet"})
public class ShoppingServlet extends HttpServlet {
    static String queryFile = "Option 0 - Show default laptop specification.sql";
 
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

        if (request.getParameter("sortOption") != null){
            System.out.println("Get Option: " + request.getParameter("sortOption"));
            
            switch(Integer.parseInt(request.getParameter("sortOption"))){
                case 0: {
                    queryFile = "Option 0 - Show default laptop specification.sql";
                    break;
                }
                case 1: {
                    queryFile = "Option 1 - Sort by price ascending.sql";
                    break;
                }
                case 2: {
                    queryFile = "Option 2 - Sort by price descending.sql";
                    break;
                }
                case 3: {
                    queryFile = "Option 3 - Sort by brand name ascending.sql";
                    break;
                }
                case 4: {
                    queryFile = "Option 4 - Sort by brand name descending.sql";
                    break;
                }
                default: {
                    queryFile = "Option 0 - Show default laptop specification.sql";
                    break;
                }
            }
        }

        showLaptop(request, response);
 
        RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
        rd.forward(request, response); 
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
        System.out.println("Get Option: " + queryFile);
        try{      
            File file = ResourceUtils.getFile("classpath:SQL File/" + queryFile);
            String content = new String(Files.readAllBytes(file.toPath()));
            
            Class.forName("com.mysql.cj.jdbc.Driver");  
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptop_store","root","tomnisa123");  	    
            Statement statement = con.createStatement();  

            System.out.println("Executing SQL...");
           
            ResultSet rs = statement.executeQuery(content);  
            ResultSetMetaData rsmd = rs.getMetaData();
              
            List<Laptop> laptops = new ArrayList<Laptop>();
            List<String> columnNames = new ArrayList<String>();
            int columnCount = rsmd.getColumnCount();

            for (int i = 1; i <= columnCount; i++){
                columnNames.add(rsmd.getColumnName(i));
            }
              
            while(rs.next()) {
                Laptop laptop = new Laptop();  

                laptop.setImage(rs.getString(1));
                laptop.setFullName(rs.getString(2));           
                laptop.setCpuModel(rs.getString(3));
                laptop.setRam(rs.getString(4));
                laptop.setGpuModel(rs.getString(5));
                laptop.setHdd(rs.getString(6));
                laptop.setSsd(rs.getString(7));
                laptop.setDisplay(rs.getString(8));
                laptop.setBattery(rs.getString(9));
                laptop.setOs(rs.getString(10));
                laptop.setPrice(rs.getString(11));
                
                laptops.add(laptop);
            }
            
            request.setAttribute("columnNames", columnNames);
            request.setAttribute("laptops", laptops);
            
            con.close();  
        } catch(Exception e){ 
            System.out.println(e);
        }        
    }
    
}
