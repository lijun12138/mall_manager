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
		/* $("#class_1_select_update_spu").append("<option>请选择</option>");
		$.getJSON("js/json/class1.js",function(data){
			$.each(data,function(i,json){
				$("#class_1_select_update_spu").append("<option value="+json.id+" >"+json.flmch1+"</option>");
			})
		}) */
		
		$("#class_1_select_update_spu2").append("<option>请选择</option>");
		$.getJSON("js/json2/class_1.js",function(data){
			$.each(data,function(i,json){
				$("#class_1_select_update_spu2").append("<option value="+json.id+" >"+json.flmch1+"</option>");
			})
		})
		
	});
	
	/* function update_spu_get_class_2(value){
		$.getJSON("js/json/class2.js",function(data){
			$("#class_2_select_update_spu").empty();
			$.each(data,function(i,json){
				if(json.flbh1==value){
					$("#class_2_select_update_spu").append("<option value="+json.id+" >"+json.flmch2+"</option>");
				}
			});
		});
		
		update_spu_get_trand_mark(value)
	}
	
	
	function update_spu_get_trand_mark(value){
		$.getJSON("js/json/tradMark.js",function(data){
			$("#tm_select_update_spu").empty();
			$.each(data,function(i,json){
				if(json.flbh1==value){
					$("#tm_select_update_spu").append("<option value="+json.id+" >"+json.ppmch+"</option>");
				}
			});
		});
	} */
	
	
	function update_spu_get_class_22(class1){
		$.getJSON("js/json2/class_2_"+class1+".js",function(data){
			$("#class_2_select_update_spu2").empty();
			$("#class_2_select_update_spu2").append("<option>请选择</option>");
			$.each(data,function(i,json){
				$("#class_2_select_update_spu2").append("<option value="+json.id+" >"+json.flmch2+"</option>");
			});
		});
		update_spu_get_trand_mark2(class1)
	}
	
	function update_spu_get_trand_mark2(value){
		$.getJSON("js/json2/tm_class_1_"+value+".js",function(data){
			$("#tm_select_update_spu2").empty();
			$("#tm_select_update_spu2").append("<option>请选择</option>");
			$.each(data,function(i,json){
				$("#tm_select_update_spu2").append("<option value="+json.id+">"+json.ppmch+"</option>");
			});
		});
	}
	
	
</script>
<title>硅谷商城</title>
</head>
<body>
	<!-- 一级分类<select id="class_1_select_update_spu" onchange="update_spu_get_class_2(this.value)"></select>
	二级分类<select id="class_2_select_update_spu"></select>
	商标<select id="tm_select_update_spu"></select>
	<br> -->
	
	一级分类<select id="class_1_select_update_spu2" name="flbh1" onchange="update_spu_get_class_22(this.value)"></select>
	二级分类<select id="class_2_select_update_spu2" name="flbh2">
		<option>请选择</option>
	</select>
	商标<select id="tm_select_update_spu2" name="pp_id" onchange="load_spu_list(this.value)">
		<option>请选择</option>
	</select>
	
</body>
</html>