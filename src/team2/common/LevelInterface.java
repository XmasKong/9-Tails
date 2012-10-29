package team2.common;
/**
 * 사용자 또는 관리자의 등급을 체크하는 인터페이스
 * @author 서명희
 * @version 1.0, 2012.09.12
 */
public interface LevelInterface {
	/**
	 * 회원인지 관리자인지 체크
	 * @return 
	 */
	public int checkLevel();
	/**
	 * 회원 등급 체크
	 * @return
	 */
	public int checkMember();
	/**
	 * 관리자 등급 체크
	 * @return
	 */
	public int checkAdmin();
}
