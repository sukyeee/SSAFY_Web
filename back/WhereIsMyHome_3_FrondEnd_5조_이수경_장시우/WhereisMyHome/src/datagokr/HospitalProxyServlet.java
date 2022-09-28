package datagokr;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import com.google.gson.Gson;

@WebServlet("/hospital")
public class HospitalProxyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final String SERVICE_URL = "http://apis.data.go.kr/1352000/ODMS_COVID_06/callCovid06Api";
	private final String SERVICE_KEY = "Euu083abTYq7trWCSzPabTvB%2BmZQy022cxsR5gpcONpmT8O2nSzelNoh3FYDHbTtMHyJIykxUAQ%2F29I28uyxLw%3D%3D";
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 파라미터 처리
		// api 요청 + 파라미터
		// 결과 xml 수신
		// xml 요청 client => xml -> json 후 전송 ( XML parsing 작업 <- SAX )
		
		System.out.println("fadklfkalfajlk");
		
		String pageNo = request.getParameter("pageNo");
		if (pageNo == null) pageNo = "1";
		
		String numOfRows = request.getParameter("numOfRows");
		if (numOfRows == null) numOfRows = "100";
		
		// clsf xml, json 구분 client 에게 가공할 것인지 여부
		String clsf = request.getParameter("clsf");
		
		System.out.println(clsf);
		if (clsf == null) clsf = "json";
		
		StringBuilder sb = new StringBuilder();
		sb.append(SERVICE_URL)
			.append("?serviceKey=").append(SERVICE_KEY)
			.append("&pageNo=").append(pageNo)
			.append("&numOfRows=").append(numOfRows);
		
		URL url = new URL(sb.toString());
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.getResponseCode();
		
		BufferedReader br = null;
		if (con.getResponseCode() == 200) {
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 200 이 아닌 경우
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		
		// api response => StringBuilder result 에 넣는다.
		StringBuilder result = new StringBuilder();
		String line;
		while ((line = br.readLine()) != null) {
			result.append(line);
		}
		
		br.close();
		con.disconnect();
		
		// api response 확인
		
		if ("raw".equals(clsf)) {
			sendRaw(response, result.toString());
		} else if ("json".equals(clsf)) {
			sendJson(response, result.toString());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void sendRaw(HttpServletResponse response, String result) throws ServletException, IOException {
	    response.setContentType("application/xml; charset=utf-8");
	    response.getWriter().append(result);
	}

	protected void sendJson(HttpServletResponse response, String result) throws ServletException, IOException {
	    // xml => json
	    response.setContentType("application/json; charset=utf-8");
	    
	    // xml => java ArrayList 객체로 필요한 항목만 추출
	    try {
	    	// SAX parser
	    	SAXParserFactory factory = SAXParserFactory.newInstance();
	    	SAXParser parser = factory.newSAXParser();
	    	HospitalSAXHandler handler = new HospitalSAXHandler();
	    	// 한글처리에 대한 부분
	    	InputStream is = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
	    	parser.parse(is, handler);
	    	
	    	List<Hospital> hospitalList = handler.getHospitalList();
	    	
	    	// java List => json
	        Gson gson = new Gson();
	        String jsonStr = gson.toJson(hospitalList); // json
	        // xml -> json
	        System.out.println(jsonStr);
	        response.setContentType("application/json; charset=utf-8");
	        response.getWriter().append(jsonStr);
	    } catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	   //response.getWriter().append(result);
	}
}
