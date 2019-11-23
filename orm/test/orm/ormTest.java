package orm;

import java.util.List;

import model.MyObject;

import org.junit.Test;


	public class ormTest {
		@Test
		public  void test(){
			Orm<MyObject> orm = new Orm<MyObject>();
			MyObject MyObject;
			try {
				MyObject = (MyObject) orm.getBean("SELECT id,price,objectName,info FROM myobject",MyObject.class);
				System.out.println(MyObject);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			List<MyObject> MyObjectList;
			try {
				MyObjectList = orm.getBeanList("SELECT id,price,objectName,info FROM myobject",MyObject.class);
				for(MyObject u : MyObjectList){
					System.out.println(u);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

