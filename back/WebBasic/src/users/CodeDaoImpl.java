package users;

import java.util.ArrayList;
import java.util.List;

public class CodeDaoImpl {

	List<CodeDto> getCodeList(String code) {
		List<CodeDto> list = new ArrayList<>();
		
		// Connection -> PreparedStatement => ResultSet
		// select code, code_name from code where group_code = ?
		// return 되는 code, code_name => codeDto 여러개를 list에 담아서 return 
		return list;
	}
}
