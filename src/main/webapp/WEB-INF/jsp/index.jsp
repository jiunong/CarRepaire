<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<title>汽车维修管理系统</title>
<script src="${ctx}/static/jquery/1.8.0/jquery.min.js"></script>
<script src="${ctx}/static/layui/layui.all.js"></script>
<link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
<link rel="shortcut icon" type="image/x-icon" href="static/images/icon.ico">
</head>
<body class="layui-layout-body">
<input id="ctx" type="hidden" value="${ctx}" />
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
 
    <div 
   	 <c:if test="${userOn.uLevel eq 1}"> onclick="opration('/order/home');" </c:if>
    style="cursor: pointer;"  class="layui-logo">汽车维修管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
   
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="static/images/icon.ico" class="layui-nav-img">${userOn.uName}
        </a>
       <!--  <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
        </dl> -->
      </li>
      <li class="layui-nav-item"><a href="${ctx}/user/out">退了</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <c:if test="${userOn.uLevel eq 1}">
        	<li class="layui-nav-item">
        		<a href="javascript:void(0);">订单管理</a>
        		<dl class="layui-nav-child">
		          <dd><a href="javascript:void(0);" onclick="opration('/order/list?state=0');">未处理订单</a></dd>
		          <dd><a href="javascript:void(0);" onclick="opration('/order/list?state=1');">处理中订单</a></dd>
		          <dd><a href="javascript:void(0);" onclick="opration('/order/list?state=2');">已完成订单</a></dd>
		        </dl>
        	</li>
       		<li class="layui-nav-item"><a href="javascript:void(0);" onclick="opration('/worker/list');">员工管理</a></li>
       		<li class="layui-nav-item"><a href="javascript:void(0);" onclick="opration('/station/list');">机位管理</a></li>
       		<li class="layui-nav-item"><a href="javascript:void(0);" onclick="opration('/user/list');">用户管理</a></li>
       		<li class="layui-nav-item"><a href="javascript:void(0);" onclick="opration('/part/list');">零件管理</a></li>
<!--         	<li class="layui-nav-item"><a href="javascript:void(0);" onclick="opration('/part/list');">入库管理</a></li> -->
        </c:if> 
        <c:if test="${userOn.uLevel eq 0}">
        	 <li class="layui-nav-item"><a href="javascript:void(0);" onclick="opration('/car/list');">我的车辆</a></li>
        	 <li class="layui-nav-item"><a href="javascript:void(0);" onclick="opration('/order/toPreOrder');">预约订单</a></li>
        	 <li class="layui-nav-item"><a href="javascript:void(0);" onclick="opration('/order/userOrder');">历史订单</a></li>
        </c:if> 
      </ul>
      
    </div>
    
  </div>
  <input type="hidden" value="${userOn.uLevel}" id="userLevel">
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div id="content" style="padding: 15px;"></div>
  </div>
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © <%= new Date()%>
  </div>
</div>
<script src="${ctx}/static/js/index.js"></script>
<script>
layui.use('element', function(){
  var element = layui.element;
});
$(function(){
	var userLevel= $("#userLevel").val();
	if(userLevel==0){
		var uri='${ctx}/car/list';
		$.ajax({
			url:uri,
			type : "POST", // 请求方式
			success:function(data){
				$("#content").html(data);
			}
		});
	}else if(userLevel==1){//管理员登陆模式
		var uri='${ctx}/order/home';
		$.ajax({
			url:uri,
			type : "POST", // 请求方式
			success:function(data){
				$("#content").html(data);
			}
		});
	}
});
</script>
</body>
</html>
