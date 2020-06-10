var ctx=$('#ctx').val();
/*
 * 初始化表格数据
 */
$(function() {
	getWorkDataBar(null);
	getCarTypeData(null);
});

function getWorkDataBar(month) {
	$.ajax({
	    url:ctx+"/worker/getWorkData",    //请求的url地址
  	    data:{"month":month},    //参数值
  	    type:"post",   //请求方式
  	    success:function(data){
  	    	var myChart = echarts.init(document.getElementById('work'));
  	    	var option = getBarEchart(data);
  	    	myChart.setOption(option);
  	    }
  	});
}
function getCarTypeData(month) {
	$.ajax({
	    url:ctx+"/car/getCarTypeData",    //请求的url地址
  	    data:{"month":month},    //参数值
  	    type:"post",   //请求方式
  	    success:function(data){
  	    	var myChart = echarts.init(document.getElementById('carType'));
  	    	var option = getPieEchart(data);
  	    	myChart.setOption(option);
  	    }
  	});
}
//获取柱状图 数据为list name value格式
function getBarEchart(data){
	var xData=[];
	var sData=[];
	for(var i=0;i<data.length;i++){
		xData.push(data[i].name);
		sData.push(data[i].value);
	}
	option = {
		    title: {
		        x: 'center',
		        text: '员工完成订单数量月度分析',
//		        subtext: '2018年-05月',
		    },
		    tooltip: {
		        trigger: 'item'
		    },
		    toolbox: {
		        show: true,
		        feature: {
		            dataView: {show: true, readOnly: false},
		            restore: {show: true},
		            saveAsImage: {show: true}
		        }
		    },
		    calculable: true,
		    grid: {
		        borderWidth: 0,
		        y: 80,
		        y2: 60
		    },
		    xAxis: [
		        {
		            type: 'category',
		            show: false,
		            data: xData
		        }
		    ],
		    yAxis: [
		        {
		            type: 'value',
		            show: false
		        }
		    ],
		    series: [
		        {
		            name: '已完成订单数量',
		            type: 'bar',
		            itemStyle: {
		                normal: {
		                    color: function(params) {
		                        // build a color map as your need.
		                        var colorList = [
		                          '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
		                           '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
		                           '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
		                        ];
		                        return colorList[params.dataIndex]
		                    },
		                    label: {
		                        show: true,
		                        position: 'top',
		                        formatter: '{b}\n{c}'
		                    }
		                }
		            },
		            data: sData,
		        }
		    ]
		};
	return option;
}


function getPieEchart(data){
	var xData=[];
	var sData=[];
	for(var i=0;i<data.length;i++){
		xData.push(data[i].name);
		var json={};
		json.name=data[i].name;
		json.value=data[i].value;
		sData.push(json);
	}
	option = {
		    title : {
		        text: '处理订单车辆类型数量月度统计',
//		        subtext: '2018年-05月',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient : 'vertical',
		        x : 'left',
		        data:xData
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            dataView : {show: true, readOnly: false},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    series : [
		        {
		            name:'车辆类型',
		            type:'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:sData
		        }
		    ]
		};
	return option;                   
}