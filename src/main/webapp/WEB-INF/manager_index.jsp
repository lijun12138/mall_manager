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
	<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

	$(function(){
		var url='${url}';
		var title='${title}';
		if(url!=''&&title!=''){
			add_tab(url,title);
		};
// 		var url_nested='${url_nested}';
// 		var title_nested='${title_nested}';
// 		if(url_nested!=''&&title_nested!=''){
// 			add_tab_nested(url_nested,title_nested);
// 		}
	})
	
	
	
	function add_tab(url,title){
		var flag = $('#center').tabs('exists',title);
		if(flag){
			$('#center').tabs('select',title);
		}else{
			$('#center').tabs('add',{    
			    title:title,    
			    href:url,
			    cache:true,
			    closable:true,    
			    tools:[{    
			        iconCls:'icon-mini-refresh',    
			        handler:function(){    
			            alert('refresh');    
			        }    
			    }]    
			});  
		}
	}
	
	function add_tab_nested(url,title){
		var flag = $('#nested_center').tabs('exists',title);
		if(flag){
			$('#nested_center').tabs('select',title);
		}else{
			$('#nested_center').tabs('add',{    
			    title:title,    
			    href:url,
			    closable:true,    
			    tools:[{    
			        iconCls:'icon-mini-refresh',    
			        handler:function(){    
			            alert('refresh');    
			        }    
			    }]    
			});  
		}
	}
	
	
</script>
<title>硅谷商城</title>
</head>
<body class="easyui-layout">
 	<div data-options="region:'north',title:'North Title',split:true" style="height:60px;background:#B3DFDA;padding:10px"></div>   
    <div data-options="region:'south',title:'South Title',split:true" style="height:50px;background:#A9FACD;padding:10px;"></div>   
    <div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:100px;padding:10px;"></div>   
    <div data-options="region:'west',title:'West',split:true" style="width:200px;padding:10px;">
    	<div id="aa" class="easyui-accordion" style="width:170px;">
    		<div title="商品信息管理" data-options="iconCls:'icon-save'" style="overflow:auto;padding:10px;">
    			<ul id="tt" class="easyui-tree">   
    				<li>
    					<span>商品发布管理</span>
    					<ul>
    						<li><a href="javascript:add_tab('goto_spu.do','商品spu信息发布');" >商品spu信息发布</a><br></li>
    						<li><a href="javascript:add_tab('goto_sku.do','商品sku信息发布');">商品sku信息发布</a><br></li>
    						<li><a href="javascript:add_tab('goto_attr.do','商品属性信息发布');" >商品属性信息发布</a><br></li>
    					</ul>
    				</li>
    			</ul>
			 </div>
		</div>
    	<div id="bb" class="easyui-accordion" style="width:170px;">
    		<div title="缓存信息管理" data-options="iconCls:'icon-save'" style="overflow:auto;padding:10px;">
				<a href="javascript:add_tab('goto_spu.do','缓存信息管理');">缓存信息管理</a><br>
				<a href="javascript:add_tab('goto_spu.do','商品信息');">test</a>
			 </div>
    	</div>
    </div>   
    <div data-options="region:'center',title:'Center'">
		<div id="center" class="easyui-tabs" style="height: 700px"></div>
	</div>
	
</body>
</html>