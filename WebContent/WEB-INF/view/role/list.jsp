<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="../lib/html5.js"></script>
<script type="text/javascript" src="../lib/respond.min.js"></script>
<script type="text/javascript" src="../lib/PIE_IE678.js"></script>
<![endif]-->
<link href="../css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="../css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../lib/font-awesome/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 7]>
<link href="../lib/font-awesome/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<![endif]-->
<link href="../lib/iconfont/iconfont.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="../lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>资源列表</title>
</head>
<body>
	<div class="pd-20">
		<div class="text-c">
			<input type="text" name="name" id="" placeholder=" 资源名称"
				style="width: 250px" class="input-text" />
			<button name="" id="" class="btn btn-success" type="submit">
				<i class="icon-search"></i> 搜资源
			</button>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" onclick="resourcesDelete()"
				class="btn btn-danger radius"><i class="icon-trash"></i> 批量删除</a> <a
				class="btn btn-primary radius"
				onclick="article_add('','','添加资源','${pageContext.request.contextPath}/resources/add.action')"
				href="javascript:;"><i class="icon-plus"></i> 添加资资源</a>
			</span>
		</div>
		<table 
			class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">角色编号</th>
					<th width="100">角色名称</th>
					<th width="80">角色Key</th>
					<th width="70">操作</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<center>
			<div id="container"></div>
		</center>
	</div>
	<script type="text/javascript" src="../lib/jquery.min.js"></script>
	<script type="text/javascript" src="../lib/layer1.8/layer.min.js"></script>
	<script type="text/javascript" src="../lib/laypage/laypage.js"></script>
	<script type="text/javascript"
		src="../lib/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="../js/H-ui.js"></script>
	<script type="text/javascript" src="../js/H-ui.admin.js"></script>
	<script type="text/javascript" src="../js/H-ui.admin.doc.js"></script>
	<script>
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
		var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://"
				: " http://");
		document
				.write(unescape("%3Cscript src='"
						+ _bdhmProtocol
						+ "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
	</script>
	<script src="http://res.layui.com/lay/lib/laypage/laypage.js"></script>
	<script type="text/javascript">
		$(function() {
			$.post("findAll.action",function(data){
				showPage(data["role"],data["page"]);
			}, "json"); 
			function article_del(obj, id) {
				layer.confirm('确认要删除吗？',
								function(index) {
									$.post("delete.action",{"ids" : id},function(data) {
									layer.msg('删除成功!', 1);
										showPage(data)}, "json");
								});
			}
		});
		function resourcesDelete() {
			var a = 0;
			var ids = "";
			var input = $(".ids");
			for (var i = 0; i < input.length; i++) {
				if (input[i].checked) {
					ids += input[i].value + ",";
					a++;
				}
			}
			if (a > 0) {
				layer.confirm('确认要删除吗？', function(index) {
					ids = ids.substring(0, ids.lastIndexOf(","));
					$.post("delete.action",{"ids":ids},function(data){
						layer.msg('删除成功!', 1);
						showPage(data);
					},"json");
				})
			} else {
				layer.msg('至少选择一项!', 1);
			}
		}
		function showPage(data,page){
			    var ccId = parseInt($("#hid_ccid").val(), 10);  
			    var saveKey = $("#targetKey").val();  
			    var pageSize = 10;  
			  //http://blog.csdn.net/qin_zhangyongheng/article/details/47381583
			    //以下将以jquery.ajax为例，演示一个异步分页  
			    $.getJSON('/Mobile/AjaxHandler/QuestionAjax.aspx?action=GetRedisJoinMemberInformationById', {  
			        type: 2,  
			        ccId: ccId,  
			        pageIndex: 1,  
			        pageSize: pageSize,  
			        saveKey: saveKey  
			    },  
			    function (res) { //从第1页开始请求。返回的json格式可以任意定义  
			        laypage({  
			            cont: 'page1', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>  
			            pages: res.pageCount, //通过后台拿到的总页数  
			            curr: 1, //初始化当前页  
			            skin: '#429842',//皮肤颜色  
			            groups: 3, //连续显示分页数  
			            skip: true, //是否开启跳页  
			            first: '首页', //若不显示，设置false即可  
			            last: '尾页', //若不显示，设置false即可  
			            //prev: '<', //若不显示，设置false即可  
			            //next: '>', //若不显示，设置false即可  
			            jump: function (e) { //触发分页后的回调  
			                $.getJSON('/Mobile/AjaxHandler/QuestionAjax.aspx?action=GetRedisJoinMemberInformationById', {  
			                    type: 2,  
			                    ccId: ccId,  
			                    pageIndex: e.curr,//当前页  
			                    pageSize: pageSize,  
			                    saveKey: saveKey  
			                }, function (res) {  
			                    e.pages = e.last = res.pageCount; //重新获取总页数，一般不用写  
			                    //渲染  
			                    var view = document.getElementById('userTable'); //你也可以直接使用jquery  
			                    //解析数据  
			                    var resultHtml = PackagData(res);  
			                    view.innerHTML = resultHtml;  
			                });  
			            }  
			        });  
			    });  
		}
	</script>
</body>
</html>