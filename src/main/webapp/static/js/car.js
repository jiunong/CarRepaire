var ctx=$('#ctx').val();
/*
 * 初始化表格数据
 */
$(function() {
	
	var oTable = new TableInit();
	oTable.Init();

});


var TableInit = function() {
	var oTableInit = new Object();
	// 初始化Table
	oTableInit.Init = function() {
		$('#car').bootstrapTable(
						{
							url : 'car/getData.do', // 请求后台的URL（*）
							method : 'get', // 请求方式（*）
							toolbar : '#toolbar', // 工具按钮用哪个容器
							striped : false, // 是否显示行间隔色
							cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
							pagination : true, // 是否显示分页（*）
							sortable : true, // 是否启用排序
							sortOrder : "asc", // 排序方式
							queryParams : oTableInit.queryParams,// 传递参数（*）
							sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）
							pageNumber : 1, // 初始化加载第一页，默认第一页
							pageSize : 10, // 每页的记录行数（*）
							pageList : [ 10, 25, 50, 100 ], // 可供选择的每页的行数（*）
							smartDisplay:false,
							strictSearch : true,
							clickToSelect : true, // 是否启用点击选中行
							// height: 460, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
							uniqueId : "carId", // 每一行的唯一标识，一般为主键列
							cardView : false, // 是否显示详细视图
							detailView : false, // 是否显示父子表
							showRefresh : false,
							showColumns : false,
							showToggle : false,
							rowStyle:function(row, index) {
								var classes = ['success','info', 'warning','danger','active'];
							    
							    if (index % 2 === 0 && index / 2 < classes.length) {
							        return {
							            classes: classes[index / 2]
							        };
							    }
							    return {};
							},
							columns : [
							        {
							        	checkbox : true
							        },
									/*{
										field : 'carId',
										title : '汽车编号',
										align : 'center',
										formatter : function(value, row, index) {
											if(value=== undefined){
												return null;
											}else{
												return 'NO.'+(index+1);
											}
										}
									},*/
									{
										field : 'carName',
										title : '汽车名称',
										align : 'center',
										formatter : function(value, row, index) {
											if(value=== undefined){
												return null;
											}else{
												return row.carName;
											}
										}
									},
									{
										field : 'carType',
										title : '汽车类型',
										align : 'center',
										formatter : function(value, row, index) {
											return row.carType;
										}
									},
									{
										field : 'carNo',
										title : '车牌',
										align : 'center',
										formatter : function(value, row, index) {
											return row.carNo;
										}
									},
									{
										field : 'carPlace',
										title : '汽车产地',
										align : 'center',
										formatter : function(value, row, index) {
											if(value=== undefined){
												return null;
											}else{
												return row.carPlace;
											}
										}
									},
									{
										field : 'buytime',
										title : '购入时间',
										align : 'center',
										formatter : function(value, row, index) {
											if(value=== undefined||value==null){
												return '-';
											}else{
												var d=new Date(row.buytime);
												return d.getFullYear()+"年"+(d.getMonth()+1)+"月"+d.getDate()+"日";
//												//yyyy-MM-dd HH:mm:ss
											}
										}
									},
									{
										field : 'carState',
										title : '状态',
										align : 'center',
										formatter : function(value, row, index) {
											if(value=== undefined||value==null){
												return '-';
											}else{
												return value==0?'正常':'维修中';
											}
										}
									},
									{
										field : 'carState',
										title : '操作',
										align : 'center',
										formatter : function(value, row, index) {
											var opreation;
												if(value==0){
													var carId=row.carId;
													opreation="<a onclick='preOrder("+'"'+carId+'"'+")'>选择维修</a>";
												}else{
													opreation='维修中';
												}
												return opreation;
										},
										cellStyle:function(value,row,index){  
										    if (value==0){  
										        return {css:{"color":"green"}} ; 
										    }else{  
										        return {css:{"color":"red"}} ; 
										    }  
										}  
									}
									]
						});
	};
	// 得到查询的参数
	oTableInit.queryParams = function(params) {
		var temp = { // 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			limit : params.limit, // 页面大小
			offset : params.offset, // 页码
			tag : $('#tag').val(),
			carName : $("#carName").val()
		};
		return temp;
	};
	return oTableInit;
};


