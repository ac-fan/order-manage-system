package com.qst.util;

/**
 * Class Utils
 *
 * @author sve1r
 * @description 工具类
 * @date 2020/10/6
 */


public class Utils {

    /**
     * 判断是否为空
     */
    public static Boolean isEmpty(String string) {
        if (string == null) {
            return true;
        } else if (string.trim().length() == 0) {
            return true;
        } else {
            return false;
        }
    }
}
