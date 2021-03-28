package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.MemberDto;
import net.sf.json.JSONObject;

public class MemberController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("MemberController doProcess");
		MemberDao dao = MemberDao.getInstance();
		
		
		req.setCharacterEncoding("utf-8");
		
		
		
		String param = req.getParameter("param");
		
		if(param.equals("normalRegi")) {
			System.out.println("MemberController Regi");
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			String name = req.getParameter("name");
			String phoneNum1 = req.getParameter("phoneNum1");
			String phoneNum2 = req.getParameter("phoneNum2");
			String phoneNum3 = req.getParameter("phoneNum3");
			String email = req.getParameter("email");
			String gender = req.getParameter("gender");
			int age = Integer.parseInt(req.getParameter("age"));
			double height = Double.parseDouble(req.getParameter("height"));
			double weight = Double.parseDouble(req.getParameter("weight"));
			double gWeight = Double.parseDouble(req.getParameter("gWeight"));
			String phoneNum = phoneNum1+phoneNum2+phoneNum3;		
			
			
			//트레이너 ID, 프로필 Img, gymName, 트레이너소개 는 null 
			//memLevel, memType 은 0으로 세팅.
			/* 선택사항 입력 안하면 0으로 처리 */
			MemberDto mem = new MemberDto(id, pwd, email, name, phoneNum, gender, 
											null, null, age, height, gWeight, 0, 
												0, null, null, weight);
			
			boolean b = dao.addMember(mem);
			
			String str = "NO";
			if(b) {
				str = "YES";
			}
			
			JSONObject jObj = new JSONObject();
			jObj.put("msg", str);
			 
			resp.setContentType("application/x-json; charset=UTF-8");
			resp.getWriter().print(jObj);
			
			
		}
		else if(param.equals("idCheck")) {
			System.out.println("MemberController idCheck");
			String id = req.getParameter("id");
			System.out.println("id:" + id);
			
			// Dao -> DB 확인

			boolean b = dao.getId(id);
			
			// 데이터 전송 YES or NO
			String str = "NO";
			if(b == false) {
				str = "YES";
			}
			
			JSONObject jObj = new JSONObject();
			jObj.put("msg", str);
			 
			resp.setContentType("application/x-json; charset=UTF-8");
			resp.getWriter().print(jObj);
			
			
		}
	
		
	}

	
	
	
}
