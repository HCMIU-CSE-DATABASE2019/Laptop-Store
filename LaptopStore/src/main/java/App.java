/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author KiroHikaru
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Hello world!
 *
 */
public class App {
    static String query1 = "SELECT * FROM databaselab5.titles";

    //Find the author who wrote "Java How to Program" book
    static String query2 = ""
	    + ""   + "SELECT"  
	    + "\n" + "	CONCAT(A.firstName, ' ', A.lastName)"
	    + "\n" + "	FROM databaselab5.authors A, databaselab5.authorisbn AI, databaselab5.titles T"
	    + "\n" + "WHERE"
	    + "\n" + "	A.authorID = AI.authorID AND"
	    + "\n" + "	AI.isbn = T.isbn AND"
	    + "\n" + "  T.title = 'Java How to Program'";

    static String query3 = ""
	    + "SELECT A.*"
	    + "FROM databaselab5.authors A";

    static String query4 = ""
	    + "SELECT T."
	    + "FROM databaselab5.titles T";

    public static void main(String[] args) {
        System.out.println("Hello World");
	try{      
	    Class.forName("com.mysql.cj.jdbc.Driver");  
	    Connection con = DriverManager.getConnection(  
		    "jdbc:mysql://localhost:3306/databaselab5","root","tomnisa123");  	    

	    Statement statement = con.createStatement();  

	    System.out.println("Executing SQL...");

	    ResultSet rs = statement.executeQuery(query1);  

	    System.out.println("Result");

	    while(rs.next()) {
		System.out.println(rs.getString(1) + "  "
					+ rs.getString(2) + "  " 
					+ rs.getString(3) + "  "
					+ rs.getString(4) + "  "
					+ rs.getString(5) + "  " 
					+ rs.getString(6) + "  " 
					+ rs.getString(7) + "  ");  	
	    }
	    System.out.println();
	    con.close();  
	} catch(Exception e){ 
	    System.out.println(e);
	}  
    }  
}



