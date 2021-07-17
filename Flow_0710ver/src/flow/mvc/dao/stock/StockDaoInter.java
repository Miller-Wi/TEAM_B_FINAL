package flow.mvc.dao.stock;

import java.util.List;

import flow.mvc.vo.CompanyVO;
import flow.mvc.vo.StockLikeVO;


public interface StockDaoInter {

	// ������ -----
	public List<CompanyVO> companyList ();
	public CompanyVO companyDetail(String c_code);
	
	// �������� -----
	public int getLike(StockLikeVO slvo);
	public void addLike(StockLikeVO slvo);
	public void delLike(StockLikeVO slvo);
	public List<StockLikeVO> listLike(String slike_id);
 
}
