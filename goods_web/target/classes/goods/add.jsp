<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>预约详情页</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">

<link href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>


	<script type="text/javascript">
		/* 日期插件 */
		$(function(){
			$('.form_date').datetimepicker({
		        language:  'zh-CN',
		        weekStart: 1,
		        todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2,
				forceParse: 0
		    });
			//页面加载完成时,发送ajax,查询所有种类
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/goods/selectAllCategory",
                dataType: "json",
                success: function(data){
                    //使用id选择器获取下拉框对象
                    var cid = $("#cid")
					//循环遍历
                    $(data).each(function (index) {
						//拼接option下拉选项
						var category = "<option value='"+data[index].cid+"'>"+data[index].cname+"</option>"
						//添加到下拉框末尾
						cid.append(category)
                    })
                }
            }),
				$("#goodsName").blur(function () {
					if (this.value!=""){
					    $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/goods/selectByGoodsName?goodsName=" + $(this).val(),
                            success: function(data){
                                //展示
                                var msg = $("#checkName")
								//查询按钮状态
								var button = $("#onbutton")
								if (data){
                                    msg.html("<font color='red'>用户名可用</font>")
									button.prop("disabled",false)
								}else{
                                    msg.html("<font color='red'>用户名已存在</font>")
                                    button.prop("disabled",true)
								}
                            }
						})
					}
                })

		})

	</script>

</head>
<body>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading text-center">
				<h2>商品添加</h2>
			</div>
			<!-- 商品添加form表单 -->
			<form action="${pageContext.request.contextPath}/goods/addGoods" method="post">
			
				<div class="panel-body">
					<table class="table table-hover" >
						<tbody>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="goodsName">商品名称</label>
										<input type="text" name="goodsName" value="" class="form-control" id="goodsName" placeholder="商品名称">
									</div>
									<div id="checkName">
										<!-- 输入数量鼠标离焦后，此处展示商品名称是否可用提示信息 -->

									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="cid">商品分类</label>
										<select name="cid" id="cid" class="form-control">
											<option>-- 请选择分类 --</option>
										<%--	<option >蔬菜类</option>
											<option>水果类</option>
											<option>肉食类</option>--%>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="goodsNumber">商品数量</label> 
										<input type="text" name="goodsNumber" value="" class="form-control" id="goodsNumber" placeholder="商品数量">
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group">
										<label for="goodsPrice">商品价格</label> 
										<input type="text" name="goodsPrice" value="" class="form-control" id="goodsPrice" placeholder="商品价格">
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="control-group">
						                <label class="control-label">保质期</label>
						                <div class="controls input-append date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="guaranteePeriod" data-link-format="yyyy-mm-dd">
						                    <input size="26" type="text" value="" readonly>
						                    <span class="add-on"><i class="icon-remove"></i></span>
											<span class="add-on"><i class="icon-th"></i></span>
						                </div>
						                <!-- 保质期：选择日期会自动赋值给下面输入框value-->
										<input type="hidden" id="guaranteePeriod" name="GuaranteePeriod" value="" /><br/>
									</div>
								</div>

							</div>
						</tbody>

					</table>
				</div>
				<div class="panel-body text-center">

					<!-- 表单提交按钮 -->
					<button id="onbutton" type="submit" class="btn btn-primary btn-lg" >
						<span class="glyphicon glyphicon-copy" aria-hidden="true"></span>
						添加商品
					</button>

				</div>
			</form>
		</div>
	</div>
</body>


</html>
