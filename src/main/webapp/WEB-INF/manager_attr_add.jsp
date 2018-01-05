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
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>硅谷商城</title>
</head>
<body>
<script type="text/javascript">
	function add_attr(){
		var index = $("table .attr").length;
		var content = '<br><br> <table id="'+(index+1)+'" class="attr" border="1">';
		content += '<tr><td>属性名：<input type="text" name="attr_list['+(index+1)+'].shxm_mch" /></td><td></td><td><a href="javascript:add_attr_val('+(index+1)+');">添加值</a></td></tr>';
		content += '<tr><td>属性值：<input type="text" name="attr_list['+(index+1)+'].attr_value_list[0].shxzh_mch" /></td><td>单位：<input type="text" name="attr_list['+(index+1)+'].attr_value_list[0].shxzh" /></td><td><a href="javascript:remove_attr_val(this);">删除</a></td></tr>';
		content += '</table>';
		$("#attr").before(content);
	}
	
	function add_attr_val(index2){
		var attr_val=$("#"+index2+" tr").length;
		var content = '<tr><td>属性值：<input type="text" name="attr_list['+(index2)+'].attr_value_list['+(attr_val-1)+'].shxzh_mch" /></td><td>单位：<input type="text" name="attr_list['+(index2)+'].attr_value_list['+(attr_val-1)+'].shxzh" /></td><td><a href="javascript:remove_attr_val('+(attr_val-1)+');">删除</a></td></tr>';
		$("#"+index2+"").append(content);
	}
	
	function remove_attr_val(dom){
	}
	
</script>
	${class_2_name }属性添加页
	<a href="javascript:add_attr();">添加属性</a>
	<form  action="add_attr.do" method="post">
	<input type="hidden" value="${class_2_id }" name="class_2_id">
		<table id="0" border="1" class="attr">
			<tr><td>属性名：<input type="text" name="attr_list[0].shxm_mch" /></td><td></td><td><a href="javascript:add_attr_val(0);">添加值</a></td></tr>
			<tr><td>属性值：<input type="text" name="attr_list[0].attr_value_list[0].shxzh_mch" /></td><td>单位：<input type="text" name="attr_list[0].attr_value_list[0].shxzh" /></td><td><a href="javascript:remove_attr_val(0);">删除</a></td></tr>
		</table>
		<input id="attr" type="submit" value="提交">
	</form>
	
</body>
</html>