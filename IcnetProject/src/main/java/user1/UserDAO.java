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
	
	public UserDAO()  //오라클 db에 접속하게 도와준다
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
	
	public int login(String userID, String userPassword) //하나의 계정에 대한 로그인 알고리즘
	{
		String SQL = "SELECT userPassword FROM USER1 WHERE userID = ?";
		try
		{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID); //매개변수에 들어갈 id를 넣어주는 것이다
			rs= pstmt.executeQuery();
			
			if(rs.next())
			{
				if(rs.getString(1).equals(userPassword))
				{
					return 1; //로그인 성공
				}
				
				else
					return 0; //비밀번호 불일치
			}
			return -1; //아이디가 없다
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return -2; //데이터 베이스 오류를 의미한다
	}
	
	
	//여기가 이제 회원가입할때 db에 값을 넣어주는 역할을 하는 메소드이다.
	public int join(User user)
	{
		//쿼리문 삽입! PrepareStatement메소드로 쿼리문을 실행시켜준다, 그럼 값들을 세팅하게 되는것이다.
		String SQL = "INSERT INTO USER1 VALUES(?,?,?,?,?)"; 
		try
		{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,user.getUserID());
			pstmt.setString(2,user.getUserPassword());
			pstmt.setString(3,user.getUserName());
			pstmt.setString(4,user.getUserGender());
			pstmt.setString(5,user.getUserEmail());
			return pstmt.executeUpdate(); //업데이트시켜서 반환한다.
		}
		catch(Exception e)
		{
			e.printStackTrace(); 
		}
		return -1;
	}
}
