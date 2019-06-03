package my_part_dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import my_part_dto.MemberDTO;

public class MemberDAO {
	
	public static String testSHA256(String str){ // sha 암호화 메서드
		String SHA = ""; 
		try{
			MessageDigest sh = MessageDigest.getInstance("SHA-256"); 
			sh.update(str.getBytes()); 
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer(); 
			for(int i = 0 ; i < byteData.length ; i++){
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace(); 
			SHA = null; 
		}
		return SHA;
	}
	
	
	public Connection getConnection()throws Exception{ 
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "semi";
		String pw = "semi";
		return DriverManager.getConnection(url,user,pw);
	}
	public int getInsert(MemberDTO dto)throws Exception{ // 회원가입
		String sql = "insert into member(m_id,m_password,m_nickname,m_gender,m_agerange,m_monthday,m_phone) values(?,?,?,?,?,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstet = con.prepareStatement(sql);
			){
				pstet.setString(1,dto.getM_id());
				pstet.setString(2,this.testSHA256(dto.getM_password()));
				pstet.setString(3,dto.getM_nickname());
				pstet.setString(4,dto.getM_gender());
				pstet.setString(5,dto.getM_agerange());
				pstet.setString(6,dto.getM_monthday());
				pstet.setString(7,dto.getM_phone());
				int result = pstet.executeUpdate();
				con.commit();
				return result;
		}
	}
	public boolean getLogin(MemberDTO dto)throws Exception{ // 로그인
		String sql = "select * from member where m_id=? and m_password=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstet = con.prepareStatement(sql);
			){
				pstet.setString(1,dto.getM_id());
				pstet.setString(2,this.testSHA256(dto.getM_password()));
				ResultSet rs = pstet.executeQuery();
				return rs.next();
		}
		}
	public int getIdCheck(String id)throws Exception{ // 아이디 첵크
			String sql = "select * from member where m_id=?";
			try(
					Connection con = this.getConnection();
					PreparedStatement pstet = con.prepareStatement(sql);
				){
					pstet.setString(1,id);
					ResultSet rs = pstet.executeQuery();
					if(rs.next()) {
						return 1;
					}else {
						return 0;
					}
			}
			}
		
	public String getMyLoginYear(String birth)throws Exception{ // 달력에서의  년도 값 뺴오기
		Pattern infoPattern = Pattern.compile("(^....)");
		Matcher infoMatcher = infoPattern.matcher(birth);
		if(infoMatcher.find()){ // find가 group보다 선행되어야 합니다.
			return infoMatcher.group(); // ERROR
		}
		return birth;
	}
	public String getMyLoginAgeRange(String birth)throws Exception{// 년도 값에서 ex) 97년생인지 구별하기
		Pattern infoPattern = Pattern.compile("(..$)");
		Matcher infoMatcher = infoPattern.matcher(birth);
		if(infoMatcher.find()){ // find가 group보다 선행되어야 합니다.
			return infoMatcher.group(); // ERROR
		}
		return birth;
	}
	
	public String getMyLoginMonth_Day(String birth)throws Exception{// 달력에서 월일 - 포함해서 뺴오기
		Pattern infoPattern = Pattern.compile("(..-..$)");
		Matcher infoMatcher = infoPattern.matcher(birth);
		if(infoMatcher.find()){ // find가 group보다 선행되어야 합니다.
			return infoMatcher.group(); // ERROR
		}
		return birth;
	}
	public String getMyLoginYearMonth(String birth)throws Exception{// 월 의 값만 가져오기
		Pattern infoPattern = Pattern.compile("(^..)");
		Matcher infoMatcher = infoPattern.matcher(birth);
		if(infoMatcher.find()){ // find가 group보다 선행되어야 합니다.
			return infoMatcher.group(); // ERROR
		}
		return birth;
	}
	public String getMyLoginYearDay(String birth)throws Exception{// 일 의 값만 가져오기
		Pattern infoPattern = Pattern.compile("(..$)");
		Matcher infoMatcher = infoPattern.matcher(birth);
		if(infoMatcher.find()){ // find가 group보다 선행되어야 합니다.
			return infoMatcher.group(); // ERROR
		}
		return birth;
	}
}
