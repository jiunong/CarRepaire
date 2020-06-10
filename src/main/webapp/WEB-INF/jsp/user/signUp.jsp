<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>新用户注册</title>
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script src="${ctx}/static/jquery/1.8.0/jquery.min.js"></script>
<script src="${ctx}/static/layui/layui.all.js"></script>
<link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
<link rel="shortcut icon" type="image/x-icon" href="static/images/icon.ico">
</head>
<body style="padding-left: 20px;padding-top: 20px;padding-bottom: 20px;padding-right: 20px;">
<blockquote class="layui-elem-quote layui-text">汽车维修系统新用户注册</blockquote>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>填写基本信息</legend>
</fieldset>
<form class="layui-form layui-form-pane" id="data">
  <div class="layui-form-item">
    <label class="layui-form-label">用户名</label>
    <div class="layui-input-inline">
      <input type="text" name="uName" lay-verify="name"  autocomplete="off" placeholder="请输入用户名" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input type="password" name="uPass" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">验证手机</label>
      <div class="layui-input-inline">
        <input type="tel" name="uPhone" lay-verify="required|phone" autocomplete="off" class="layui-input"  placeholder="请输入手机号" >
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label" style="margin-bottom: 10px;">居住地</label>
    <div class="layui-input-inline">
       <input type="text" name="uLoc" lay-verify="required" autocomplete="off" 
       class="layui-input"  placeholder="请输入家庭住址" >
    </div>
    <hr class="layui-bg-blue">
</form>
  <div >
    <button class="layui-btn" lay-submit="" lay-filter="demo2">注册</button>
   <a href="javascript:void(0);" onclick="goBack()">
  	<i class="layui-icon">返回</i> 
  </a>
  </div>
<script>
function goBack(){
	 window.location.href='${ctx}';
};
layui.use(['form', 'layedit'], function(){
  var form = layui.form
  ,layer = layui.layer;
  //自定义验证规则
  form.verify({
    name: function(value){
      if(value.length<2||value.length >5){
        return '请输入真实姓名';
      }
    }
    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
  });
  //监听提交
  form.on('submit(demo2)', function(data){
		var data=$("#data").serialize();
		$.ajax({
			url:'${ctx}/user/signUp',
			type:'POST',
			data:data,
			success:function(msg){
				if(msg==0){
					layer.open({
						  content: '注册成功'
							  ,btn: ['去登陆']
							  ,yes: function(index, layero){
								  goBack();
							  }
							  ,cancel: function(){ 
							    //右上角关闭回调
							    return false;
							  }
							});
				}else{
					layer.alert("注册失败");
				}
			},
			error:function(msg){
				layer.alert(msg);
			},
		});
    return false;
  });
});
</script>

</body>
</html>
