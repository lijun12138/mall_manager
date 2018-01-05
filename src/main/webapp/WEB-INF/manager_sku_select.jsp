<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function(){
		$("#class_1_select_sku2").append("<option>请选择</option>");
		$.getJSON("js/json2/class_1.js",function(data){
			$.each(data,function(i,json){
				$("#class_1_select_sku2").append("<option value="+json.id+" >"+json.flmch1+"</option>");
			})
		})
	});
	
	
	function sku_get_class_22(class1){
		$.getJSON("js/json2/class_2_"+class1+".js",function(data){
			$("#class_2_select_sku2").empty();
			$("#class_2_select_sku2").append("<option>请选择</option>");
			$.each(data,function(i,json){
				$("#class_2_select_sku2").append("<option value="+json.id+" >"+json.flmch2+"</option>");
			});
		});
		sku_get_trand_mark2(class1)
	}
	
	function sku_get_trand_mark2(value){
		$.getJSON("js/json2/tm_class_1_"+value+".js",function(data){
			$("#tm_select_sku2").empty();
			$("#tm_select_sku2").append("<option>请选择</option>");
			$.each(data,function(i,json){
				$("#tm_select_sku2").append("<option value="+json.id+">"+json.ppmch+"</option>");
			});
		});
	}
	
	
	function load_sku_list(pp_id){
		$.ajax({
			url : "load_spu_list.do",
			type : "post",
			data : {pp_id:pp_id,flbh1:$("#class_1_select_sku2").val(),flbh2:$("#class_2_select_sku2").val()},
			success : function(data){
				$("#shp_id").empty();
				$("#shp_id").append("<option>请选择</option>");
				$.each(data,function(i,json){
					$("#shp_id").append("<option value="+json.id+">"+json.shp_mch+"</option>")
				});
			}
		});
	}
	
	function load_attr(class_2){
		$.ajax({
			url : "get_attr_by_class_2.do",
			type : "post",
			data : {class_2:class_2},
			success : function(data){
				$("#manager_attr_list_inner_sku").html(data);
			}
			
		})
	}
</script>
<title>硅谷商城</title>
</head>
<body>
	
	一级分类<select id="class_1_select_sku2" name="flbh1" onchange="sku_get_class_22(this.value)"></select>
	二级分类<select id="class_2_select_sku2" name="flbh2" onchange="load_attr(this.value)">
		<option>请选择</option>
	</select>
	商标<select id="tm_select_sku2" name="pp_id" onchange="load_sku_list(this.value)">
		<option>请选择</option>
	</select>
	<select id="shp_id" name="shp_id" >
		<option>请选择</option>
	</select>
	
</body>
</html>