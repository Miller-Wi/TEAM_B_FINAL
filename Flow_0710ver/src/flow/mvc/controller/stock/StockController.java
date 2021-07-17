package flow.mvc.controller.stock;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import flow.mvc.service.StockService;
import flow.mvc.vo.CompanyVO;
import flow.mvc.vo.StockLikeVO;

 

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
	
	@GetMapping("/companyDetail")
	public ModelAndView companyDetail(String c_code, String slike_id) {
		// ȸ�� ������ �޾ƿ���-----
		System.out.println("StockController - companyDetail");
		System.out.println("Controller param : " + c_code);
		ModelAndView mav = new ModelAndView();
		CompanyVO cvo = stockService.companyDetail(c_code);
		
		// ���ƿ� ���� �޾ƿ���-----
		String slike_code = c_code;
		int status = stockService.LikeStatus(slike_code, slike_id);
		System.out.println(status);
		
		mav.addObject("status", status);
		mav.setViewName("stock/companyDetail");
		return mav;
	}
	
  

}
