package flow.mvc.controller.stockportfolio;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StockPortfolioController {
	
	@RequestMapping("/estiInvestForm")
	public String estimationInvestForm() {
		System.out.println("���� ���� ������ �̵�");
		return "stock/estiInvestForm";
	}
}
