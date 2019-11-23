package util;
import java.util.ResourceBundle;


//配置文件读取类
public class PropertiesUtil {

    private static final ResourceBundle bundle = java.util.ResourceBundle.getBundle("config");

    //取配置文件中的值
    public static String readValue(String key) {
        return bundle.getString(key);
    }

}
