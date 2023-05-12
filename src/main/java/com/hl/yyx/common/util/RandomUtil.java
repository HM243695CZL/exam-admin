package com.hl.yyx.common.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Random;

/**
 * 生成纯数字
 */
public class RandomUtil {

    public static synchronized String generateUniqueKey() {
        Random random = new Random();
        Integer r = random.nextInt(900000000) + 100000000;
        Long timeMillis = System.currentTimeMillis();
        DateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
        String timeStr = sdf.format(new Date());
//        return  timeMillis + String.valueOf(r); // 13位毫秒+9位随机数
        return timeStr + r; // 10位时间+9位随机数
    }

    public static int[] getNoRepeatRandomList(int num, int length) {
        // 创建Random对象
        Random r = new Random();
        // 准备一个长度为num的一位数组
        int[] arr = new int[num];
        // 初始化让数组初始化为-1
        Arrays.fill(arr, -1);

        int index = 0;
        while (index < num) {
            int a = r.nextInt(length + 1); // [0, length]
            /**
             * 判断arr是否存在a
             * 若不存在，则添加
             */
            if (!contains(arr, a)) {
                arr[index++] = a;
            }
        }
        return arr;
    }


    /**
     * 判断数组中是否包含某个元素
     * @param arr 数组
     * @param key 元素
     * @return true 包含   false  不包含
     */
    public static boolean contains(int [] arr, int key) {
        for (int value : arr) {
            if (value == key) {
                return true;
            }
        }
        return false;
    }
}