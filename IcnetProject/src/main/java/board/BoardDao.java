package board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.JdbcUtil;

//쿼리문을 삽입할 DAO객체 그리고 만약 jsp파일에서 해버리면 코드가 엄청 복잡해진다.

public class BoardDao 
{
	private JdbcUtil ju;
	
	public BoardDao()
	{
		ju = JdbcUtil.getInstance(); //값을 불러옴
	}
	
	
	
	//게시판 글 삽입
	public int insert(BoardVo vo)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "insert into \"BOARD\" (\"NUM\", \"TITLE\", \"WRITER\", \"CONTENT\", \"REGDATE\", \"CNT\") VALUES (\"BOARD_SEQ\".nextval,?,?,?, sysdate, 0)";
		int ret = -1;
		
		try {
			con =  ju.getConnection();
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());
			ret = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally 
		{
			if(pstmt != null)
			{
				try 
				{
					 pstmt.close(); //닫아버림 풀에 반환을 해줌
				} 
				catch (SQLException e) 
				{
					e.printStackTrace(); //에러문 출력한다.
				}
				
			}
			
			if(con != null)
			{
				try 
				{
					con.close();
				} 
				catch (Exception e) 
				{
					e.printStackTrace();
				}
			}
		}
		return ret;
	}
	
	
	
	//조회
	public List<BoardVo> selectAll() //BoardVo를 가지는 리스트를 불러와서 전부 출력한다. (그래서 인자가 따로 필요가 없다)
	{
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		//desc는 역순이라는 뜻을 가지고 있는 명령이다. 잘 알아두는게 좋을 것이다.
		String query ="select \"NUM\", \"TITLE\", \"WRITER\", \"CONTENT\", \"REGDATE\", \"CNT\" from \"BOARD\" order by \"NUM\" desc";
		ArrayList<BoardVo> ls = new ArrayList<BoardVo> ();
		try 
		{
			con = ju.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query); //전송한다.
			
			while(rs.next())
			{
				BoardVo vo = new BoardVo(
						rs.getInt(1),
						rs.getString(2), 
						rs.getString(3), 
						rs.getString(4), 
						new Date(rs.getDate(5).getTime()),
						rs.getInt(6));
				ls.add(vo); //리스트에 추가된다.
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		finally 
		{
			if(rs != null)
			{
				try 
				{
					 rs.close(); //닫아버림 풀에 반환을 해줌
				} 
				catch (SQLException e) 
				{
					e.printStackTrace(); //에러문 출력한다.
				}
				
			}
			
			if(stmt != null)
			{
				try 
				{
					 stmt.close(); //닫아버림 풀에 반환을 해줌
				} 
				catch (SQLException e) 
				{
					e.printStackTrace(); //에러문 출력한다.
				}
				
			}
			
			if(con != null)
			{
				try 
				{
					con.close();
				} 
				catch (Exception e) 
				{
					e.printStackTrace();
				}
			}
		}
		return ls;
	}
	
	
	
	
	//자세하게 조회
	public BoardVo selectOne(int num) //BoardVo를 가지는 리스트를 불러와서 전부 출력한다. (그래서 인자가 따로 필요가 없다)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVo vo = null;
		
		String query = "select \"NUM\", \"TITLE\", \"WRITER\", \"CONTENT\", \"REGDATE\", \"CNT\" from \"BOARD\" where \"NUM\"=?";
		try 
		{
			con = ju.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			updateCnt(num); //조회수
			rs = pstmt.executeQuery(); //전송한다.
			
			if(rs.next())
			{
				
				vo = new BoardVo(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4), new Date(rs.getDate(5).getTime()),rs.getInt(6));
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		finally 
		{
			if(rs != null)
			{
				try 
				{
					 rs.close(); //닫아버림 풀에 반환을 해줌
				} 
				catch (SQLException e) 
				{
					e.printStackTrace(); //에러문 출력한다.
				}
				
			}
			
			if(pstmt != null)
			{
				try 
				{
					 pstmt.close(); //닫아버림 풀에 반환을 해줌
				} 
				catch (SQLException e) 
				{
					e.printStackTrace(); //에러문 출력한다.
				}
				
			}
			
			if(con != null)
			{
				try 
				{
					con.close();
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
		}
		return vo;
	}
	
	
	
	//업데이트 진행하게 된다.
	public int update(BoardVo vo)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "update \"BOARD\" set \"TITLE\"=?, \"CONTENT\"=? where \"NUM\"=?";
		int ret = -1;
		
		try {
			con =  ju.getConnection();
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getNum());
			ret = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally 
		{
			if(pstmt != null)
			{
				try 
				{
					 pstmt.close(); //닫아버림 풀에 반환을 해줌
				} 
				catch (SQLException e) 
				{
					e.printStackTrace(); //에러문 출력한다.
				}
				
			}
			
			if(con != null)
			{
				try 
				{
					con.close();
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
		}
		return ret;
	}
	
	
	
	
	
	
	//조회수(Selectone할때 호출되는 것이다!
	public int updateCnt(int num)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "update \"BOARD\" set \"CNT\"=\"CNT\"+1 where \"NUM\"=?";
		int ret = -1;
		
		try {
			con =  ju.getConnection();
			pstmt= con.prepareStatement(query);
			pstmt.setInt(1,num);
			ret = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally 
		{
			if(pstmt != null)
			{
				try 
				{
					 pstmt.close(); //닫아버림 풀에 반환을 해줌
				} 
				catch (SQLException e) 
				{
					e.printStackTrace(); //에러문 출력한다.
				}
				
			}
			
			if(con != null)
			{
				try 
				{
					con.close();
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
		}
		return ret;
	}
	
	
	
	//삭제
	public int delete(int num)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "delete from \"BOARD\" where \"NUM\" =?";
		int ret = -1;
		
		try {
			con =  ju.getConnection();
			pstmt= con.prepareStatement(query);
			pstmt.setInt(1, num);
			ret = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally 
		{
			if(pstmt != null)
			{
				try 
				{
					 pstmt.close(); //닫아버림 풀에 반환을 해줌
				} 
				catch (SQLException e) 
				{
					e.printStackTrace(); //에러문 출력한다.
				}
				
			}
			
			if(con != null)
			{
				try 
				{
					con.close();
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
		}
		return ret;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
