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
				style="width: 250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit">
				<i class="icon-search"></i> 搜资源
			</button>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" onclick="datadel()"
				class="btn btn-danger radius"><i class="icon-trash"></i> 批量删除</a> <a
				class="btn btn-primary radius"
				onclick="article_add('','','添加资源','${pageContext.request.contextPath}/resources/add.action')"
				href="javascript:;"><i class="icon-plus"></i> 添加资资源</a></span> <span
				class="r">共有数据：<strong></strong> 条
			</span>
		</div>
		<table
			class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">资源编号</th>
					<th width="100">资源名称</th>
					<th width="80">资源类型</th>
					<th width="100">资源URL</th>
					<th width="70">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ resources}" var="r">
					<tr class="text-c">
						<td><input type="checkbox" value="${r.id }" name="ids"
							class="ids"></td>
						<td>${r.id }</td>
						<td class="text-l"><u style="cursor: pointer"
							class="text-primary"
							onClick="article_edit('10001','650','','查看','article-zhang.html')"
							title="查看">${r.name }</u></td>
						<td><c:if test="${r.type eq 0  }">目录</c:if> <c:if
								test="${r.type eq 1  }">菜单</c:if> <c:if test="${r.type eq 2  }">按钮</c:if></td>
						<td>${r.resurl }</td>
						<td class="f-14 article-manage"><a
							style="text-decoration: none"
							onClick="article_xiajia(this,'10001')" href="javascript:;"
							title="删除"><i class="icon-hand-down"></i></a> <a
							style="text-decoration: none" class="ml-5"
							onClick="article_edit('10001','','','资源编辑','article-edit.html')"
							href="javascript:;" title="修改"><i class="icon-edit"></i></a> <a
							style="text-decoration: none" class="ml-5"
							onClick="article_del(this,'10001')" href="javascript:;"
							title="删除"><i class="icon-trash"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form
			action="${pageContext.request.contextPath }/resources/findAll.action"
			name="pagedForm">
			<div id="pageNav" class="pageNav">${page.pagedView}</div>
		</form>
		<form id="su" action="${pageContext.request.contextPath}/resources/delete.action">
			<input type="hidden" name="ids" id="hid" value="1212">
		</form>
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
	<script type="text/javascript">
		function datadel() {
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
					document.getElementById("hid").value=ids;
					$("#su").submit();
				})
			} else {
				layer.msg('至少选择一项!', 1);
			}
		}
	</script>
</body>
</html>