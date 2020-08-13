package com.czxy;

import com.czxy.dao.CategoryMapper;
import com.czxy.pojo.Category;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 兰锦扬 on 2020/8/7.
 */
@Service
@Transactional
public class CategoryService {
    @Resource
    private CategoryMapper categoryMapper;

    public List<Category> selectAll() {
        List<Category> categories = categoryMapper.selectAll();
        return categories;
    }
}
