package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;
import dto.MemberDto;
import dto.PdsDto;

public class MemberDao {

	private static MemberDao dao = new MemberDao();
	
	private MemberDao() {
		DBConnection.initConnection();
	}
	
	public static MemberDao getInstance() {
		return dao;
	}
	
	// 회원 추가
	public boolean addMember(MemberDto dto) {
		
		
		String sql = " INSERT INTO MEMBER(MEMBERID, PWD, EMAIL, NAME, PHONENUM, GENDER, "
				+ " TRAINERID, PROFILEIMG, AGE, HEIGHT, GWEIGHT, MEMLEVEL, "
				+ " MEMTYPE, GYMNAME, TRAINERCONTENT, WEIGHT ) "
				+ " VALUES(?, ?, ?, ?, ?, ?, "
				+ "			?, ?, ?, ?, ?, ?, "
				+ "			?, ?, ?, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0; 
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S addMember");	
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/3 S addMember");
			
			psmt.setString(1, dto.getMemberID());  
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getEmail());
			psmt.setString(4, dto.getName()); 
			psmt.setString(5, dto.getPhoneNum()); 
			psmt.setString(6, dto.getGender()); 
			
			
			
			psmt.setString(7, dto.getTrainerID());
			psmt.setString(8, dto.getProfileImg());
			psmt.setInt(9, dto.getAge());
			psmt.setDouble(10, dto.getHeight());
			psmt.setDouble(11, dto.getgWeight());
			psmt.setDouble(12, dto.getMemLevel());
			
			psmt.setDouble(13, dto.getMemType());
			psmt.setString(14, dto.getGymName());
			psmt.setString(15, dto.getTrainerContent());
			psmt.setDouble(16, dto.getWeight());
			
			
			count = psmt.executeUpdate();
			System.out.println("3/3 S addMember");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("addMember fail");
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0?true:false;
		
	}
	
	
	// 로그인확인
	public MemberDto login(String id, String pwd) {
		
		String sql = " SELECT MEMBERID, EMAIL, NAME "
				+ " FROM MEMBER "
				+ " WHERE MEMBERID=? AND PWD=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto mem = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println("1/3 S login");
			
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			
			System.out.println("2/3 S login");
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String memberId = rs.getString(1);
				String email = rs.getString(2);
				String name = rs.getString(3);
				
//			// DTO생성자추가		
				mem = new MemberDto(memberId, email, name);	
			}
			System.out.println("3/3 login suc");
			
		} catch (Exception e) {
			System.out.println("login fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);			
		}
				
		return mem;
	}
		
	// id중복체크
	public boolean getId(String id) {
		
		String sql = " SELECT MEMBERID "
				+ " FROM MEMBER "
				+ " WHERE MEMBERID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		boolean findid = false;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S getId");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/3 S getId");
			
			psmt.setString(1, id.trim());
			
			rs = psmt.executeQuery();
			System.out.println("3/3 S getId");
			
			if(rs.next()) {	// 존재
				findid = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getId fail");
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return findid;
	}
	//운동을 다보거나, 로그인 할 떄 올라간다?
	
	// 레벨 올리기 위해 count증가
	public void levelCount(MemberDto dto) {
	// 20이하면 dto count 증가, 20되면 dto count 0이 되면서 db접속해서 memlevel올리고 dto level도 설정
		 
		int count = 0;
		count = dto.getMemLevel();
		
		if(count < 20) {
			dto.setMemLevel(count+1);
		}else {
			
			String sql = " UPDATE MEMBER "
						+ " SET MEMLEVEL=MEMLEVEL+1 "
						+ " WHERE MEMBERID=? ";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/3 levelCount success");
				
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getMemberID());
				System.out.println("2/3 levelCount success");
				
				psmt.executeUpdate();
				System.out.println("3/3 levelCount success");
			} catch (SQLException e) {
				System.out.println("levelCount fail");
				e.printStackTrace();
			} finally {
				DBClose.close(conn, psmt, null);
			}
			
			
			dto.setCount(0);
			dto.setLevel(dto.getLevel() + 1);
			
		}
		
	}
	
	// pt신청 시 트레이너와 연결
	public void connPt(MemberDto dto, String tId) {
		
		String sql = " UPDATE MEMBER "
					+ " SET TRAINERID=? "
					+ " WHERE MEMBERID=? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S connPt");
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, tId);
			psmt.setString(2, dto.getMemberID());
			System.out.println("2/3 S connPt");
			
			psmt.executeUpdate();
			System.out.println("3/3 S connPt");
		} catch (SQLException e) {
			System.out.println("connPt fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
	}
	
	// 트레이너의 나의 회원 목록
	public List<MemberDto> ptmem(MemberDto dto) {
		
		String sql = " SELECT MEMBERID, EMAIL, NAME, PHONENUM, GENDER, "
							+ " AGE, HEIGHT, GWEIGHT, WEIGHT "
					+ " FROM MEMBER "
					+ " WHERE TRAINERID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 S ptmem");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMemberID());
			System.out.println("2/4 S ptmem");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 S ptmem");
			
// DTO 생성자 만들기		
			while(rs.next()) {	
				int i = 1;		
				MemberDto mem = new MemberDto(	rs.getString(i++),
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getInt(i++), 
												rs.getDouble(i++), 
												rs.getDouble(i++),
												rs.getDouble(i++));
	
				list.add(mem);
			}
			System.out.println("4/4 S ptmem");
		} catch (SQLException e) {
			System.out.println("ptmem fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
		
	}
	
	// 일반회원의 체주량변화 그래프
	public void graph() {
		
		
	}
	
	
	
	
	
}