//添加
function add(){
	var url =  "car/edit.do?tag=1";
	var name = '添加汽车信息';                           //网页名称，可为空;  
	  var iWidth = '900';                         //弹出窗口的宽度;  
	  var iHeight = '550';                        //弹出窗口的高度;  
	  //window.screen.height获得屏幕的高，window.screen.width获得屏幕的宽  
	  var iTop = (window.screen.height-30-iHeight)/2;       //获得窗口的垂直位置;  
	  var iLeft = (window.screen.width-10-iWidth)/2;        //获得窗口的水平位置;  
	  winObj = window.open(url,name,'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');  
	  var loop = setInterval(function() {       
	        if(winObj.closed) {      
	            clearInterval(loop);      
	            $('#car').bootstrapTable('refresh');
	        }      
	    }, 1);  
}
//删除多行
function deleteRow(){
	 var tables = $('#car').bootstrapTable('getAllSelections');
	 var ids = "";
   if(tables.length==0){
        layer.alert('您至少选择一行！');
  		return false;
   }else {
	   layer.confirm('是否要删除'+tables.length+'条数据？', {
		   btn: ['确定','取消'] //按钮
		 }, function() {
			  	for(var i=0;i<tables.length;i++){
			  		ids += tables[i].carId + ",";
			  		if(tables[i].carState==1){
			  			layer.alert(tables[i].carName+"正在维修中，不能删除！");
			  			return false;
			  		}
					}
			  	ids = ids.substring(0,ids.length-1);
			  	deleteCurRow(ids);
		}, function() {
//		   closeLay();
		 });
  }
}



//删除选中行，支持多个id
function deleteCurRow(ids){	
	$.ajax({
	    url:"car/delById.do",    //请求的url地址
  	    dataType:"json",   //返回格式为json
//  	async:true,//请求是否异步，默认为异步，这也是ajax重要特性
  	    data:{"id":ids},    //参数值
  	    type:"post",   //请求方式
  	    beforeSend:function(){
  	        //请求前的处理
  	    },
  	    success:function(data){
  	    	if(data == 1){
  	    		layer.alert("删除成功");
  	    		//请求成功时处理
     	    	   $('#car').bootstrapTable('refresh');
  	    	}else{
  	    		layer.alert("删除失败");
  	    	}
  	    },
  	    complete:function(){
  	        //请求完成的处理
  	    },
  	    error:function(){
  	        //请求出错处理
  	    }
  	});
  
}

//修改
function update(){
var tables = $('#car').bootstrapTable('getAllSelections');
if(tables.length==0){
	layer.alert('您至少选择一行！');
	return false;
}else if(tables.length > 1){
	layer.alert('您只能选择一行！');
	return false;
}
    var id = tables[0].carId;
	  var url =  "car/edit.do?id=" + id;
	  var name = '修改汽车信息';                           //网页名称，可为空;  
	  var iWidth = '900';                         //弹出窗口的宽度;  
	  var iHeight = '550';                        //弹出窗口的高度;  
	  //window.screen.height获得屏幕的高，window.screen.width获得屏幕的宽  
	  var iTop = (window.screen.height-30-iHeight)/2;       //获得窗口的垂直位置;  
	  var iLeft = (window.screen.width-10-iWidth)/2;        //获得窗口的水平位置;  
	  winObj = window.open(url,name,'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');  
	  var loop = setInterval(function() {       
	        if(winObj.closed) {      
	            clearInterval(loop);      
	            $('#car').bootstrapTable('refresh');
	        }      
	    }, 1);  
}
function closeLay(){
	window.close();
}

layui.use(['form', 'layedit','laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,laydate = layui.laydate;
  laydate.render({
	    elem: '#buytime'
	  });
  //自定义验证规则
  form.verify({
	  carNo: function(value){
	  var testP=/[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳]{1}/;
      if(!testP.test(value)){
        return '请输入合理的车牌';
      }
    }
  });
  //监听提交
  form.on('submit(add)', function(data){
		var data=$("#myForm").serialize();
		$.ajax({
			url:'car/add',
			type:'POST',
			data:data,
			success:function(state){
				if(state==1){
					layer.alert("添加成功");
					closeLay();
				}
			},
			error:function(){
				layer.alert("添加失败！请联系管理员");
			},
		});
    return false;
  });
});


function doSearch(){
	$('#car').bootstrapTable('refresh');
}
//重置
function doReset(){
	$("#carName").val('');
	doSearch();
}