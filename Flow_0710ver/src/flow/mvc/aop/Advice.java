package flow.mvc.aop;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import flow.mvc.controller.member.MemberController;

/**
 * @author ������ / 2021. 7. 11. / ���� 9:06:16
 */
@Component
@Aspect
public class Advice {
	
	private static final Log LOG = LogFactory.getLog( Advice.class );
	  	
	private void printParam(ProceedingJoinPoint pjp) {
		Object[] param = pjp.getArgs();
		if (param.length != 0) {
			int length = param.length;
			for (int i = 0; i < length; i++) {
				LOG.info("| "+(i+1)+"��° param: "+param[i]);
			}
		}
	}

	@Around(value = "execution(* flow.mvc.controller.*.*.*(..))")
	public Object logAdvice(ProceedingJoinPoint pjp) throws Throwable {

		String methodName = pjp.getSignature().getName();
		String[] classNames = pjp.getTarget().getClass().getCanonicalName().split("\\.");
		String className = classNames[classNames.length-1];		
		HttpSession session = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getRequest().getSession();
		LOG.info("=================================================");
		LOG.info("| [LOG]  "+className+" :: " + methodName + " ȣ��");
		String sessionID = (String) session.getAttribute("sessionID");
		if ( sessionID != null)
		LOG.info("| [B Y]  "+ sessionID);
		printParam(pjp);
		Object rev = pjp.proceed();
		if (rev != null) {
			LOG.info("| returnv :: " + rev);
		}
		printParam(pjp);
		LOG.info("| [LOG]  "+className+" :: " + methodName + " ����");
		sessionID = (String) session.getAttribute("sessionID");
		if ( sessionID != null)
		LOG.info("| [B Y]  "+ sessionID);
		LOG.info("=================================================");
		return rev;
	}
}
