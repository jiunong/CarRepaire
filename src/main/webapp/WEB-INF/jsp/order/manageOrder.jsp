<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<title>订单预定</title>
<!-- css -->
<link href="${ctx}/static/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="${ctx}/static/layui/css/layui.css" rel="stylesheet" />
<!-- js -->
<script src="${ctx}/static/jquery/1.9.1/jquery-1.9.1.min.js"></script>
<script src="${ctx}/static/layer/layer.js"></script>
<script src="${ctx}/static/js/index.js"></script>
<script src="${ctx}/static/layui/layui.all.js"></script>
<script src="${ctx}/static/js/order_list.js"></script>
<script src="${ctx}/static/js/index.js"></script>
<script src="${ctx}/static/js/base.js"></script>
<style type="text/css">
body {font-family: sans-serif;}
a {text-decoration: none;}
a:hover{cursor:pointer}
th,td{text-align: center;}
</style>
</head>
<body class="layui-layout-body">

	<blockquote class="layui-elem-quote layui-text">请认真填写订单信息
	</blockquote>
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-row grid-demo">
				<div class="layui-col-md4 layui-col-md-offset1">
					<div>
						<fieldset class="layui-elem-field layui-field-title"
							style="margin-top: 20px;">
							<legend>用户信息</legend>
						</fieldset>

						<div class="layui-form-item">
							<label class="layui-form-label">姓名</label>
							<div class="layui-input-inline">
								<input type="text" value="${dealOrder.userName}"
									autocomplete="off" readonly="readonly" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">地址</label>
							<div class="layui-input-inline">
								<input type="text" value="${dealOrder.userLoc}"
									readonly="readonly" class="layui-input">
							</div>
						</div>

						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">联系方式</label>
								<div class="layui-input-inline">
									<input type="tel" value="${dealOrder.userPhone}"
										readonly="readonly" class="layui-input">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="layui-col-md5 ">
					<div>
						<fieldset class="layui-elem-field layui-field-title"
							style="margin-top: 20px;">
							<legend>车辆信息</legend>
						</fieldset>
						<div class="layui-form-item">
							<label class="layui-form-label">名称</label>
							<div class="layui-input-inline">
								<input type="text" value="${dealOrder.car_name }"
									autocomplete="off" readonly="readonly" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">类型</label>
							<div class="layui-input-inline">
								<input type="text" value="${dealOrder.car_type}"
									readonly="readonly" class="layui-input">
							</div>
						</div>

						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">产地</label>
								<div class="layui-input-inline">
									<input type="tel" value="${dealOrder.car_place}"
										readonly="readonly" class="layui-input">
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">购入时间</label>
								<div class="layui-input-inline">
									<input type="date"
										value="<fmt:formatDate value="${dealOrder.buytime}" pattern="yyyy-MM-dd"/>"
										readonly="readonly" class="layui-input">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="layui-col-md12">
					<fieldset class="layui-elem-field layui-field-title">
						<legend>订单信息</legend>
					</fieldset>
					<form class="layui-form layui-form-pane" action="#">
						<div class="layui-form-item">
							<label class="layui-form-label">订单预定时间</label>
							<div class="layui-input-inline">
								<input type="text" value="${dealOrder.orderTime}"
									readonly="readonly" class="layui-input">
							</div>
							<label class="layui-form-label">预计到达日期</label>
							<div class="layui-input-inline">
								<input type="text" value="${dealOrder.arriveTime}"
									readonly="readonly" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">故障图片</label>
							<div class="layui-input-block">
								<c:forEach items="${imgurls}" var="img">
									<img alt="用户上传" class="img-responsive center-block"
										src="${img}">
								</c:forEach>
							</div>
						</div>
						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label">用户问题描述</label>
							<div class="layui-input-block">
								<textarea class="layui-textarea" readonly="readonly">${dealOrder.o_describe}</textarea>
							</div>
						</div>
						<!-- 员工添加 -->
						<div class="layui-col-md12">
							<fieldset class="layui-elem-field layui-field-title">
								<legend>补充订单信息</legend>
							</fieldset>
							<div class="layui-row">
								<label class="layui-form-label" for="sState">选择机床</label>
								<div class="layui-col-xs4">
									<select class="form-control"  id="station" name="station">
										<option value="">-请选择-</option>
										<c:forEach items="${stations }" var="station" >
											<option value="${station.sId}">${station.sId}号${station.sType}机床</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<br><br>
							<div class="layui-col-md3">
								<div class="layui-col-xs9">
										<select id="worker" lay-search=""  lay-filter="worker" >
											<option>请选择员工</option>
												<c:forEach items="${workers}"  var="worker">
												<option value="${worker.wId}">${worker.wName}</option>
											</c:forEach>
										</select>
	   							</div>
	   							<div class="layui-col-xs3">
									<button class="layui-btn" type="button" onclick="javascript:cancelWorker();"> <i class="layui-icon">&#x1002;</i></button>
	   							</div>
							</div>
							<div class="layui-col-md10 layui-col-md-offset1" >
									<table id="workerTable" class="table table-hover">
										<thead>
											<tr>
												<th>员工姓名</th><th>联系方式</th>
												<th>薪水</th><th>性别</th>
												<th>年龄</th><th>职位</th>
											</tr>
										</thead>
									</table>
							</div>
								<div class="layui-col-md3">
									<div class="layui-col-xs9">
										<select id="part" lay-search=""  lay-filter="part" >
											<option>请选择零件</option>
											<c:forEach  items="${parts}"  var="part">
												<option value="${part.partId}">${part.partName}</option>
											</c:forEach>
										</select>
									</div>
									<div class="layui-col-xs3">
										<button type="button" class="layui-btn" onclick="javascript:cancelPart();"> <i class="layui-icon">&#x1002;</i></button>
									</div>
								</div>
								<div class="layui-col-md10 layui-col-md-offset1">
									<table class="table table-hover" id="partTable">
										<thead>
												<tr>
													<th>零件名称</th>
													<th>零件价格</th>
													<th>剩余库存</th>
													<th>需要数量</th>
													<th>零件小计</th>
												</tr>
										</thead>
									</table>
								</div>
							<div class="layui-form-item layui-form-text">
								<label class="layui-form-label">备注</label>
								<div class="layui-input-block">
									<textarea class="layui-textarea" id="remark"></textarea>
								</div>
							</div>
							<div class="layui-form-item">
								<button onclick="acceptOrder();" type="button" class="layui-btn">接受订单</button>
								<button onclick="rejectOrder();" type="button" class="layui-btn">拒绝订单</button>
							</div>
							<input type="hidden" value="${dealOrder.o_id}" id="orderId">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
	var selectedPart=[];
	var selectedWorker=[];
	function cancelPart(){
			selectedPart.length=0;
			var defau="<thead><tr><th>零件名称</th><th>零件价格</th>"+
			"<th>剩余库存</th><th>需要数量</th><th>零件小计</th></tr></thead>";
			$("#partTable").html(defau);
	}
	function cancelWorker(id){
			selectedWorker.length=0;
			var defau="<thead><tr><th>员工姓名</th><th>联系方式</th><th>薪水</th>"+
			"<th>性别</th><th>年龄</th><th>职位</th></tr></thead>";
			$("#workerTable").html(defau);
	}
	function changePart(obj){
		var newMoney=eval(obj.value*$(obj).parent().prev().prev().text())+".0";
		$(obj).parent().next().html(newMoney);
	}
		layui.use([ 'form', 'laydate' ], function() {
			var form = layui.form;
			form.render();
			form.on('select(part)',function(data){
				debugger;
				var id=data.value;
				if(selectedPart.indexOf(id)==-1){
					selectedPart.push(id);
					<c:forEach  items="${parts}"  var="part">
						if(id=='${part.partId}'){
							var tContent="<tr><td>${part.partName}</td><td>${part.partPrice}</td>"+
							"<td>${part.partNum}</td><td><input id='${part.partId}' onchange='changePart(this)' value='1' name='${part.partName}' max='${part.partNum}' min='1' style='width:30%' type='number'/></td>"+
							"<td>${part.partPrice}</td></tr>";
							$("#partTable").append(tContent);
						}
					</c:forEach>
				}else{
					
				}
			});
			form.on('select(worker)',function(data){
				var id=data.value;
				if(selectedWorker.indexOf(id)==-1){
					selectedWorker.push(id);
					<c:forEach  items="${workers}"  var="worker">
					   if(id=='${worker.wId}'){
					   var tContent="<tr><td>${worker.wName}</td>"+
									"<td>${worker.wPhone}</td>"+
									"<td>${worker.wSalary}</td>"+
									"<td>${worker.wSex ==1 ?'男':'女'}</td>"+
									"<td>${worker.wAge}</td>"+
									"<td>${worker.wLevel==0?'实习生':'员工'}</td></tr>";
							$("#workerTable").append(tContent);
						}
					</c:forEach>
				}else{
					
				}
			});
		});
		
		function acceptOrder(){
			debugger;
			var parts=[];//零件
			var workers="";//员
			//机床id
			var stationId=$("#station").val();
			//订单
			var orderId=$("#orderId").val();
			
			for(var i=0;i<selectedPart.length;i++){
				var partObj={};//存放part信息  id num 
				var id=selectedPart[i];
				partObj.id=id;
				partObj.num=$("#"+id).val();
				partObj.name=$("#"+id).attr("name");
				parts.push(partObj);
			}
			for(var i=0;i<selectedWorker.length;i++){
				workers+=selectedWorker[i]+",";
			}
			if(stationId==null||stationId==''){
				alert("请选择机床");
				return false;
			}else if(selectedWorker==null||selectedWorker.length==0){
				alert("请选择员工");
				return false;
			}else if(selectedPart==null||selectedPart.length==0){
				alert("请选择零件");
				return false;
			}else{
				for(var i=0;i<parts.length;i++){
					if(parts[i].num==null||parts[i].num==''){
						alert("请选择"+parts[i].name+"的数量");
						return false;
					}
				}
			}
			$.ajax({
				url:'order/accept',
				data : {
					"orderId":orderId,
					"stationId":stationId,
					"selectedWorker":workers,
					"parts":JSON.stringify(parts),
					"remark":$("#remark").val()
				},
				type : "POST", // 请求方式
// 				dataType:'html',
				success:function(data){
					if(data == 1){
						layer.msg("订单接受成功！");
					}else if(data == 0){
						layer.msg("订单接受失败，请联系管理员！");
					}
					layer.close(orderLay);
					opration('/order/list?state=2');
				}
		});
		}
		
		function rejectOrder(){
			debugger;
			var remark = $("#remark").val();
			//订单
			var orderId=$("#orderId").val();
			if(remark == null || remark == ''){
				alert("请备注拒绝订单原因！");
				return false;
			}
				$.ajax({
					url:'order/reject',
					data : {
						"orderId": orderId,
						"remark" : remark
					},
					type : "POST", // 请求方式
					success:function(data){
						if(data == 1){
							layer.msg("成功拒绝订单！");
						}else if(data == 0){
							layer.msg("订单拒绝失败，请联系管理员！");
						}
						layer.close(orderLay);
						opration('/order/list?state=2');
					}
			});
		}
	</script>

</body>
</html>
