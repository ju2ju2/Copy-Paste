package dbTest;

import java.sql.Connection;
import java.sql.DriverManager;
import org.junit.Test;


public class MariaDBTest {
    private static final String DRIVER = "org.mariadb.jdbc.Driver";
    private static final String URL = "jdbc:mariadb://copynpaste2.cnp4xweoedoj.ap-northeast-2.rds.amazonaws.com:3306/copynpaste";
    private static final String USER = "copyNpaste";
    private static final String PASSWORD = "10041004";
    
    @Test
    public void testConnection() throws Exception {
        Class.forName(DRIVER);
        
        try(Connection con =  DriverManager.getConnection(URL, USER,  PASSWORD)) {
            System.out.println("성공");
            System.out.println(con);
        }catch(Exception e) {
            System.out.println("에러발생");
            e.printStackTrace();
        }
    }
}

