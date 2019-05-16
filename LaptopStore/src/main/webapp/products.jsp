<%-- 
    Document   : products
    Created on : May 9, 2019, 5:51:09 PM
    Author     : KiroHikaru
--%>

<%@page import="java.util.List"%>
<%@page import="model.Laptop"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                font-family: sans-serif;
            }
            
            #apply-button {
              background-color: #f4511e;
              border: none;
              color: white;
              text-align: center;
              font-size: 16px;
              padding: 0.5% 1.75% 0.45% 1.75%;
              opacity: 0.6;
              transition: 0.3s;
            }

            #apply-button:hover {opacity: 1}
            
            #buy-button {
              background-color: #f4511e;
              border: none;
              color: white;
              padding: 10px 20px;
              text-align: center;
              font-size: 16px;
              opacity: 0.3;
              transition: 0.3s;
            }

            #buy-button:hover {opacity: 1}
            
        </style>
        <title>HC Store - Laptop</title>
    </head>
    <body style="margin: 0%;">
        <header 
            style="text-align: center;
                font-size: 200%;
                background-color: #4ECC33; 
                color: #FFFFFF;
                padding: 10px 50px 10px 50px;">
                HC Store
        </header>
            
        
        <nav align="center" style="padding: 0.75% 0% 0.75% 0%;">
            <form method="POST" action="ShoppingServlet">  
                <b>Sort by &emsp;</b>
                <select name="sortOption"align="center" style="padding: 0.35% 1.5% 0.35% 1.5%; font-size: 105%;">
                    <option name="sortOption" value="0">(None)</option>
                    <option name="sortOption" value="1">Price (Ascending)</option>
                    <option name="sortOption" value="2">Price (Descending)</option>
                    <option name="sortOption" value="3">Brand (Ascending)</option>
                    <option name="sortOption" value="4">Brand (Descending)</option>
                </select>
                <input id="apply-button" type="submit" value="Apply">
            </form>
        </nav>
        
        <form>
            <table align="center" cellpadding="20px"
                style="border: 1px; 
                    border-collapse: collapse;">
                <tr style="border-bottom: 1px solid #ddd; background-color: #F2F2F2;" onhover="background-color:#f5f5f5;">
                    <th>Image</th>
                    <th>Laptop</th>
                    <th>Price</th>
                    <th></th>
                </tr>

                <% 
                    List<Laptop> laptops = (ArrayList<Laptop>) request.getAttribute("laptops");
                    List<String> columnNames = (ArrayList<String>) request.getAttribute("columnNames");
                    String[] columnValues = new String[columnNames.size()];

                    for (Laptop laptop : laptops){
                        out.println("<tr cellpadding=\"30\" style=\"border-bottom: 1px solid #ddd;\">");
                        out.println("   <td><img style=\"width: 405px; height: 270px;\"src=\"Laptop Image//" + laptop.getImage() + "\"></td>");
                        out.println("   <td>");
                        out.println("       <table>");
                        out.println("           <tr align=\"center\">");
                        out.println("               <td colspan=\"2\" style=\"font-size: 130%; top: 50%; -ms-transform: translateY(-50%); transform: translateY(-50%);\"><b>" + laptop.getFullName() + "</b></td>");
                        out.println("           </tr>");

                        for (int i = 3; i <= 10; i++){
                            columnValues[3] = laptop.getCpuModel();
                            columnValues[4] = laptop.getRam();
                            columnValues[5] = laptop.getGpuModel();
                            columnValues[6] = laptop.getHdd();
                            columnValues[7] = laptop.getSsd();
                            columnValues[8] = laptop.getDisplay();
                            columnValues[9] = laptop.getBattery();
                            columnValues[10] = laptop.getOs();

                            if (columnValues[i] != null){
                                out.println("<tr>");
                                out.println("   <th>" + columnNames.get(i - 1).toString() + "&emsp; </th>");
                                out.println("   <td>" + columnValues[i] + "</td>");
                                out.println("</tr>");
                            }                  
                        }

                        out.println("       </table>");
                        out.println("   </td>");
                        out.println("   <td style=\"font-size: 110%;\"><b>" + laptop.getPrice() + "</b></td>");
                        out.println("   <td><input id=\"buy-button\" type=\"submit\" value=\"Buy Now\"></td>");
                        out.println("</tr>");
                    }
                %>
            </table>  
        </form>
        
        <footer style="text-align: center;
                    font-size: 100%;
                    background-color: #4ECC33;
                    color: #FFFFFF;
                    padding: 20px 50px 20px 50px;">
            © Copyright 2019 Anh Huy. All rights reserved. <br>
            https://github.com/HCMIU-CSE-DATABASE2019/Laptop-Store
        </footer>
    </body>
</html>
