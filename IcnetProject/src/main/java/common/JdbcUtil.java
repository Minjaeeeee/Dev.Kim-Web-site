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
			System.out.println("����̹� �ε� ����");
			InitialContext ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myOracle"); //jndi �ڿ��� ã�ƿͶ�!
			
			//web.xml���� resource-ref�ȿ� �ִ� res-ref-name���� �����ص� jdbc/myOracle�� �����ϰ� �ȴ�.
			//���� ���ҽ��� Context.xml���Ͽ� Resource�� ���ǵǾ� �ִ� �������� �ڿ��� �ҷ��ͼ�
			//������ �ҽ��� �����س���! ��� ������ �ڵ带 �ۼ��� ���̴�.
			
			System.out.println("Connection Pool ����!");
		} 
		
		catch (ClassNotFoundException e) //Ŭ������ �߰ߵ��� �ʾ��� ��
		{
			e.printStackTrace();
		}
		
		catch (NamingException e) //�̸��� ������ �߻��Ͽ��� ��
		{
			e.printStackTrace();
		}
	}
	
	private JdbcUtil() {}
	
	public static JdbcUtil getInstance() //���⼭ static���� ������ ����� instance
	{
		return instance;
	}
	
	public Connection getConnection() throws SQLException
	{
		return ds.getConnection(); //Ǯ���� Ŀ�ؼ��� ��ȯ�����ش�
	}
	
}
