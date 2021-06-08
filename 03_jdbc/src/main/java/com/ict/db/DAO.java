package com.ict.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	//DB 접속을 위한 준비
	Connection conn;
	PreparedStatement pstm;
	ResultSet rs; //select 문의 결과. 이외의 것들은 int result
	
	//싱글톤
	private static DAO dao = new DAO();
	public static DAO getInstance() {
		return dao;
	} 
	
	//DB 접속
	public Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@192.168.0.14:1521:xe";
			String user = "c##Hoon";
			String password = "1234";
			conn = DriverManager.getConnection(url, user, password);
			return conn;
		} catch (Exception e) {
		System.out.println(e);
			// TODO: handle exception
		}
		return null;
	}
	
	//DB처리 메소드 만들기.
	
	//로그인할 메소드 만들기.
	//select => 결과가 하나이면, VO에 담는다. 결과가 여러개일 경우는 List<VO>에 담는다.
	public VO getLogin(VO vo) {
		try {
			VO vo2 = null;
			conn = getConnection();
			String sql = "select * from members where id=? and pw=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,vo.getId());
			pstm.setString(2,vo.getPw());
			
			rs = pstm.executeQuery();
			if(rs.next()) {
				vo2 = new VO();
				vo2.setIdx(rs.getString("idx"));
				vo2.setId(rs.getString("id"));
				vo2.setPw(rs.getString("pw"));
				vo2.setName(rs.getString("name"));
				vo2.setAge(rs.getString("age"));
				vo2.setAddr(rs.getString("addr"));
				vo2.setReg(rs.getString("reg"));
			}
			return vo2;
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return null;
	}
	
	public int getInsert(VO vo) {
		try {
			int result = 0;
			conn = getConnection();
			String sql = "insert into members values(members_seq.nextval,?,?,?,?,?,sysdate)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, vo.getId());
			pstm.setString(2, vo.getPw());
			pstm.setString(3, vo.getName());
			pstm.setString(4, vo.getAge());
			pstm.setString(5, vo.getAddr());
			
			result = pstm.executeUpdate();
			
			return result;
		} catch (Exception e) {
		}finally {
			try {
				pstm.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return 0;
	}
	
	public List<VO> getSelectAll(){
		try {
			List<VO> list = new ArrayList<VO>();
			
			conn = getConnection();
			String sql = "select * from members order by idx";
			pstm = conn.prepareStatement(sql);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				VO vo = new VO();
				vo.setIdx(rs.getString("idx"));
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getString("age"));
				vo.setAddr(rs.getString("addr"));
				vo.setReg(rs.getString("reg"));
				
				list.add(vo);
			}
			
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		
		}
		return null;
	}
	
	public VO getDetail(String idx){
		try {
			VO vo = null;
			conn = getConnection();
			String sql = "select * from members where idx=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,idx);
			
			rs = pstm.executeQuery();
			if(rs.next()) {
				vo = new VO();
				vo.setIdx(rs.getString("idx"));
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getString("age"));
				vo.setAddr(rs.getString("addr"));
				vo.setReg(rs.getString("reg"));
			}
			return vo;
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return null;
	}
	
	public int getDelete(String idx) {
		try {
			int result = 0;
			conn = getConnection();
			String sql = "delete from members where idx = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, idx);

			result = pstm.executeUpdate();
			return result;
		} catch (Exception e) {
		}finally {
			try {
				pstm.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return 0;
	}
	
	public int getUpdate(VO vo) {
		try {
			int result = 0;
			conn = getConnection();
			String sql = "update members set name = ?,age = ?, addr = ? where idx=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, vo.getName());
			pstm.setString(2, vo.getAge());
			pstm.setString(3, vo.getAddr());
			pstm.setString(4, vo.getIdx());
			
			result = pstm.executeUpdate();
			
			return result;
		} catch (Exception e) {
		}finally {
			try {
				pstm.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return 0;
	}
}
