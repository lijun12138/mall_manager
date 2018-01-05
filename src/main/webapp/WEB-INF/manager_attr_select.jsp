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
		
		$("#class_1_select_attr").append("<option>请选择</option>");
		$.getJSON("js/json2/class_1.js",function(data){
			$.each(data,function(i,json){
				$("#class_1_select_attr").append("<option value="+json.id+" >"+json.flmch1+"</option>");
			})
		})
		
	});
	
	
	function attr_get_class_2(class1){
		$.getJSON("js/json2/class_2_"+class1+".js",function(data){
			$("#class_2_select_attr").empty();
			$("#class_2_select_attr").append("<option>请选择</option>");
			$.each(data,function(i,json){
				$("#class_2_select_attr").append("<option value="+json.id+" >"+json.flmch2+"</option>");
			});
		});
	}
	
	
	
	
</script>
<title>硅谷商城</title>
</head>
<body>
	
	一级分类<select id="class_1_select_attr" name="flbh1" onchange="attr_get_class_2(this.value)"></select>
	二级分类<select id="class_2_select_attr" name="flbh2" onchange="attr_get_list(this.value)"></select><br>
	
	
</body>
</html>