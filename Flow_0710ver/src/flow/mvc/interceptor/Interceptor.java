package flow.mvc.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * @author ������ / 2021. 7. 15. / ���� 4:07:07
 */
public class Interceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("=========================preHandle executed");
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("sessionID");
          
        if ( obj == null ){
            // �α����� �ȵǾ� �ִ� �����϶� �α��� ������ �ٽ� ��������
        	PrintWriter printwriter = response.getWriter();
        	printwriter.print("<script>alert('�α����������� �̵�'); location.href='/Flow_0710ver/loginForm';</script>");
        	printwriter.flush();
        	printwriter.close();
        	// preHandle�� return���� ��û�� ��Ʈ�ѷ��� ������ ������
            return false; 
        }
          
        return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		super.postHandle(request, response, handler, modelAndView);
	}

	
}
