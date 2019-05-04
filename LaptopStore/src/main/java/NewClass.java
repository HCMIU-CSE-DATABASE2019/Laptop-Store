import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

public class NewClass {
    static String queryString1 = ""
            + "SELECT \n" +
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
    
    static String queryString2 = 
                                 "SELECT * FROM gpu";

    public static void main(String[] args) {
	try{      
	    Class.forName("com.mysql.cj.jdbc.Driver");  
	    Connection con = DriverManager.getConnection(  
		    "jdbc:mysql://localhost:3306/laptop_store","root","tomnisa123");  	    

	    Statement statement = con.createStatement();   
            
            //Change SQL code in here:
	    ResultSet rs = statement.executeQuery(queryString1); 
            
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
}

