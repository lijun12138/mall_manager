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
	function load_spu_list(pp_id){
		$.ajax({
			url : "load_spu_list.do",
			type : "post",
			data : {pp_id:pp_id,flbh1:$("#class_1_select_update_spu2").val(),flbh2:$("#class_2_select_update_spu2").val()},
			success : function(data){
				var content='<table   width="500px" border="1">';
				$.each(data,function(i,product){
					content +='<tr><td><img src="upload/image/'+product.shp_tp+'" width="50px"></td><td>'+product.shp_mch+'</td><td>'+product.shp_msh+'</td><td><a href="javascript:add_tab_nested(\'to_spu_update.do?id='+product.id+'\',\'商品spu更新\');">更新</a></td><td><a href="javascript:;" onclick=delete_spu('+product.id+',"'+product.shp_mch+'")>删除</a></td></tr>';
				});
				content+='</table>';
				$("#spu_list").html(content);
			}
		});
	}
	
	function delete_spu(spu_id,shp_mch){
		if(confirm("你确认要删除"+shp_mch+"吗？")){
			window.location.href="to_spu_delete.do?id="+spu_id;
		}else{
			return false;
		}
	}
	
</script>
	商品信息列表<br>
	分类静态列表<br>
		<jsp:include page="manager_spu_update_select.jsp"></jsp:include><br>
	商品信息列表区<br>
		<div id="spu_list"></div>
		
</body>
</html>