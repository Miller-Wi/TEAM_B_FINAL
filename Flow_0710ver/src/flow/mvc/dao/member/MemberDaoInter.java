package flow.mvc.dao.member;

import flow.mvc.vo.MemberVO;

public interface MemberDaoInter {

	public MemberVO loginProcess(MemberVO mvo);

	public MemberVO detailMem(String userID);

	public MemberVO findID(MemberVO mvo);

	public MemberVO findPWD(MemberVO mvo);

	public void changePWD(MemberVO mvo);

	public void memberUpdate(MemberVO mvo);

	public void delMem(String m_id);

	public int userPwdChk(MemberVO mvo);

}