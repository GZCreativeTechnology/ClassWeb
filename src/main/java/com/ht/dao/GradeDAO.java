package com.ht.dao;


import com.ht.bean.Grade;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by xiao-kang on 2017/2/25.
 */

@Repository
public interface GradeDAO extends BaseDAO<Grade,Integer>{
}
