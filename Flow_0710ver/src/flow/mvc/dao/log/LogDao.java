package flow.mvc.dao.log;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import flow.mvc.vo.LogVO;

/**
 * @author ������ / 2021. 7. 21. / ���� 3:20:30
 */
@Repository
public class LogDao implements LogDaoInter{
	
	@Autowired
	private SqlSessionTemplate ss;


	@Override
	public void addlog(LogVO lvo) {
		ss.insert("log.addlog", lvo);
	}

}
