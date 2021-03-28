package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
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
		req.setCharacterEncoding("utf-8");
		
		String param = req.getParameter("param");
		
		if(param.equals("regi")) {
			System.out.println("MemberController Regi");
		}
		else if(param.equals("idcheck")) {
			System.out.println("MemberController idcheck");
			String id = req.getParameter("id");
			System.out.println("id:" + id);
			
			// Dao -> DB 확인
			MemberDao dao = MemberDao.getInstance();
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
