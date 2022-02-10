package com.lh.gmal.flume.interceptor;

import com.alibaba.fastjson.JSONException;
import org.mortbay.util.ajax.JSON;

public class JSONUtil {

    public static boolean validataJSON(String log){

        try {
            JSON.parse(log);
            return true;
        }catch (JSONException e){
            return false;
        }


    }
}
