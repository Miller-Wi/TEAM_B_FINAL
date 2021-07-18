package flow.mvc.service;

import java.util.List;

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
			//lvo.setHit(UNLIKE); // ���ƿ� �����϶� �ٽ� �����·�
//			welfareDaoInter.welLikeUpdate(lvo);
//			welfareDaoInter.welLikeDelete(lvo);
			res = UNLIKE;
		} else {
			stockDaoInter.addLike(slvo);
//			lvo.setHit(LIKE); // �⺻ �����϶� ���ƿ��.
//			welfareDaoInter.welLikeUpdate(lvo);
//			welfareDaoInter.welLikeInsert(lvo);
			res = LIKE;
		}

		return res;
	}
  
}
