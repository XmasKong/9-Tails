package team2.common;

import java.sql.SQLException;

/**
 * DB CRUD 사용을 위한 인터페이스
 * @author 서명희
 * @version 1.2, 2012.09.18
 */
public interface CommonInterface {
	/**
	 * 배열 형태의 데이터 추출 시 사용
	 */
	public void viewList(String type) throws SQLException;
	
	public void selectThing(String type) throws SQLException;
	public void insertThing(String type) throws SQLException;
	public void updateThing(String type) throws SQLException;
	public void deleteThing(String type) throws SQLException;
}