/*
 * 初始化表格数据
 */
$(function() {
	var oTable = new TableInit();
	oTable.Init();

});

var excelLayer;
var TableInit = function() {
	var oTableInit = new Object();
	// 初始化Table
	oTableInit.Init = function() {
		$('#worker').bootstrapTable(
						{
							url : 'worker/getData.do', // 请求后台的URL（*）
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
							strictSearch : true,
							clickToSelect : true, // 是否启用点击选中行
							// height: 460, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
							uniqueId : "wId", // 每一行的唯一标识，一般为主键列
							cardView : false, // 是否显示详细视图
							detailView : false, // 是否显示父子表
							showRefresh : false,
							showColumns : false,
							showToggle : false,
							columns : [
							        {
							        	checkbox : true
							        },
									{
										field : 'wName',
										title : '员工姓名',
										align : 'center',
										formatter : function(value, row, index) {
											if(value=== undefined){
												return null;
											}else{
												return row.wName;
											}
										}
									},

									{
										field : 'wAge',
										title : '年龄',
										align : 'center',
										formatter : function(value, row, index) {
											if(value=== undefined){
												return null;
											}else{
												return row.wAge;
											}
										}
									},
									{
										field : 'wSex',
										title : '性别',
										align : 'center',
										formatter : function(value, row, index) {
											if(value=== 1){
												return '男';
											}else if(value=== 0){
												return '女';
											}
										}
									},
									{
										field : 'wPhone',
										title : '员工电话',
										align : 'center',
										formatter : function(value, row, index) {
											if(value=== undefined){
												return null;
											}else{
												return row.wPhone;
											}
										}
									},
									{
										field : 'wLevel',
										title : '员工职位',
										align : 'center',
										formatter : function(value, row, index) {
											if(value=== undefined){
												return null;
											}else{
												return row.wLevel==1?'管理':'职员';
											}
										}
									},
									{
										field : 'wSalary',
										title : '员工薪水',
										align : 'center',
										formatter : function(value, row, index) {
											if(value=== undefined){
												return null;
											}else{
												return row.wSalary;
											}
										}
									},
									{
										field : 'wIdcard',
										title : '身份证信息',
										align : 'center',
										formatter : function(value, row, index) {
											if(value=== undefined){
												return null;
											}else{
												return row.wIdcard;
											}
										}
									},
									{
										field : 'wLocation',
										title : '家庭住址',
										align : 'center',
										formatter : function(value, row, index) {
											if(value=== undefined){
												return null;
											}else{
												return row.wLocation;
											}
										}
									},
									{
										field : 'wState',
										title : '工作状态',
										align : 'center',
										formatter : function(value, row, index) {
											if(value=== 0){
												return '忙碌';
											}else if(value==1){
												return '空闲';
											}
										},
										cellStyle:function(value,row,index){  
										    if (value==0){  
										        return {css:{"color":"red"}} ; 
										    }else{  
										        return {css:{"color":"green"}} ; 
										    }  
										} 
									}]
						});
	};
	// 得到查询的参数
	oTableInit.queryParams = function(params) {
		var temp = { // 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			limit : params.limit, // 页面大小
			offset : params.offset, // 页码
			workerName:$('#workerName').val()
		};
		return temp;
	};
	return oTableInit;
};


//添加
function add(){
	var url =  "worker/edit.do?tag=1";
//	openLayerWin3("新增部件", url,'yes',"","400px",doSearch,'','','','',true,'20px');
	var name = '添加员工信息';                           //网页名称，可为空;  
	  var iWidth = '900';                         //弹出窗口的宽度;  
	  var iHeight = '550';                        //弹出窗口的高度;  
	  //window.screen.height获得屏幕的高，window.screen.width获得屏幕的宽  
	  var iTop = (window.screen.height-30-iHeight)/2;       //获得窗口的垂直位置;  
	  var iLeft = (window.screen.width-10-iWidth)/2;        //获得窗口的水平位置;  
	  winObj = window.open(url,name,'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');  
	  var loop = setInterval(function() {       
	        if(winObj.closed) {      
	            clearInterval(loop);      
	            $('#worker').bootstrapTable('refresh');
	        }      
	    }, 1);  
}




//查询方法
function doSearch(){
	$('#worker').bootstrapTable('refresh');
}

//重置
function doReset(){
	$("#workerName").val('');
	doSearch();
}


//删除多行
function deleteRow(){
	 var tables = $('#worker').bootstrapTable('getAllSelections');
	 var ids = "";
   if(tables.length==0){
      layer.alert('您至少选择一行！');
  	return false;
   }else {
	   layer.confirm('是否要删除'+tables.length+'条数据？', {
		   btn: ['确定','取消'] //按钮
		 }, function() {
			for (var i = 0; i < tables.length; i++) {
				ids += tables[i].wId + ",";
			}
			ids = ids.substring(0, ids.length - 1);
			deleteCurRow(ids);
		}, function() {
//		   closeLay();
		 });
  }
}



//删除选中行，支持多个id
function deleteCurRow(ids){	
	$.ajax({
	    url:"worker/delById.do",    //请求的url地址
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
     	    	   $('#worker').bootstrapTable('refresh');
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
function closeLay(){
	window.close();
}


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
  });
  //监听提交
  form.on('submit(add)', function(data){
		var data=$("#myForm").serialize();
		$.ajax({
			url:'worker/add',
			type:'POST',
			data:data,
			success:function(state){
				if(state==1){
					layer.alert("添加成功");
					closeLay();
				}
			},
			error:function(){
				layer.alert("添加失败！请联系管理员")
			},
		});
    return false;
  });
});

//修改
function update(){
var tables = $('#worker').bootstrapTable('getAllSelections');
if(tables.length==0){
	layer.alert('您至少选择一行！');
	return false;
}else if(tables.length > 1){
	layer.alert('您只能选择一行！');
	return false;
}
else if( tables[0].state=="0"){
	layer.alert('离职的数据不能修改！');
	return false;
} 
    var id = tables[0].wId;
	  var url =  "worker/edit.do?id=" + id;
	  var name = '修改员工信息';                           //网页名称，可为空;  
	  var iWidth = '900';                         //弹出窗口的宽度;  
	  var iHeight = '550';                        //弹出窗口的高度;  
	  //window.screen.height获得屏幕的高，window.screen.width获得屏幕的宽  
	  var iTop = (window.screen.height-30-iHeight)/2;       //获得窗口的垂直位置;  
	  var iLeft = (window.screen.width-10-iWidth)/2;        //获得窗口的水平位置;  
	  winObj = window.open(url,name,'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');  
	  var loop = setInterval(function() {       
	        if(winObj.closed) {      
	            clearInterval(loop);      
	            $('#worker').bootstrapTable('refresh');
	        }      
	    }, 1);  

}

function excellayer(){
	var tables = $('#worker').bootstrapTable('getAllSelections');
	 var ids = "";
	 debugger;
  if(tables.length==0){
       layer.alert('您至少选择一行！');
 		return false;
  }else {
	  excelLayer= layer.confirm('是否要导出'+tables.length+'条数据？', {
		   btn: ['确定','取消'] //按钮
		 }, function() {
			  	for(var i=0;i<tables.length;i++){
			  		ids += tables[i].wId + ",";
					}
			  	ids = ids.substring(0,ids.length-1);
			  	excel(ids);
		}, function() {
			layer.close();
		});
 }
}

function excel(ids){
	window.open("worker/excel.do?ids=" +ids,"_blank");
  	layer.close(excelLayer);
}