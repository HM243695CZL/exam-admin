package com.hl.yyx.common.util;

import com.hl.yyx.modules.ums.model.UmsAdmin;

public class UserThreadLocalUtil {

    private static final ThreadLocal<UmsAdmin> LOCAL = new ThreadLocal<>();

    public static void put(UmsAdmin user) {
        LOCAL.set(user);
    }

    public static UmsAdmin get() {
        return LOCAL.get();
    }

    public static void remove() {
        LOCAL.remove();
    }

}