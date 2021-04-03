package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BbsDao;
import dto.BbsDto;
import dto.MemberDto;

public class BbsController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		System.out.println("BbsController doProcess");
		
		req.setCharacterEncoding("utf-8");
	    resp.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = resp.getWriter();
	    BbsDao dao = BbsDao.getInstance();
	    String param = req.getParameter("param");
	    
	    //로그인 해야 게시판 이용가능하니 세션 로그인 속성 불러왔습니다.
    	MemberDto mem = (MemberDto) req.getSession().getAttribute("login");
	      
	    
	    if(param.equals("")) {   
	    	System.out.println("param 빈값 들어옴");
	    }
	    
		/* 게시판 (list) 이동 */
	    else if(param.equals("goPage")) {
	    	System.out.println("BbsController goPage 들어옴");
	    	
	    	 String selectBBS = req.getParameter("selectBBS");
	    	 String searchText = req.getParameter("searchText");
	    	 if(selectBBS == null) selectBBS = "";
	    	 if(searchText == null) searchText = "";
	    	 
	    	 //System.out.println("검색할 대상 : " + selectBBS);
	    	 //System.out.println("검색내용 : " + searchText);
	    	 
	    	 String bbsType = req.getParameter("bbsType"); 
	    	 
	    	 String sPageNumber = req.getParameter("pageNumber");
	    	 Integer pageNumber = 0; // 현재 페이지
	    	 if(sPageNumber != null && !sPageNumber.equals("")) {	//페이지 번호를 클릭했을 때
	    		pageNumber = Integer.parseInt(sPageNumber);
	    	 }
	    	 //System.out.println("현재 페이지 : " +pageNumber.intValue());
	    	 //System.out.println("페이지 고유번호 : " +bbsType.intValue());
	    	 
	    	 
	    	List<BbsDto> list = dao.getBbsPagingList(selectBBS, searchText, pageNumber.intValue(), Integer.parseInt(bbsType));
	    	
	    	
	    	Integer len = dao.getAllBbs(selectBBS, searchText, Integer.parseInt(bbsType));
	    	
	    	//System.out.println("총 글의 수 : " +len.intValue());
	    	//System.out.println("리스트 : " + list.size());

	    	//총 페이지 수 구하기 ex) 23개 --> 3페이지
	    	int bbsPage = len / 10;	
	    	if(len%10 > 0) {	// 게시글이 23개면 (20 +) 3개를 위한 페이지를 하나 더 만들어준다.
	    		bbsPage += 1;
	    	}
	    	 
	    	req.setAttribute("List", list);
	    	req.setAttribute("len", len);
	    	req.setAttribute("bbsPage", bbsPage);
	    	req.setAttribute("pageNumber", pageNumber);
	    	req.setAttribute("bbsType", bbsType);
	    	
	    	if(Integer.parseInt(bbsType) == 0) {	// 자유게시판 리스트 페이지 이동
	    		forward("freeBoardList.jsp", req, resp);
	    	}
	    	else if(Integer.parseInt(bbsType) == 1) {	// Q&A 리스트 페이지 이동
	    		forward("QnAList.jsp", req, resp);
	    	}
	    	else if(Integer.parseInt(bbsType) == 2) {	// 바디프로필 리스트 페이지 이동
	    		forward("bodyProfileList.jsp", req, resp);
	    	}
	    	else if(Integer.parseInt(bbsType) == 3) {	// 트레이너 소개 리스트 페이지 이동
	    		forward("trainerList.jsp", req, resp);
	    	}
	    	else if(Integer.parseInt(bbsType) == 4) {	// 트레이너 신청 리스트 페이지 이동
	    		forward("applyTrainer.jsp", req, resp);
	    	}
	    }
	    
		/* 트레이너 신청 글쓰기 페이지 이동 */
	    else if(param.equals("goApplyTrainerWrite")) {
	    	resp.sendRedirect("applyTrainerWrite.jsp");
	    }
	    
		/* 게시판 글쓰기 완료 버튼 */
	    else if(param.equals("bbswriteAf")) {
	    	System.out.println("BbsController bbswriteAf 들어옴");

	    	String memberId = mem.getMemberID();
	    	String division = req.getParameter("division"); 
	        String title = req.getParameter("title");
	        String img = req.getParameter("img");
	        String content = req.getParameter("content");
	        String bbsType = req.getParameter("bbsType");

	        System.out.println("로그인 아이디 확인:" + memberId);
	        System.out.println("말머리:" + division);
	        System.out.println("title:" + title);
	        System.out.println("img:" + img);
	        System.out.println("content:" + content);
	        System.out.println("bbsType:" + bbsType);
	        
			boolean isS = dao.writeBbs(new BbsDto(memberId, title, content, img, division, Integer.parseInt(bbsType)));
			
			if(!isS) {
				out.println("<script>");
				out.println("alert('글 작성에 실패했습니다.');");
				out.println("history.back();");
				out.println("</script>");
				return;

			} else {
				
				resp.sendRedirect("bbs?param=goPage&bbsType="+bbsType);
				
			};
	    }
	    
		/* 게시판 디테일 페이지 이동 */
	    else if(param.equals("getDetail")) {
	    	System.out.println("BbsController getDetail 들어옴");
	    	
	    	int seq = Integer.parseInt(req.getParameter("seq"));
	    	System.out.println("게시판 디테일 글 번호 : " +seq);
	    	
	    	dao.readcount(seq);	// 조회수 1 증가
	    	
	    	BbsDto dto = dao.getBbs(seq);
	    	
	    	req.setAttribute("bbs", dto);
	    	
	    	int bbsType = dto.getBbstype();
	    	
	    	if(bbsType == 0) {	// 자유게시판 디테일 페이지 이동
	    		forward("applyTrainer.jsp", req, resp);
	    	}
	    	else if(bbsType == 1) {	// Q&A 디테일 페이지 이동
	    		forward("applyTrainer.jsp", req, resp);
	    	}
	    	else if(bbsType == 2) {	// 바디프로필 디테일 페이지 이동
	    		forward("applyTrainer.jsp", req, resp);
	    	}
	    	else if(bbsType == 3) {	// 트레이너 소개 디테일 페이지 이동
	    		forward("applyTrainer.jsp", req, resp);
	    	}
	    	else if(bbsType == 4) {	// 트레이너 신청 디테일 페이지 이동
	    		forward("applyTrainerDetail.jsp", req, resp);
	    	}
	    }
	    
		/* 글 삭제 버튼 클릭 */
	    else if(param.equals("deleteBbs")) {
	    	System.out.println("BbsController deleteBbs 들어옴");
	    	
	    	int seq = Integer.parseInt(req.getParameter("seq"));
	    	System.out.println("게시판 디테일 글 번호 : " +seq);
	    	
	    	boolean b = dao.deleteBbs(seq);
	    	int bbsType = dao.getBbsType(seq);
	    	
	    	if(b) 
	    		resp.sendRedirect("bbs?param=goPage&bbsType="+bbsType);
	    	else
	    		System.out.println("삭제 안됨");	    	
	    	
	    }
		/* 글 수정 페이지 이동 */
	    else if(param.equals("goUpdateBbs")) {
	    	int seq = Integer.parseInt(req.getParameter("seq"));
	    	System.out.println("게시판 디테일 글 번호 : " +seq);
	    	
	    	BbsDto dto = dao.getBbs(seq);
	    	
	    	req.setAttribute("bbs", dto);
	    	
	    	int bbsType = dto.getBbstype();
	    	
	    	if(bbsType == 0) {	// 자유게시판 수정 페이지 이동
	    		forward("applyTrainer.jsp", req, resp);
	    	}
	    	else if(bbsType == 1) {	// Q&A 수정 페이지 이동
	    		forward("applyTrainer.jsp", req, resp);
	    	}
	    	else if(bbsType == 2) {	// 바디프로필 수정 페이지 이동
	    		forward("applyTrainer.jsp", req, resp);
	    	}
	    	else if(bbsType == 3) {	// 트레이너 소개 수정 페이지 이동
	    		forward("applyTrainer.jsp", req, resp);
	    	}
	    	else if(bbsType == 4) {	// 트레이너 신청 수정 페이지 이동
	    		forward("applyTrainerUpdate.jsp", req, resp);
	    	}
	    	
	    	
	    }
		/* 글 수정 버튼 클릭 */
	    else if(param.equals("updateBbs")) {
	    	System.out.println("BbsController updateBbs 들어옴");

	    	String memberId = mem.getMemberID();
	    	int seq = Integer.parseInt(req.getParameter("seq"));
	    	String division = req.getParameter("division"); 
	        String title = req.getParameter("title");
	        String img = req.getParameter("img");
	        String content = req.getParameter("content");
	        String bbsType = req.getParameter("bbsType");

	        System.out.println("로그인 아이디 확인:" + memberId);
	        System.out.println("말머리:" + division);
	        System.out.println("title:" + title);
	        System.out.println("img:" + img);
	        System.out.println("content:" + content);
	        System.out.println("bbsType:" + bbsType);
	    	
	        boolean b = dao.updateBbs(seq, title, content, img, division);
	       
	        if(b) 
	    		resp.sendRedirect("bbs?param=getDetail&seq="+seq);
	    	else
	    		System.out.println("삭제 안됨");	   
	        
	    }
	    
		/* 답글 페이지 이동 */
	    else if(param.equals("goAnswerBbs")) {
	    	System.out.println("BbsController goAnswerBbs 들어옴");
	    	
	    	int seq = Integer.parseInt(req.getParameter("seq"));
	    	System.out.println("게시판 디테일 글 번호 : " +seq);
	    	
	    	BbsDto dto = dao.getBbs(seq);
	    	
	    	req.setAttribute("bbs", dto);
	    	
	    	int bbsType = dto.getBbstype();
	    	
	    	if(bbsType == 0) {	// 자유게시판 답글 페이지 이동
	    		forward("applyTrainer.jsp", req, resp);
	    	}
	    	else if(bbsType == 1) {	// Q&A 답글 페이지 이동
	    		forward("applyTrainer.jsp", req, resp);
	    	}
	    	else if(bbsType == 2) {	// 바디프로필 답글 페이지 이동
	    		forward("applyTrainer.jsp", req, resp);
	    	}
	    	else if(bbsType == 3) {	// 트레이너 소개 답글 페이지 이동
	    		forward("applyTrainer.jsp", req, resp);
	    	}
	    	else if(bbsType == 4) {	// 트레이너 신청 답글 페이지 이동
	    		forward("applyTrainerAnswer.jsp", req, resp);
	    	}
	    	
	    	
	    }
	    	
		/* 답글 작성 버튼 클릭 */
	    else if(param.equals("answerBbs")) {
	    	System.out.println("BbsController answerBbs 들어옴");
	    
	    	String memberId = mem.getMemberID();
	    	System.out.println("로그인 아이디 확인:" + memberId);
	    	int seq = Integer.parseInt(req.getParameter("seq"));
	    	String division = req.getParameter("division"); 
	    	System.out.println("말머리:" + division);
	        String title = req.getParameter("title");
	        System.out.println("title:" + title);
	        String img = req.getParameter("img");
	        System.out.println("img:" + img);
	        String content = req.getParameter("content");
	        System.out.println("content:" + content);
	        int bbsType = Integer.parseInt(req.getParameter("bbsType"));
	        System.out.println("bbsType:" + bbsType);
	        
	    	
	        boolean b = dao.answer(seq, new BbsDto(memberId, title, content, img, division, bbsType));
	        
	        if(b) 
	    		resp.sendRedirect("bbs?param=goPage&bbsType="+bbsType);
	    	else
	    		System.out.println("답글 안달림");	   
	        
	        
	        
	    }
	    
	    
	}
	
	
	
	//계층형 게시판 Depth와 화살표 image 만들어주는 메소드
	public String arrow(int depth){
		String rs = "<img src='/images/arrow.png' width='20px' height='20px'/>";
		String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";	// 여백
		
		String ts = "";
		for(int i = 0;i < depth; i++){
			ts += nbsp;
		}
		
		return depth==0 ? "":ts + rs;	
	}
	
	
	public void forward(String arg, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
	      RequestDispatcher dispatch = req.getRequestDispatcher(arg);
	      dispatch.forward(req, resp);         
	}
	
	
	
}
