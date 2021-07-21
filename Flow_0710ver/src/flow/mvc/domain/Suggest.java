package flow.mvc.domain;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import flow.mvc.service.StockService;
import flow.mvc.vo.CompanyVO;

/**
 * @author ������ / 2021. 5. 7. / ���� 10:00:01
 */
@Component
public class Suggest {
//	private static Suggest suggest;
//	private List<CompanyVO> clist;
	@Autowired
	private StockService stockService;


	public List<Map<String, String>> getSuggest(String key) {
		List<CompanyVO> clist = stockService.companyList();
		List<Map<String, String>> sugList = new ArrayList<>();
		// ����ڰ� ������ ���� �Ǵ� ���ڿ�(n)�� ��/�ҹ��� ���о��� �ҹ��ڷ�
		key = key.toLowerCase();
		for (CompanyVO vo : clist) {
			Map<String, String> map = new HashMap<String, String>();
			String c_name = vo.getC_name();
			String c_code = vo.getC_code();
			map.put("c_name", c_name);
			map.put("c_code", c_code);
			String compare = c_name.toLowerCase();
			// ù���� ���ؼ� �˻����� ���ڰ� ��ġ�ϸ�
			if (compare.startsWith(key)) {
				sugList.add(map);
			}
		}
		return sugList;
	}

}
