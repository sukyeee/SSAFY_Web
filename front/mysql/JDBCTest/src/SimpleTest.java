import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SimpleTest {

	public static void main(String[] args) throws Exception {
	// jdbc driver class loading ( driver �� �ڽ��� ��ü�� DriverManager�� ���)
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		
		
		
		// COnnection ��ü ����/ȹ�� => java == mysql ���� ���� (������ ���ľ� �Ѵ�.)
		Connection con = 
				DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test?serverTimezone=UTC&useUniCode=yes&characterEncoding=UTF-8","root", "1234");
		
		// Connection ��ü�� ���� PreparedStatement ( Statement ) ��ü ���� => SQL ���� 
		
		// �۾� 1 : ��� / ���� / ���� => ������ ����� �޴´�. ( ������ ������ ���� row �� return )
//		PreparedStatement pstmt = con.prepareStatement("insert into customer values (3, '��浿2')");
//		int ret = pstmt.executeUpdate();
//		System.out.println(ret);
		
//		PreparedStatement pstmt = con.prepareStatement("update customer set customer_nm = '��浿' where customer_id = ? ");
//		pstmt.setInt(1, 3); // 1��° ����ǥ�� 3���� �ٲ��
//		int ret = pstmt.executeUpdate();
//		System.out.println(ret);
		
//		PreparedStatement pstmt = con.prepareStatement("delete from customer where customer_id = ? ");
//		pstmt.setInt(1, 3); // 1��° ����ǥ�� 3���� �ٲ��
//		int ret = pstmt.executeUpdate();
//		System.out.println(ret);
	
		
		
		// �۾� 2 : ��ȸ ( ���, ����ȸ ) => ResultSet ��ü�� ���ؼ� ����� �ް�, �װ� �̿��ؼ� ���
		
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
		// ResultSet, PreparedStatement, Connection ������ �ڿ� �ݳ� ( Ư�� Connection )
		
		// �� ��� �������� MYSQL ���� �۾� �� ������ �߻��ϸ� MYSQL�� SQLException ��ü�� �߻��Ѵ�.
	}

}
