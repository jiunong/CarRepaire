var ctx=$('#ctx').val();//根路径
//返回显示内容页面
function opration(operation){
	var uri=ctx+operation;
	$.ajax({
		url:uri,
		type : "POST", // 请求方式
		success:function(data){
			$("#content").html(data);
		}
	});
};

