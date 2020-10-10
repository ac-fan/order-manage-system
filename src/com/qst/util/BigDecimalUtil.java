package com.qst.util;

import java.math.BigDecimal;


public class BigDecimalUtil {

    enum BigDecimalOprations {
        add, subtract, multiply, divide
    }

    public static BigDecimal OperationASMD(Object numOne, Object numTwo, BigDecimalOprations bigDecimalOpration, int scale, int roundingMode) throws Exception {
        BigDecimal num1 = new BigDecimal(String.valueOf(numOne)).setScale(scale, roundingMode);
        BigDecimal num2 = new BigDecimal(String.valueOf(numTwo)).setScale(scale, roundingMode);
        switch (bigDecimalOpration) {
            case add:
                return num1.add(num2).setScale(scale, roundingMode);
            case subtract:
                return num1.subtract(num2).setScale(scale, roundingMode);
            case multiply:
                return num1.multiply(num2).setScale(scale, roundingMode);
            case divide:
                return num1.divide(num2, scale, roundingMode);
        }
        return null;
    }
}