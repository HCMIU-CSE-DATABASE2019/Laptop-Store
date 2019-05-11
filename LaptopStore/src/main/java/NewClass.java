import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Scanner;

public class NewClass {
    static String queryFile = "F:\\Learning\\Database 2019\\Project\\Laptop-Store\\LaptopStore\\src\\main\\java\\SQL File\\Show Laptop Specification.sql";

    public static void main(String[] args) {
	try{      
	    Class.forName("com.mysql.cj.jdbc.Driver");  
	    Connection con = DriverManager.getConnection(  
		    "jdbc:mysql://localhost:3306/laptop_store","root","tomnisa123");  	    

	    Statement statement = con.createStatement();   
            
            //Change SQL code in here:
	    ResultSet rs = statement.executeQuery(readUsingScanner(queryFile));  
            
            ResultSetMetaData rsmd = rs.getMetaData();
            
            int colCount = rsmd.getColumnCount();
            
            while(rs.next()) {
                for (int i = 1; i <= colCount; i++){          
                    System.out.print(rs.getString(i) + "  ");
                }
                System.out.println();
            }       
	    con.close();  
            
	} catch(Exception e){ 
	    System.out.println(e);
	}  
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

