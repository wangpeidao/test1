package com.czxy.controller;

import com.czxy.CategoryService;
import com.czxy.pojo.Category;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 兰锦扬 on 2020/08/12.
 * 测试用6666666666666666666666666666
 */
@RestController
@RequestMapping("/good2s")
public class TestGoodsController {

    @Resource
    private CategoryService categoryService;

    /**
     * 查询所有种类
     */
    @GetMapping("/selectAllCategory")
    public List<Category> selectAllCategory(){
        //查询
        List<Category> categories = categoryService.selectAll();
        //返回数据
        return categories;
    }

}
