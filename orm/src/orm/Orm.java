package orm;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.JdbcUtils;

public class Orm<T> {

	
	//获得映射数据库后的一个装配好的实体对象bean
	public T getBean(String sql, Class<T> clazz) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			String[] colNames = getColNames(rs);

			T t = null;
			if (rs.next()) {
				t = clazz.newInstance();
				callSetter(t, colNames, rs);
			}
			return t;
		} finally {
			JdbcUtils.free(rs, ps, conn);
		}
	}
	

	//获得映射数据库后的装配好的实体对象bean List
	public List<T> getBeanList(String sql, Class<T> clazz) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtils.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			String[] colNames = getColNames(rs);

			List<T> objects = new ArrayList<T>();
			while (rs.next()) {
				T t = (T) clazz.newInstance(); //
				callSetter(t, colNames, rs);
				objects.add(t);
			}
			return objects;
		} finally {
			JdbcUtils.free(rs, ps, conn);
		}
	}


	//获取要映射的数据库表的列名
	private String[] getColNames(ResultSet rs) throws Exception {
		ResultSetMetaData rsmd = rs.getMetaData();
		int count = rsmd.getColumnCount();
		String[] colNames = new String[count];
		for (int i = 1; i <= count; i++) {
			colNames[i - 1] = rsmd.getColumnLabel(i);
		}
		return colNames;
	}
	
	//通过数据库表的列名加上‘set’，找到java bean类的set方法，利用反射机制进行装配
	private void callSetter(T object, String[] colNames, ResultSet rs)
			throws IllegalAccessException, InvocationTargetException,
			SQLException {
		Method[] ms = object.getClass().getMethods();
		for (int i = 0; i < colNames.length; i++) {
			String colName = colNames[i];
			String methodName = "set" + colName;
			for (Method m : ms) {
				if (methodName.equalsIgnoreCase(m.getName())) {
					m.invoke(object, rs.getObject(colName));
					break;
				}
			}
		}
	}
}
