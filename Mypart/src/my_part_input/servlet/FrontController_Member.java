package my_part_input.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my_part_dao.MemberDAO;
import my_part_dto.MemberDTO;

@WebServlet("*.insert")
public class FrontController_Member extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String uri = request.getRequestURI();
			String path = request.getContextPath();
			String com = uri.substring(path.length());
			
			MemberDAO dao = new MemberDAO();
			
			if(com.equals("/Login.insert")) {//로그인
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String loginresult = "";
				try {
					if(dao.getLogin(new MemberDTO(id,pw))) {
						System.out.println("성공");
					}else {
						System.out.println("실패");
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.getRequestDispatcher("input_login.html").forward(request, response);
			}
			
			
			if(com.contentEquals("/Input.insert")){//회원가입
				
				String idcheck = request.getParameter("idcheckvar");
				String pwcheck = request.getParameter("pwcheckvar");
				String nicknamecheck = request.getParameter("nicknamecheckvar");
				String phonecheck = request.getParameter("phonecheckvar");
				
				String id = request.getParameter("id");//아이디
				String pw = request.getParameter("pw");//패스워드
				String nickname = request.getParameter("nickname");//닉네임
				String gender = request.getParameter("gender");//성별
				String birth = request.getParameter("birth");//날짜 1900-05-07
				
				String year = dao.getMyLoginYear(birth);//날짜에서 년도 ex)1900 가져오기
				int a = Integer.parseInt(year);
						
				String ageRange = dao.getMyLoginAgeRange(year);//년도 뒷자리 ex) 00 
				int intagerange = Integer.parseInt(ageRange);//년도 뒷자리 int 형으로 바꾸기
				String month_day = dao.getMyLoginMonth_Day(birth);//날짜에서 월일값 가져오기 ex)05-07
				String month = dao.getMyLoginYearMonth(month_day);//월 ex)05
				String day = dao.getMyLoginYearDay(month_day);// 일 ex)07
				String monthday = month+day; //월일 ex)0507
				
				String phone = request.getParameter("phone");
				String resultage = "";
				String result = "";
				if(a < 2000) { // 1900 년대생이면 
					if(10 <= intagerange && intagerange < 20) {
						resultage  = "100";
					}else if(20 <= intagerange && intagerange < 30 ) {
						resultage = "90";
					}else if(30 <= intagerange  && intagerange < 40) {
						resultage = "80";
					}else if(40 <= intagerange  && intagerange < 50) {
						resultage = "70";
					}else if(50 <= intagerange && intagerange < 60) {
						resultage = "60";
					}else if(60 <= intagerange  && intagerange < 70) {
						resultage = "50";
					}else if(70 <= intagerange  && intagerange < 80) {
						resultage = "40";
					}else if(80 <= intagerange  && intagerange < 90) {
						resultage = "30";
					}else if(90 <= intagerange) {
						resultage = "20";
					}else {
						resultage = "1200"; //오류 확인
					}
				}else {// 20000 년대생이면
					if(0 <= intagerange && intagerange < 10) {
						resultage = "10";
					}else if(10 <= intagerange) {
						resultage = "기타";
					}
				}
	
				try {
						if(dao.getInsert(new MemberDTO(id,pw,nickname,gender,resultage,monthday,phone)) > 0 ) {
							System.out.println("성공");
							result = "성공";
						}else {
							System.out.println("실패");
							result = "실패";
						}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("result",result);
				request.getRequestDispatcher("input_insert.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
