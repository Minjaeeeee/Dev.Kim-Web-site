package user1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO 
{
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO()  //����Ŭ db�� �����ϰ� �����ش�
	{
		try 
		{
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "scott";
			String dbPassword = "tiger";
			Class.forName("oracle.jdbc.OracleDriver");
			conn= DriverManager.getConnection(dbURL,dbID,dbPassword);
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) //�ϳ��� ������ ���� �α��� �˰���
	{
		String SQL = "SELECT userPassword FROM USER1 WHERE userID = ?";
		try
		{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID); //�Ű������� �� id�� �־��ִ� ���̴�
			rs= pstmt.executeQuery();
			
			if(rs.next())
			{
				if(rs.getString(1).equals(userPassword))
				{
					return 1; //�α��� ����
				}
				
				else
					return 0; //��й�ȣ ����ġ
			}
			return -1; //���̵� ����
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return -2; //������ ���̽� ������ �ǹ��Ѵ�
	}
	
	
	//���Ⱑ ���� ȸ�������Ҷ� db�� ���� �־��ִ� ������ �ϴ� �޼ҵ��̴�.
	public int join(User user)
	{
		//������ ����! PrepareStatement�޼ҵ�� �������� ��������ش�, �׷� ������ �����ϰ� �Ǵ°��̴�.
		String SQL = "INSERT INTO USER1 VALUES(?,?,?,?,?)"; 
		try
		{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,user.getUserID());
			pstmt.setString(2,user.getUserPassword());
			pstmt.setString(3,user.getUserName());
			pstmt.setString(4,user.getUserGender());
			pstmt.setString(5,user.getUserEmail());
			return pstmt.executeUpdate(); //������Ʈ���Ѽ� ��ȯ�Ѵ�.
		}
		catch(Exception e)
		{
			e.printStackTrace(); 
		}
		return -1;
	}
}
