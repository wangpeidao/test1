package com.czxy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by 兰锦扬 on 2020/8/7.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tbl_category")
public class Category {
    @Id
    private String cid;
    private String cname;
}
