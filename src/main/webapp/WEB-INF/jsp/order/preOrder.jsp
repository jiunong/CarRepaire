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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<title>订单预定</title>
<!-- css -->
<link href="${ctx}/static/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="${ctx}/static/layui/css/layui.css"  rel="stylesheet"/>
<!-- js -->
<script src="${ctx}/static/jquery/1.9.1/jquery-1.9.1.min.js"></script>
<script src="${ctx}/static/layer/layer.js"></script>
<script src="${ctx}/static/layui/layui.all.js"></script>
<script src="${ctx}/static/js/index.js"></script>
<style type="text/css">a{text-decoration: none;}</style>
</head>
<body class="layui-layout-body">

<blockquote class="layui-elem-quote layui-text">
 请认真填写订单信息
</blockquote>
   <div class="layui-container">
 	<div class="layui-row">
      <div class="layui-row grid-demo">
        <div class="layui-col-md4 layui-col-md-offset1" >
          <div >
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			  <legend>我的信息</legend>
			</fieldset>
			
			  <div class="layui-form-item">
			    <label class="layui-form-label">姓名</label>
			    <div class="layui-input-inline">
			      <input type="text" value="${userOn.uName}" autocomplete="off" readonly="readonly" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">地址</label>
			    <div class="layui-input-inline">
			      <input type="text"value="${userOn.uLoc}" readonly="readonly" class="layui-input">
			    </div>
			  </div>
			  
			  <div class="layui-form-item">
			    <div class="layui-inline">
			      <label class="layui-form-label">联系方式</label>
			      <div class="layui-input-inline">
			        <input type="tel" id="tel" value="${userOn.uPhone}"  class="layui-input">
			      </div>
			    </div>
			  </div>
          </div>
        </div>
        <div class="layui-col-md5 ">
          <div>
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			  <legend>车辆选择</legend>
			</fieldset>
			<c:if test="${not empty preCar}">
			  <div class="layui-form-item">
			    <label class="layui-form-label">名称</label>
			    <div class="layui-input-inline">
			      <input type="text" value="${preCar.carName }" autocomplete="off" readonly="readonly" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">类型</label>
			    <div class="layui-input-inline">
			      <input type="text"value="${preCar.carType}" readonly="readonly" class="layui-input">
			    </div>
			  </div>
			  
			  <div class="layui-form-item">
			    <div class="layui-inline">
			      <label class="layui-form-label">产地</label>
			      <div class="layui-input-inline">
			        <input type="tel" value="${preCar.carPlace}" readonly="readonly" class="layui-input">
			      </div>
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <div class="layui-inline">
			      <label class="layui-form-label">购入时间</label>
			      <div class="layui-input-inline">
			        <input type="date" value="<fmt:formatDate value="${preCar.buytime}" pattern="yyyy-MM-dd"/>" readonly="readonly" class="layui-input">
			      </div>
			    </div>
			  </div>
			</c:if>
				<div id="selCar">
					<button onclick="selectCar()" class="layui-btn layui-btn-normal layui-btn-radius">
					<c:if test="${ not empty preCar}">重新选择</c:if>
					<c:if test="${ empty preCar}">选择车辆</c:if>

					<i class="layui-icon">&#xe654;</i></button>
				</div>
			  
          </div>
        </div>
        <div class="layui-col-md12">
          <div>
			<fieldset class="layui-elem-field layui-field-title" >
			  <legend>订单信息</legend>
			</fieldset>
			<form class="layui-form layui-form-pane" action="">
			  <div class="layui-form-item">
			    <label class="layui-form-label">预计到达日期</label>
			    <div class="layui-inline">
			      <input type="text" id="arrive" placeholder="请选择到达日期" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
				<label class="layui-form-label">商品图片上传</label>  
		        <div class="layui-input-block">  
		            <button type="button" class="layui-btn" id="pics">  
		                <i class="layui-icon">&#xe67c;</i>选择图片（最多选择10张，单张图片最大为10M）  
		            </button>  
		            <button type="button" class="layui-btn" id="uploadPic">开始上传</button>  
		            <button type="button" class="layui-btn" onclick="cleanImgsPreview()"> <i class="fa fa-trash-o fa-lg"></i>清空图片预览</button>  
		        </div>  
		        <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">  
		             	预览图：  
		            <div class="layui-upload-list" id="demo2"></div>  
		        </blockquote>   
   			  </div>  
			  <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label">问题描述</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" id="desc" class="layui-textarea"></textarea>
			    </div>
			  </div>
			   <input type="text" id="imgUrls" name="imgUrls" style="display: none;" class="layui-input"> 
			  <div class="layui-form-item">
			    <button type="button" class="layui-btn" id="order">提交订单</button>
			  </div>
			</form>
          </div>
        </div>
      </div>
 	</div>
