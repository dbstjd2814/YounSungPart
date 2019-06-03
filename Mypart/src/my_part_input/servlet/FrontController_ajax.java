package my_part_input.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my_part_dao.MemberDAO;
import my_part_dto.MemberDTO;

@WebServlet("*.ajax")
public class FrontController_ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String reqUri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = reqUri.substring(ctxPath.length());
		MemberDAO dao = new MemberDAO();
		if (cmd.equals("/idchck.ajax")) {
			String id = request.getParameter("id");
			System.out.println(id);

			try {
				System.out.println(dao.getIdCheck(id));
				if(id.equals("")) {
					response.getWriter().write("3");
				}else{
					response.getWriter().write(dao.getIdCheck(id)+"");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
			
			

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
