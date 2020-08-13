package com.czxy;

import com.czxy.dao.GoodsMapper;
import com.czxy.pojo.Goods;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 兰锦扬 on 2020/8/7.
 */
@Service
@Transactional
public class GoodsService {
    @Resource
    private GoodsMapper goodsMapper;

    public List<Goods> selectAllGoods() {
        List<Goods> goods = goodsMapper.selectAllGoods();
        System.out.println(goods);
        return goods;
    }


    public void addGoods(Goods goods) {
        if (goods!=null){
            goodsMapper.insert(goods);
        }
    }

    public boolean selectByGoodName(String goodsName) {
        Goods goods = goodsMapper.selectByGoodName(goodsName);
        if (goods==null){
            return true;
        }else {
            return false;
        }
    }
}
