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

//�������� ������ DAO��ü �׸��� ���� jsp���Ͽ��� �ع����� �ڵ尡 ��û ����������.

public class BoardDao 
{
	private JdbcUtil ju;
	
	public BoardDao()
	{
		ju = JdbcUtil.getInstance(); //���� �ҷ���
	}
	
	
	
	//�Խ��� �� ����
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
					 pstmt.close(); //�ݾƹ��� Ǯ�� ��ȯ�� ����
				} 
				catch (SQLException e) 
				{
					e.printStackTrace(); //������ ����Ѵ�.
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
	
	
	
	//��ȸ
	public List<BoardVo> selectAll() //BoardVo�� ������ ����Ʈ�� �ҷ��ͼ� ���� ����Ѵ�. (�׷��� ���ڰ� ���� �ʿ䰡 ����)
	{
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		//desc�� �����̶�� ���� ������ �ִ� ����̴�. �� �˾Ƶδ°� ���� ���̴�.
		String query ="select \"NUM\", \"TITLE\", \"WRITER\", \"CONTENT\", \"REGDATE\", \"CNT\" from \"BOARD\" order by \"NUM\" desc";
		ArrayList<BoardVo> ls = new ArrayList<BoardVo> ();
		try 
		{
			con = ju.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query); //�����Ѵ�.
			
			while(rs.next())
			{
				BoardVo vo = new BoardVo(
						rs.getInt(1),
						rs.getString(2), 
						rs.getString(3), 
						rs.getString(4), 
						new Date(rs.getDate(5).getTime()),
						rs.getInt(6));
				ls.add(vo); //����Ʈ�� �߰��ȴ�.
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
					 rs.close(); //�ݾƹ��� Ǯ�� ��ȯ�� ����
				} 
				catch (SQLException e) 
				{
					e.printStackTrace(); //������ ����Ѵ�.
				}
				
			}
			
			if(stmt != null)
			{
				try 
				{
					 stmt.close(); //�ݾƹ��� Ǯ�� ��ȯ�� ����
				} 
				catch (SQLException e) 
				{
					e.printStackTrace(); //������ ����Ѵ�.
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
	
	
	
	
	//�ڼ��ϰ� ��ȸ
	public BoardVo selectOne(int num) //BoardVo�� ������ ����Ʈ�� �ҷ��ͼ� ���� ����Ѵ�. (�׷��� ���ڰ� ���� �ʿ䰡 ����)
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
			updateCnt(num); //��ȸ��
			rs = pstmt.executeQuery(); //�����Ѵ�.
			
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
					 rs.close(); //�ݾƹ��� Ǯ�� ��ȯ�� ����
				} 
				catch (SQLException e) 
				{
					e.printStackTrace(); //������ ����Ѵ�.
				}
				
			}
			
			if(pstmt != null)
			{
				try 
				{
					 pstmt.close(); //�ݾƹ��� Ǯ�� ��ȯ�� ����
				} 
				catch (SQLException e) 
				{
					e.printStackTrace(); //������ ����Ѵ�.
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
	
	
	
	//������Ʈ �����ϰ� �ȴ�.
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
					 pstmt.close(); //�ݾƹ��� Ǯ�� ��ȯ�� ����
				} 
				catch (SQLException e) 
				{
					e.printStackTrace(); //������ ����Ѵ�.
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
	
	
	
	
	
	
	//��ȸ��(Selectone�Ҷ� ȣ��Ǵ� ���̴�!
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
					 pstmt.close(); //�ݾƹ��� Ǯ�� ��ȯ�� ����
				} 
				catch (SQLException e) 
				{
					e.printStackTrace(); //������ ����Ѵ�.
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
	
	
	
	//����
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
					 pstmt.close(); //�ݾƹ��� Ǯ�� ��ȯ�� ����
				} 
				catch (SQLException e) 
				{
					e.printStackTrace(); //������ ����Ѵ�.
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
