package flow.mvc.controller.stock;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import flow.mvc.service.StockService;
import flow.mvc.vo.CompanyVO;


@Controller
public class StockController {

	@Autowired
	private StockService stockService;
 

	@RequestMapping("/companyList")
	public ModelAndView companyList() {
		System.out.println("StockController - companyList");
		ModelAndView mav = new ModelAndView();
		List<CompanyVO> clist = stockService.companyList();
		
		mav.addObject("clist", clist);
		mav.setViewName("stock/companyList");
		return mav;
	}
	
	@GetMapping(value = { "/companyDetail" })
	public ModelAndView companyDetail(String c_code, String slike_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		CompanyVO cvo = stockService.companyDetail(c_code);

		// ���ƿ� ���� �޾ƿ���-----
		int status = stockService.LikeStatus(c_code, slike_id);

		mav.addObject("cvo", cvo);
		mav.addObject("likeStatus", status);
		
		// ���� ���� �޾ƿ���
		List<Map<String, String>> list = getCompanyNews(c_code);
		mav.addObject("list", list);
		mav.setViewName("stock/companyDetail");
		return mav;
	}

	private List<Map<String,String>> getCompanyNews(String c_code) throws Exception {
		String url = "https://finance.naver.com/item/news_news.nhn?code="+c_code;
		String selector = "body > div > table.type5 > tbody > tr > td.title > a";
		Document doc = null;

		try {
			// 1. get����� URL�� �����ؼ� ������ ���� doc�� ��´�.
			doc = Jsoup.connect(url).get(); 
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		// 2. doc���� selector�� ������ ������ Elementes Ŭ������ ��´�.
		Elements titles = doc.select(selector); 

		List<Map<String,String>> list = new ArrayList<Map<String,String>>(); 
		int count = 0;
		for (Element title : titles) { 
			Map<String,String> map = new HashMap<>(); 
			map.put("title", title.text());
			String href = "https://finance.naver.com"+title.attr("href");
			map.put("href",href);
			// ���� �̹��� �������� �� Ŀ��Ʈ..
			doc = Jsoup.connect(href).get();
			String selector2 = "span.end_photo_org > img";
			Element img = doc.select(selector2).first();
			if (img != null) map.put("img",img.attr("src"));
			// img == null �϶� �⺻ �̹��� �߰��ؾߵ�
			list.add(map);
			// �ִ� 3�� �޾ƿ���
			count += 1;
			if (count == 3)break;
		}
		return list;
	}
	
	
	@GetMapping(value="/likeStatus")
	public @ResponseBody int likeStatus(String slike_code, String slike_id) {
		int res = stockService.LikeUpdate(slike_code, slike_id);
		
		return res;
	}
	
	
	// �˻�------------	
	@RequestMapping("/searchform")
	public String suggestClient() {
		return "search/searchForm";
	}
	
	@GetMapping("/search")
	public String suggestAction(Model m, String key) {
		 List<Map<String,String>> suggests = getSuggest(key);
		// �����͸� JSON���� �����ϴ� �۾�
		// JSON���� �����ؼ� ���� �ϴ¹�� ���� ���� *****
		if(suggests != null) {
			JSONArray arr = new JSONArray();
			for(Map<String,String> e : suggests) {
				arr.add(e);
			}
			// JSONArray�� ����
			m.addAttribute("list",arr.toJSONString(suggests));
		}
		return "search/ajax/search";
	}
	
	
	private List<Map<String, String>> getSuggest(String key) {
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
