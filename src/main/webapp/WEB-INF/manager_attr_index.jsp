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

	/* function attr_get_list(class_2){
		$.ajax({
			url : "attr_list.do",
			type : "post",
			data : {class_2:class_2},
			success : function(data){
				$("#attr_list").html(data);
			}
		})
	} */
	
	function attr_get_list(class_2){
		$('#attr_list').datagrid({    
		    url: "attr_list_json.do",
		    queryParams: {
		    	class_2:class_2
			},
		    columns:[[    
		        {field:'id',title:'属性编号',width:100},    
		        {field:'shxm_mch',title:'属性名称',width:100},    
		        {field:'chjshj',title:'创建时间',width:100,
		        	formatter: function(value,row,index){
		        		var date = new Date(value);
		        		return date.toLocaleDateString();
					}	
		        },
		        {field:'attr_value_list',title:'属性值',width:300,
		        	formatter: function(value,row,index){
		        		var name ='';
						$(value).each(function(i,json){
							name += " "+json.shxzh+json.shxzh_mch;
						});
						return name;
					}
		        }
		    ]]    
		});  
	}

	function goto_attr_add(){
		var class_2_id=$("#class_2_select_attr").val();
		var class_2_name=$("#class_2_select_attr option:selected").text();
		//window.location.href="goto_attr_add.do?class_2_id="+class_2_id+"&class_2_name="+class_2_name;
		add_tab_nested('goto_attr_add.do?class_2_id='+class_2_id+'&class_2_name='+class_2_name,'商品属性添加');
	}

</script>
		<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'north',split:true" style="height:50px">
					<jsp:include page="manager_attr_select.jsp"></jsp:include>
					<hr>
				</div>
				<div data-options="region:'west',split:true" style="width:100px">
					<a href="javascript:goto_attr_add();" >添加属性</a>
				</div>
				<div  data-options="region:'center',border:false">
					<div id="nested_center" class="easyui-tabs">
						<div id="attr_list" style="width: 150px" title="属性列表区">
						</div>
					</div>
				</div>
		</div>
		
		
</body>
</html>