package com.czxy.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by 兰锦扬 on 2020/8/7.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tbl_goods")
public class Goods {
    @Id
    @Column(name = "goods_id")
    private Integer goodsId;
    @Column(name = "goods_name")
    private String goodsName;
    @Column(name = "goods_number")
    private Integer goodsNumber;
    @Column(name = "goods_price")
    private Double goodsPrice;
    @Column(name = "guarantee_period")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private String guaranteePeriod;
    private String cid;

    private Category category;
}
