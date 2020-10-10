import com.qst.dao.BaseDao;

/**
 * Class test
 *
 * @author sve1r
 * @description
 * @date 2020/10/3
 */


public class test {
    public static void main(String[] args) {
        BaseDao.init();
        System.out.println(BaseDao.getConnection());
    }
}
