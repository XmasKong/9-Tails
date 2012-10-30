package team2.common;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class Mapper {
	private static SqlMapClient sqlMapper;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("team2/common/SqlMapConfig.xml");
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
		} catch (IOException e) {
			// Fail fast.
			throw new RuntimeException("a" + e, e);
		}
	}

	public static SqlMapClient getSqlMapper() {
		if (sqlMapper == null) {
			try {
				Reader reader = Resources.getResourceAsReader("team2/common/SqlMapConfig.xml");
				sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
				reader.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sqlMapper;
	}
}
