package map.controller;

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
import javax.servlet.http.HttpSession;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import com.google.gson.Gson;

import map.dto.ParkingLotDto;
import map.dto.UserDto;
import map.util.ParkingSAXHandler;

@WebServlet("/parking")
public class ParkingLotProxyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private final String SERVICE_URL = "http://openapi.seoul.go.kr:8088/"; 
    private final String SERVICE_KEY = "62576d4147626e753131314d6c744679"; 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserDto userDto = (UserDto) session.getAttribute("userDto");
		String interestCode = userDto.getInterestCode();
		
		
		
		// 이후 고치기 관심지역코드(interestCode) 이용
		String dongName = "상계동";
		
		String START_INDEX = "1";
		String END_INDEX = "200";
		
		String SERVICE = "GetParkInfo";
		
		String TYPE = "xml";
		
		 StringBuilder sb = new StringBuilder();
	        sb.append(SERVICE_URL).append(SERVICE_KEY)
	            .append("/").append(TYPE)
	            .append("/").append(SERVICE)
	            .append("/").append(START_INDEX)
	            .append("/").append(END_INDEX)
	            .append("/").append(dongName);
	        

        URL url = new URL(sb.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        
        System.out.println(conn.getResponseCode());
        
        BufferedReader br = null;
        if(conn.getResponseCode() == 200) {
            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        }else {
            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        // api response => StringBuilder result에 넣는다
        StringBuilder result = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            result.append(line);
        }
        
        br.close();
        conn.disconnect();

        sendJson(response, result.toString());
        
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	 private void sendJson(HttpServletResponse response,  String result) throws ServletException, IOException {
	    	//xml - > json
	    	//sax parser
	    	//xml -> java ArrayList 객체로 필요한 항목만 추출
	  
	    	try {
	        	SAXParserFactory factory = SAXParserFactory.newInstance();
				SAXParser parser = factory.newSAXParser();
				ParkingSAXHandler handler = new ParkingSAXHandler();
				// 한글처리에 대한 부분
				InputStream is = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8))	;
				parser.parse(is, handler);
				
				List<ParkingLotDto> parkingList = handler.getParkingList();

				//java List = > json
				Gson gson = new Gson();
				
				response.setContentType("application/json; charset=utf-8"); 
				String jsonStr = gson.toJson(parkingList);
		    	

		    	response.getWriter().append(jsonStr);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    }

}
