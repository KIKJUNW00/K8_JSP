package membership;

import common.JDBCconnect;

public class MemberDAO extends JDBCconnect{
	//명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체를 생성합니다.
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO(
				"com.mysql.cj.jdbc.Driver", "jdbc:mysql://localhost:3306/musthave", "musthave", "Tiger12#$");
		
		MemberDTO dto = dao.getMemberDTO("musthave", "1234");
		
		System.out.println(dto);
	}
	
	//명시한 아이디/패스워드와 일치하는 회원 정보를 반환합니다.
	public MemberDTO getMemberDTO(String uid, String pass) {
		MemberDTO dto = new MemberDTO();	//회원정보 DTO 객체 생성
		String query = "SELECT * FROM member WHERE id = ? AND pass = ?"; //쿼리문 템플릿
		
		
		try {
			//쿼리 실행
			psmt = con.prepareStatement(query); //동적 쿼리문 준비
			psmt.setString(1, uid); //쿼리문의 첫 번째 인파라미터에 값 설정
			psmt.setString(2, pass);// 쿼리문의 두 번째 인파라미터에 값 설정
			rs = psmt.executeQuery(); //쿼리문 실행
			
			//결과처리
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
}
