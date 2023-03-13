import java.sql.*;

class MysqlCon{
public static void main(String args[]){
try{
Class.forName("com.mysql.cj.jdbc.Driver");

//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");
Connection con=DriverManager.getConnection("jdbc:mysql://172.18.0.2:3306/demo","root","root");
//here sonoo is the database name, root is the username and root is the password
Statement stmt=con.createStatement();

ResultSet rs=stmt.executeQuery("select * from EMP");

while(rs.next())
System.out.println(rs.getString(1));

con.close();

}catch(Exception e){ System.out.println(e);}

}
}

