package flow.mvc.dao.log;

import java.util.List;

import flow.mvc.vo.LogVO;

/**
 * @author ������ / 2021. 7. 21. / ���� 3:18:52
 */
public interface LogDaoInter {
	
	public void addlog(LogVO lvo);
	public List<LogVO> getCDetailLog();

}
