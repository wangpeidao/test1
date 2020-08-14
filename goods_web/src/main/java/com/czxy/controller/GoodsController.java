package com.czxy.controller;

import com.czxy.CategoryService;
import com.czxy.GoodsService;
import com.czxy.pojo.Category;
import com.czxy.pojo.Goods;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 兰锦扬 on 2020/8/7.
 * 312213
 * 23213
 */
@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Resource
    private CategoryService categoryService;

    /**
     * 查询所有种类
     */
    @GetMapping("/selectAllCategory")
    public @ResponseBody List<Category> selectAllCategory(){
        // 兰锦扬修改位置1
        // 返回数据
        return categoryService.selectAll();
    }

    @Resource
    private GoodsService goodsService;

    /**
     * 添加产品
     */
    @PostMapping("/addGoods")
    public String addGoods(Goods goods){
        System.out.println(goods);
        try {
            goodsService.addGoods(goods);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "forward:/goods/add.jsp";
        }
        return "redirect:/goods/list.jsp";
    }

    /**
     * 通过用户名查询
     */
    @PostMapping("/selectByGoodsName")
    public @ResponseBody Boolean selectByGoodName(@RequestParam String goodsName){
        System.out.println(goodsName);
        boolean b = goodsService.selectByGoodName(goodsName);
        return b;
    }

    /**
     * 查询所有产品
     */
    @GetMapping("/selectAllGoods")
    public @ResponseBody List<Goods> selectAllGoods(){
        //查询
        List<Goods> goods = goodsService.selectAllGoods();
        //返回数据
        return goods;
    }

}
