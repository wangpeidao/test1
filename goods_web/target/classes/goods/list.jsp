<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>图书列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
	<link href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" media="screen">

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>

	<script type="text/javascript">
        $(function(){
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/goods/selectAllGoods",
                dataType: "json",
                success: function(data){
                    //使用id选择器获取下拉框对象
                    var goods = $("#goodsList");

                    //循环遍历
                    $(data).each(function (index) {
                        console.info(data[index].category)
                        //拼接option下拉选项
                        var category = "<tr>" +
										"<td>"+data[index].goodsName+"</td>" +
										"<td>"+data[index].category.cname+"</td>" +
										"<td>"+data[index].goodsNumber+"</td>" +
										"<td>"+data[index].goodsPrice+"</td>" +
										"<td>"+data[index].guaranteePeriod+"</td>" +
							           "</tr>";
                        //添加到下拉框末尾
                        goods.append(category)
                    })
                }
            });
		})
	</script>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>商品列表</h2>
        </div>

        <div class="panel-body">
            <table class="table table-hover">
                <thead>
					<tr>
						<th>商品名称</th>
						<th>所属分类</th>
						<th>商品数量</th>
						<th>商品价格</th>
						<th>保质期</th>
					</tr>
                </thead>
                <tbody id="goodsList">
					<%--<tr>--%>
						<%--<td>梅干菜</td>--%>
						<%--<td>蔬菜类</td>--%>
						<%--<td>10</td>--%>
						<%--<td>15.99</td>--%>
						<%--<td>2020-01-01</td>--%>
						<%--<td>--%>
						 <%--<a href="#">修改</a>--%>
 						 <%--<a href="#">删除</a>--%>
						<%--</td>--%>
					<%--</tr>--%>

                </tbody>
            </table> 
        </div>
    </div>
</div>
</body>
</html>

