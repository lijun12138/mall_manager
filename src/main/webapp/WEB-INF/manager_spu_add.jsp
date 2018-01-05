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
<title>硅谷商城</title>
</head>
<body>
<script type="text/javascript">
	function addInput(index){
		$("#spu_file_"+index).click();
		
		
	}
	
	function image_show(index){
		var file = $("#spu_file_"+index)[0].files[0];
		var url = window.URL.createObjectURL(file);
		
		$("#spu_image_"+index).attr("src",url);
		if(index==$(":file").length-1){
			add_image(index);
		}
		
	}
	
	function add_image(index){
		var image = '<img id="spu_image_'+(index+1)+'" style="cursor: pointer" width="100px" height="100px" src="image/upload_hover.png" onclick="addInput('+(index+1)+')">';
		var input = '<div style="display: none"> <input id="spu_file_'+(index+1)+'" type="file" name="files" onchange="image_show('+(index+1)+')"><br> </div>';
		
		$("#image_div").append(image+input);
		
	}
</script>
	添加商品信息<br>
	分类静态列表<br>
	<form action="manager_spu_add.do" method="post" enctype="multipart/form-data">
		<jsp:include page="manager_spu_select.jsp"></jsp:include>
		商品名称：<input type="text" name="shp_mch"><br>
		商品描述：<br><textarea rows="5" cols="30" name="shp_msh"></textarea><br>
		商品图片：<br>
		<div id="image_div">
			<img id="spu_image_0" style="cursor: pointer" width="100px" height="100px" src="image/upload_hover.png" onclick="addInput(0)">
			<div style="display: none">
				<input id="spu_file_0" type="file" name="files" onchange="image_show(0)"><br>
			</div>
		</div>
		<input type="submit" value="发布spu">
	</form>
</body>
</html>