</div>

	<script>
var success=0;  
var fail=0;  
var imgurls="";  
layui.use(['form','upload', 'laydate'], function(){
	var form = layui.form,upload = layui.upload,laydate = layui.laydate;
	  form.render();
	  //日期
	  laydate.render({
	    elem: '#arrive',
	    type: 'datetime'
	  });
	  //多图片上传
	  upload.render({
		    elem: '#pics'
		    ,url: '${ctx}/upload/pics'
		    ,multiple: true
		    ,auto:false
//	      上传的单个图片大小  
	        ,size:10240
//	      最多上传的数量  
	        ,number:10 
	        ,field:'file'
	        ,bindAction: '#uploadPic'
		    ,before: function(obj){
		    	//预读本地文件示例，不支持ie8  
	            obj.preview(function(index, file, result) {  
	                $('#demo2').append('<img src="' + result   
	                    + '" alt="' + file.name   
	                    +'"height="92px" width="92px" class="layui-upload-img uploadImgPreView">')  
	            });  
		    }
		    ,done: function(res){
		    	 //每个图片上传结束的回调，成功的话，就把新图片的名字保存起来，作为数据提交  
	            console.log(res.code);  
	            if(res.code=="1"){  
	                fail++;  
	            }else{  
	                success++;  
	                imgurls=imgurls+""+res.src+",";  
	                $('#imgUrls').val(imgurls);  
	            }  
		      layer.msg('文件上传成功');
		    },  
	        allDone:function(obj){  
	            layer.msg("总共要上传图片总数为："+(fail+success)+"\n"  
	                        +"其中上传成功图片数为："+success+"\n"  
	                        +"其中上传失败图片数为："+fail  
	                     ) ;
	        }  
		  });
});
  
/** 
 * 清空预览的图片及其对应的成功失败数 
 * 原因：如果已经存在预览的图片的话，再次点击上选择图片时，预览图片会不断累加 
 * 表面上做上传成功的个数清0，实际后台已经上传成功保存了的，只是没有使用，以最终商品添加的提交的为准 
 */  
function cleanImgsPreview(){  
        success=0;  
        fail=0;  
        $('#demo2').html("");  
        $('#imgUrls').val("");  
}  

var carLay;
selectCar=function(){
	$.ajax({
		url:'car/list?tag=1',
		type : "POST", // 请求方式
		dataType:'html',
		success:function(data){
			carLay=layer.open({
				type: 1,
				  skin: 'layui-layer-rim', //加上边框
				  area: ['1000px', '500px'], //宽高
				  content: data
				});
		}
	});
	
};
$('#order').click(function(){
	var  car='${preCar}';
	var  imgurls=$('#imgUrls').val();  
	var  arriveTime=$('#arrive').val(); 
	var  tel=$('#tel').val(); 
	if(car==null||car==''){
		 layer.confirm('请选择车辆', {
			   btn: ['确定','取消'] //按钮
			 }, function() {
				 layer.closeAll('dialog');
					selectCar();
			}, function() {
//			   closeLay();
			 });
		return false;
	}else if(imgurls==null||imgurls==''){
		layer.msg('请选择图片');
		return false;
	}else if(arriveTime==null||arriveTime==''){
		layer.msg('请预计到店时间');
		return false;
	}else if(!(/^1[34578]\d{9}$/.test(tel))){
		layer.msg('手机号码有误，请重填');
		return false;
	}else{
		$.ajax({
			url:'order/preOrder',
			type : "POST", // 请求方式
			data:{
				imgurls : imgurls,
				arriveTime : arriveTime,
				desc : $('#desc').val()
			},
			success:function(data){
				layer.alert("预约成功！");
				opration('/order/userOrder');
			}
		});
	}
});
</script>

</body>
</html>
