package flow.mvc.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;

import flow.mvc.dao.stock.StockDaoInter;
import flow.mvc.vo.CompanyVO;
import flow.mvc.vo.StockLikeVO;


@Service
@Transactional
public class StockService {

	private final static int LIKE = 1;
	private final static int UNLIKE = -1;
	
	@Autowired
	private StockDaoInter stockDaoInter;

	public List<CompanyVO> companyList() {
		return stockDaoInter.companyList();
	}

	public CompanyVO companyDetail(String c_code) {
		return stockDaoInter.companyDetail(c_code);
	}
	
	// ����� �ּ� �޾ƿ��� (�۾���)
	public void companyMap(String c_code) {
		System.out.println("Service - companyMap : " + c_code);
		String key = "5e52b565665c28032cdf2b64260b2a80313b2a64";
		String url = "https://opendart.fss.or.kr/api/company.json?crtfc_key="+key+"&corp_code=00126380";
		
	}
	
	// ���� �ǽð� ���� �޾ƿ���
	public String stockPrice(String c_code) {

		String url = "https://finance.naver.com/item/main.nhn?code="+c_code;
		String selector = "#chart_area > div.rate_info > div > p.no_today > em > .blind";
		Document doc = null;

	      try {
	         doc = Jsoup.connect(url).get(); // 1. get����� URL�� �����ؼ� ������ ���� doc�� ��´�.
	      } catch (IOException e) {
	         System.out.println(e.getMessage());
	      }

	      Elements ele = doc.select(selector); // 2. doc���� selector�� ������ ������ Elementes Ŭ������ ��´�.
	      String price = ele.text();
	      System.out.println(price);
	      return price;
	
	}
	
	

	// �� �������� (���ƿ�)
	public List<CompanyVO> listLike(String slike_id) {
		List<CompanyVO> slist = stockDaoInter.listLike(slike_id);
 
		
		String selector = "#chart_area > div.rate_info > div > p.no_today > em > .blind";
		Document doc = null;
	 
		for (CompanyVO c : slist) {
			String url = "https://finance.naver.com/item/main.nhn?code="+c.getC_code();
			
			 try {
		         doc = Jsoup.connect(url).get(); // 1. get����� URL�� �����ؼ� ������ ���� doc�� ��´�.
		      } catch (IOException e) {
		         System.out.println(e.getMessage());
		      }
		
		Elements ele = doc.select(selector); // 2. doc���� selector�� ������ ������ Elementes Ŭ������ ��´�.
		String price = ele.text();
		c.setC_price(price);
 
		}
	
	return slist;
	}
	 
	
	
	// ���ƿ� �޾ƿ���
	public int LikeStatus(String slike_code, String slike_id) {
		StockLikeVO slvo = new StockLikeVO();
		slvo.setSlike_code(slike_code); 
		slvo.setSlike_id(slike_id);
		
		int res = stockDaoInter.getLike(slvo);
		return res;
	}

 
	// ���ƿ� ������ �� 
	public @ResponseBody int LikeUpdate(String c_code, String slike_id) {
		StockLikeVO slvo = new StockLikeVO();
		slvo.setSlike_code(c_code); 
		slvo.setSlike_id(slike_id); 
		int res = stockDaoInter.getLike(slvo);
		
		if (res != 0) {
			stockDaoInter.delLike(slvo);
			res = UNLIKE;
		} else {
			stockDaoInter.addLike(slvo);
			res = LIKE;
		}

		return res;
	}
  
}
