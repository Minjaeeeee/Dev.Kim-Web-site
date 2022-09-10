package common;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcUtil 
{
	private static JdbcUtil instance = new JdbcUtil();
	private static DataSource ds; 
	
	
	static 
	{
		try 
		{
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("드라이버 로딩 성공");
			InitialContext ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myOracle"); //jndi 자원을 찾아와라!
			
			//web.xml에서 resource-ref안에 있는 res-ref-name에서 정으해둔 jdbc/myOracle을 참조하게 된다.
			//저기 리소스는 Context.xml파일에 Resource로 정의되어 있는 네임으로 자원을 불러와서
			//데이터 소스를 생성해내라! 라는 뜻으로 코드를 작성한 것이다.
			
			System.out.println("Connection Pool 생성!");
		} 
		
		catch (ClassNotFoundException e) //클래스가 발견되지 않았을 때
		{
			e.printStackTrace();
		}
		
		catch (NamingException e) //이름의 오류가 발생하였을 때
		{
			e.printStackTrace();
		}
	}
	
	private JdbcUtil() {}
	
	public static JdbcUtil getInstance() //여기서 static으로 선언을 해줘야 instance
	{
		return instance;
	}
	
	public Connection getConnection() throws SQLException
	{
		return ds.getConnection(); //풀에서 커넥션을 반환시켜준다
	}
	
}
