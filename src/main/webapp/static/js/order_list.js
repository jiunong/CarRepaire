var ctx=$("#ctx").val();
var orderLay;
var manage=function(orderId){
	$.ajax({
		url:'order/manage',
		data : {"orderId":orderId},
		type : "POST", // 请求方式
		dataType:'html',
		success:function(data){
			orderLay=layer.open({
				type: 1,
				  skin: 'layui-layer-rim', //加上边框
				  area: ['1150px', '650px'], //宽高
				  content: data
				});
		}
});
};

var edit=function(orderId){
	$.ajax({
		url:'order/edit',
		data : {"orderId":orderId},
		type : "POST", // 请求方式
		dataType:'html',
		success:function(data){
			orderLay=layer.open({
				type: 1,
				  skin: 'layui-layer-rim', //加上边框
				  area: ['1150px', '650px'], //宽高
				  content: data
				});
		}
});
};

var detail=function(orderId){
	$.ajax({
		url:'order/detail',
		data : {"orderId":orderId},
		type : "POST", // 请求方式
		dataType:'html',
		success:function(data){
			orderLay=layer.open({
				type: 1,
				  skin: 'layui-layer-rim', //加上边框
				  area: ['1150px', '650px'], //宽高
				  content: data
				});
		}
});
};

function excellayer(state){
	window.open("order/excel?state="+state,"_blank");
}