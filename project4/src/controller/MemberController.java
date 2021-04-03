package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.MemberDao;
import dto.MemberDto;
import mail.Gmail;
import mail.SHA256;
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
		resp.setContentType("text/html; charset=UTF-8");
		
		String param = req.getParameter("param");
		
		/* 일반회원 가입 */
		if(param.equals("normalRegi")) {	
			System.out.println("MemberController Regi");

			
			String fupload = req.getServletContext().getRealPath("/upload");	//저장경로 설정
			System.out.println("업로드 폴더:" + fupload);

			String yourTempDir = fupload;

			int yourMaxRequestSize = 100 * 1024 * 1024;	// 1 Mbyte
			int yourMaxMemorySize = 100 * 1024;			// 1 Kbyte

			// form field의 데이터를 저장할 변수
			String id = "";
			String pwd = "";
			String name = "";
			String phoneNum1 = "";
			String phoneNum2 = "";
			String phoneNum3 = "";
			
			String email = "";
			String gender = "";

			int memType = 0;
			String trainerID = "";
			String gymName = "";
			String trainerContent = "";
			
			String age = ""; 		// int
			String height = "";		// double
			String weight = "";		// double
			String gWeight = "";	// double
			
			// file명 저장
			String profileImg = "";

			boolean isMultipart = ServletFileUpload.isMultipartContent(req);	//멀티파트 여부 확인
			
			if(isMultipart == true){	//멀티파트 form이라면
				
				// FileItem 생성
				DiskFileItemFactory factory = new DiskFileItemFactory();	//업로드 파일 보관하는 FileItem의 팩토리 설정
				
				factory.setSizeThreshold(yourMaxMemorySize);	//임시파일 한계 크기 설정
				factory.setRepository(new File(yourTempDir));	//업로드된 파일 저장 위치
				
				ServletFileUpload upload = new ServletFileUpload(factory);	//업로드 요청 처리하는 팩토리 생성
				upload.setSizeMax(yourMaxRequestSize);	// 업로드 파일 최대사이즈
				
				try {
					List<FileItem> items = upload.parseRequest(req);	//아이템 추출
					Iterator<FileItem> it = items.iterator();
					
					while(it.hasNext()){
						
						FileItem item = it.next();
						
						if(item.isFormField()) {	// id, title, content
							if(item.getFieldName().equals("id")){
								id = item.getString("utf-8");
							}
							else if(item.getFieldName().equals("pwd")){
								pwd = item.getString("utf-8");
							}
							else if(item.getFieldName().equals("name")){
								name = item.getString("utf-8");
							}			
							else if(item.getFieldName().equals("phoneNum1")){
								phoneNum1 = item.getString("utf-8");
							}			
							else if(item.getFieldName().equals("phoneNum2")){
								phoneNum2 = item.getString("utf-8");
							}			
							else if(item.getFieldName().equals("phoneNum3")){
								phoneNum3 = item.getString("utf-8");
							}			
							else if(item.getFieldName().equals("email")){
								email = item.getString("utf-8");
							}			
							else if(item.getFieldName().equals("gender")){
								gender = item.getString("utf-8");
							}		
							else if(item.getFieldName().equals("trainerID")){
								trainerID = item.getString("utf-8");
							}			
							else if(item.getFieldName().equals("gymName")){
								gymName = item.getString("utf-8");
							}			
							else if(item.getFieldName().equals("trainerContent")){
								trainerContent = item.getString("utf-8");
							}		
							else if(item.getFieldName().equals("age")){
								age = item.getString("utf-8");
							}			
							else if(item.getFieldName().equals("height")){
								height = item.getString("utf-8");
							}			
							else if(item.getFieldName().equals("weight")){
								weight = item.getString("utf-8");
							}			
							else if(item.getFieldName().equals("gWeight")){
								gWeight = item.getString("utf-8");
							}			
						}
						else {	// file
							System.out.println(item.getName());
				
							long file_size = item.getSize();
							if(file_size != 0) {
								if(item.getFieldName().equals("profileImg")){				
									// 확장자 명
									try {
										String fileName = item.getName();	//파일 제목
										int lastInNum = fileName.lastIndexOf(".");
										String exName = fileName.substring(lastInNum); //확장자 구함
										
										// 새로운 파일명
										String newfilename = (new Date().getTime()) + "";
										newfilename = newfilename + exName;
										System.out.println(newfilename);
														
										profileImg = processUploadFile(item, newfilename, fupload);
									} catch (Exception e) {
										System.out.println("Exception : 프로필 사진 첨부 안했을 때");
										e.printStackTrace();
									}
								}
							}
							else {
								System.out.println("파일 첨부 되지 않았음");
							}
						}		
					}
				} 
				
				catch (NumberFormatException | FileUploadException | IOException e) {
					System.out.println("Exception : 입력 안된 값은 \"\" 또는 0으로 대체");
					e.printStackTrace();
				}	
				
				
			}
			
			
			/* 트레이너라면 멤버타입 1로 바꿔준다. */
			if(gymName != "" && gymName != null && trainerContent != "" && trainerContent != null) {
				memType = 1;
			}
			
			String phoneNum = phoneNum1+phoneNum2+phoneNum3;	
			
			System.out.println("값 확인 id:"+id+" pwd:"+pwd+" email:"+email+" name:"+name+" phoneNum:"
					+phoneNum+" gender:"+gender+" trainerID:"+trainerID+" profileImg:"+profileImg+ 
					" age:"+age+" height:"+height+" gWeight:"+gWeight+" memType:"+memType+" gymName:"+gymName+  
					" trainerContent:"+trainerContent+" weight:"+weight );
			
			
			//memLevel은 0으로 세팅.
			//선택사항 입력 안하면 0으로 처리 
			MemberDto mem = new MemberDto(id, pwd, email, name, phoneNum, gender, 
										trainerID, profileImg, Integer.parseInt(age), Double.parseDouble(height), 
										Double.parseDouble(gWeight), 0, memType, gymName, 
										trainerContent, Double.parseDouble(weight));
			
			
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
		
		
		/* 아이디 중복 체크 */
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
		
		
		/* 회원가입 시 이메일 본인 인증 버튼 클릭 (수정 중) */
		else if(param.equals("auth")) {
			System.out.println("MemberController auth");
			//String name = req.getParameter("name");
			String host = "http://localhost:8090/project/";		
			String from = "bit210324@gmail.com";
			String to = req.getParameter("email");
			String code = SHA256.getEncrypt(to, "cos");
			
			String subject = "홈피트 [Home-Fit] 회원가입을 위한 이메일 인증 메일입니다.";
			String content = "다음 링크에 접속하여 이메일 인증을 진행해주세요. " 
			        + "<a href='" + host + "member?param=authCheck&email="+to+"&code="+code
					+ "'>이메일 인증하기</a>";
			
			Properties p = new Properties();
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.host", "smtp.googlemail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465"); 
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.sockerFactory.fallback", "false");

			try {
				Authenticator auth = new Gmail();
				Session ses = Session.getInstance(p, auth);
				ses.setDebug(true);
				MimeMessage msg = new MimeMessage(ses);
				msg.setSubject(subject);
				Address fromAddr = new InternetAddress(from);
				msg.setFrom(fromAddr);
				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				msg.setContent(content, "text/html; charset=UTF-8");
				Transport.send(msg);
			} catch (Exception e) {
				PrintWriter script = resp.getWriter();
				script.println("<script>");
				script.println("alert('이메일 인증 오류')");
				script.println("history.back();");
				script.println("</script>");
			}
			
		}
		
		
		/* 자신의 이메일 가서 '이메일 인증하기' 눌렀을 때 */
		else if(param.equals("authCheck")) {
			String code = req.getParameter("code");
			String email = req.getParameter("email");
			boolean rightCode = SHA256.getEncrypt(email, "cos").equals(code) ? true : false;
			
			PrintWriter script = resp.getWriter();
			
			
			if(rightCode == true){
				script.println("<script>");
				script.println("alert('이메일 인증에 성공하였습니다.');");
				script.println("window.close();");
				script.println("</script>");
			} else{
				script.println("<script>");
				script.println("alert('이메일 인증을 실패하였습니다.');");
				script.println("window.close();");
				script.println("</script>");
			}
			
		}
		
		/* 로그인 버튼 눌렀을 때 */
		else if(param.equals("logincheck")) {
	         //System.out.println("로그인체크 컨트롤러");
	         String id = req.getParameter("id");
	         String pwd = req.getParameter("pwd");
	         //System.out.println(id+","+pwd);
	         MemberDto dto = dao.login(id, pwd);
	         
	         //세션 생성
	          if(dto != null && !dto.getMemberID().equals("")){
	                  req.getSession().setAttribute("login", dto);
	                 
	                  System.out.println("memType"+dto.getMemType());
	                  if(dto.getMemType()==0) {
	                     //일반
	                     resp.sendRedirect("main.jsp?memType=0");
	                  }
	                  else if(dto.getMemType()==1) {
	                     //트레이너
	                     resp.sendRedirect("main.jsp?memType=1");
	                  }
	                  else if(dto.getMemType()==2) {
	                     //관리자
	                     resp.sendRedirect("main.jsp?memType=2");
	                  }
	               }else {
	                  System.out.println("login 정보 확인");
	                  resp.sendRedirect("main.jsp");
	               }
	         
	      }
		
		
		
	}

	// upload 함수
	public String processUploadFile(FileItem fileItem, String newfilename, String dir)throws IOException{

		String filename = fileItem.getName();	// 경로 + 파일명
		long sizeInBytes = fileItem.getSize();
		
		if(sizeInBytes > 0){	
			
			int idx = filename.lastIndexOf("\\"); 
			if(idx == -1){							// \가 없으면
				idx = filename.lastIndexOf("/");	// /로 찾음
			}
			
			filename = filename.substring(idx + 1);	//원본 파일명만 추출
			File uploadFile = new File(dir, newfilename); // 새로운 파일 명으로 서버에 저장
		
			try{	
				fileItem.write(uploadFile);	// 실제 upload되는 부분
			}catch(Exception e){
				e.printStackTrace();
			}		
		}
		return newfilename;	// 새로운 파일 이름으로 반환
	}
	
	
}
