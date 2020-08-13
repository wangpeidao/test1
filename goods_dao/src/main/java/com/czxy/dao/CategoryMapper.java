package com.czxy.dao;

import com.czxy.pojo.Category;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by 兰锦扬 on 2020/8/7.
 */
@Mapper
public interface CategoryMapper extends tk.mybatis.mapper.common.Mapper<Category> {
    public List<Category> selectAll();
}
