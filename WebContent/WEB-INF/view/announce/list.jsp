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
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/html5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/respond.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/PIE_IE678.js"></script>
<![endif]-->
<link href="${pageContext.request.contextPath }/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/lib/font-awesome/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 7]>
<link href="${pageContext.request.contextPath }/lib/font-awesome/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<![endif]-->
<link href="${pageContext.request.contextPath }/lib/iconfont/iconfont.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>资源列表</title>
</head>
<body>
	<div class="pd-20">
		<div class="text-c">
			<input type="text" name="name" id="" placeholder="用户名称"
				style="width: 250px" class="input-text" />
			<button name="" id="" class="btn btn-success" type="submit">
				<i class="icon-search"></i> 搜用户
			</button>
		</div>
		<table
			class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">任务编号</th>
					<th width="60">发布人</th>
					<th width="80">任务期限</th>
					<th width="50">任务名称</th>
					<th width="50">任务分值</th>
					<th width="50">任务状态</th>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/lib/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/lib/layer1.8/layer.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/lib/laypage/laypage.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/H-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/H-ui.admin.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/H-ui.admin.doc.js"></script>
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
		$(function(){
			$.post("findAll.action",function(data){
				showPage(data);
			}, "json"); 
		})
		function showPage(data){
		var r = data;
		var nums = 10; //每页出现的数量
		var pages = Math.ceil(r.length/nums); //得到总页数
		var thisDate = function(curr){
		    var str = '', last = curr*nums - 1;
		    last = last >= r.length ? (r.length-1) : last;
		    for(var i = (curr*nums - nums); i <= last; i++){
		        str += "<tr class='text-c'>"
					+ "<td><input type='checkbox' value="+r[i].id+" name='ids' class='ids'></td>"
					+ "<td>"
					+ r[i].username
					+ "</td>"
					+ "<td class='text-l'><u style='cursor: pointer' class='text-primary' onClick='article_edit('10001','650','','查看','article-zhang.html')"
					+ "title='查看'>"
					+ r[i].userrealname
					+ "</u></td>"
					+ "<td>"
					+ r[i].userphone
					+ "</td>"
					+ "<td>"
					+ r[i].usersex
					+ "</td>"
					+ "<td>"
					+ r[i].useraddress
					+ "</td><td class='f-14 article-manage'></a> <a style='text-decoration: none' class='ml-5'"
					+ "onClick='article_edit('10001','','','资源编辑','article-edit.html')' href='javascript:;' title='修改'><i class='icon-edit'></i></a>"
					+ "<a style='text-decoration: none' class='ml-5' onClick='article_del(this,"
					+ r[i].id
					+ ")' href='javascript:;'title='删除'><i class='icon-trash'></i></a></td>"
					+ "</tr>";
		    }
		    return str;
		};

		//调用分页
		laypage({
		    cont: 'container',
		    pages: pages,
		   // skip: true, //是否开启跳页
		    skin: '#AF0000',
		    groups: 3,
		    jump: function(obj){
		    	$("tbody").html("");
		        $("tbody").append(thisDate(obj.curr));
		        
		    }
		});
	}
	</script>
</body>
</html>