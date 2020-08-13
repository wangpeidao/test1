package com.czxy.dao;

import com.czxy.pojo.Goods;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * Created by 兰锦扬 on 2020/8/7.
 */
@Mapper
public interface GoodsMapper extends tk.mybatis.mapper.common.Mapper<Goods> {

    @Select("select * FROM tbl_goods")
    @Results(value = {
            @Result(column = "goods_id",property = "goodsId"),
            @Result(column = "goods_name",property = "goodsName"),
            @Result(column = "goods_number",property = "goodsNumber"),
            @Result(column = "goods_price",property = "goodsPrice"),
            @Result(column = "guarantee_period",property = "guaranteePeriod"),
            @Result(column = "cid",property = "cid"),
            @Result(column = "cid",property = "category",one = @One(select = "com.czxy.dao.CategoryMapper.selectByPrimaryKey"))
    })
    public List<Goods> selectAllGoods();

    @Select("select * FROM tbl_goods where goods_name = #{goodsName}")
    Goods selectByGoodName(String goodsName);
}
