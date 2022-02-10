package com.example.demo.hivecontroller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
public class Hivecontroller1 {
    @Autowired
    @Qualifier("jdbcTemplate1")
    private JdbcTemplate jdbcTemplate;


    @RequestMapping ("/show")
    public String databaseslist() {
        //显示所有表
        String sql = "show tables";
        List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
        return JSON.toJSONString(list);
    }

    @RequestMapping(value="/show/{table}/{num}")
    public String findDepatment1(@PathVariable String table,@PathVariable String num){
        //查找表的内容
        String sql = "select * from "+table+" limit "+num+"";
        List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
        return JSON.toJSONString(list);
    }


}


