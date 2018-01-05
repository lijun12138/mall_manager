<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
	<form action="do_spu_update.do" method="post" enctype="multipart/form-data">
		<table align="center" width="500px" border="1">
			<tr><td>商品名</td><td><input name="shp_mch" type="text" value="${product.shp_mch }"/> <input type="hidden" name="id" value="${product.id }"></td></tr>
			<tr><td>商品描述</td><td><textarea name="shp_msh" style="width:300px;height:100px;"> ${product.shp_msh }
            </textarea></td></tr>
			<tr><td>创建时间</td><td>${product.chjshj }</td></tr>
			<tr>
			<td>商品图片</td><td>
			<c:forEach items="${image_list }" var="image" varStatus="i" >
			<img id="spu_image_${i.index}"  width="100px" height="100px" src="upload/image/${image.url}" >
			<div style="display: none">
				<input id="spu_file_${i.index}" type="file" name="files" ><br>
			</div>
<%-- 			<img id="spu_image_${i.index}" style="cursor: pointer" width="100px" height="100px" src="upload/image/${image.url}" onclick="addInput(${i.index})"> --%>
<!-- 			<div style="display: none"> -->
<%-- 				<input id="spu_file_${i.index}" type="file" name="files" onchange="image_show(${i.index})"><br> --%>
<!-- 			</div> -->
			</c:forEach>
			<img id="spu_image_${fn:length(image_list)}" style="cursor: pointer" width="100px" height="100px" src="image/upload_hover.png" onclick="addInput(${fn:length(image_list)})">
			<div style="display: none">
				<input id="spu_file_${fn:length(image_list)}" type="file" name="files" onchange="image_show(${fn:length(image_list)})"><br>
			</div>
			
			</td></tr>
			<tr><td></td><td><input  type="submit" value="提交修改"></td></tr>
		</table>
	</form>
</body>
</html>