import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SimpleTest {

	public static void main(String[] args) throws Exception {
	// jdbc driver class loading ( driver 가 자신의 객체를 DriverManager에 등록)
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		
		
		
		// COnnection 객체 생성/획득 => java == mysql 연결 구조 (인증을 거쳐야 한다.)
		Connection con = 
				DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test?serverTimezone=UTC&useUniCode=yes&characterEncoding=UTF-8","root", "1234");
		
		// Connection 객체를 통해 PreparedStatement ( Statement ) 객체 생성 => SQL 수행 
		
		// 작업 1 : 등록 / 수정 / 삭제 => 정수로 결과를 받는다. ( 정수는 영향을 받은 row 수 return )
//		PreparedStatement pstmt = con.prepareStatement("insert into customer values (3, '삼길동2')");
//		int ret = pstmt.executeUpdate();
//		System.out.println(ret);
		
//		PreparedStatement pstmt = con.prepareStatement("update customer set customer_nm = '삼길동' where customer_id = ? ");
//		pstmt.setInt(1, 3); // 1번째 물음표를 3으로 바꿔라
//		int ret = pstmt.executeUpdate();
//		System.out.println(ret);
		
//		PreparedStatement pstmt = con.prepareStatement("delete from customer where customer_id = ? ");
//		pstmt.setInt(1, 3); // 1번째 물음표를 3으로 바꿔라
//		int ret = pstmt.executeUpdate();
//		System.out.println(ret);
	
		
		
		// 작업 2 : 조회 ( 목록, 상세조회 ) => ResultSet 객체를 통해서 결과를 받고, 그걸 이용해서 출력
		
		PreparedStatement pstmt = con.prepareStatement("select * from product");
		
		ResultSet rset = pstmt.executeQuery();
		while( rset.next() ) {
			System.out.println(
							rset.getInt("product_id") + " / " + 
							rset.getString("product_nm") + " / " + 
							rset.getInt("product_price"));
		}
		
//		PreparedStatement pstmt = con.prepareStatement("select count(*) cnt from customer");
	
//		ResultSet rset = pstmt.executeQuery();
//		if( rset.next() ) {
//			System.out.println(rset.getInt("cnt"));
//		}
		
		//rset.close();
		pstmt.close();
		con.close();
		// ResultSet, PreparedStatement, Connection 순으로 자원 반납 ( 특히 Connection )
		
		// 위 모든 과정에서 MYSQL 관련 작업 중 오류가 발생하면 MYSQL은 SQLException 객체를 발생한다.
	}

}
