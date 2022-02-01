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
public class Hivecontroller {
    @Autowired
    @Qualifier("jdbcTemplate")
    private JdbcTemplate jdbcTemplate;

    @RequestMapping("/databases")
    public String databaseslist0() {
        //按照序号查找期间的内容
        String sql1 = "select * from (select row_number() over(partition by 1 ) as xuhao,a.* from job_post a) b where b.xuhao between 10 and 100";
        String sql = "show databases";
        List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
        return JSON.toJSONString(list);
    }

    //默认
    @RequestMapping("/default")
    public String databaseslist() {
        String sql = "show tables";
        List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
        return JSON.toJSONString(list);
    }
    @RequestMapping(value="/default/{table}/{num1}/{num2}")
    public String findDepatment1(@PathVariable String table,@PathVariable String num1,@PathVariable String num2){
        //拼接查找表
        String sql = "select * from (select row_number() over(partition by 1 ) as xuhao,a.* from "+table+" a) b where b.xuhao between "+num1+" and "+num2+"";
        List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
        return JSON.toJSONString(list);
    }
}


