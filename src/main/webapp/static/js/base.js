	var printPage=function(){
		bdhtml=window.document.body.innerHTML;//获取当前页的html代码
		sprnstr="<!-- Begin -->";//设置打印开始区域
		eprnstr="<!-- End -->";//设置打印结束区域
		prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+18); //从开始代码向后取html
		prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html
		window.document.body.innerHTML=prnhtml;
		window.print();
		window.document.body.innerHTML=bdhtml;
	};