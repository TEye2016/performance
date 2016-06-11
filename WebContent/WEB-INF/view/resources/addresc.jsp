<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="../lib/html5.js"></script>
<script type="text/javascript" src="../lib/respond.min.js"></script>
<script type="text/javascript" src="../lib/PIE_IE678.js"></script>
<![endif]-->
<link href="../css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="../css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="../lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
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
<title>添加资源</title>
</head>
<div class="pd-20">
	<form action="${pageContext.request.contextPath }/resources/save.action" method="post" class="form form-horizontal"
		id="form-user-add">
		<div class="row cl">
			<label class="form-label col-3">上级资源：</label>
			<div class="formControls col-5">
				<span class="select-box"> <select class="select" size="1"
					name="parentid" datatype="*" nullmsg="不能为空！">
						<c:forEach items="${parent }" var="p">
							<option value="${p.id }" selected>${p.name }</option>
						</c:forEach>
						<option value="1010" selected="selected">顶级菜单</option>
				</select>
				</span>
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>资源名称：</label>
			<div class="formControls col-5">
				<input type="text" class="input-text" value="" placeholder=""
					id="user-name" name="name" datatype="*2-16" nullmsg="资源名称不能为空">
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>资源URL：</label>
			<div class="formControls col-5">
				<input type="text" class="input-text" value="" placeholder="格式如：resources/save.action"
					id="" name="resurl" datatype="*2-36" nullmsg="资源URL">
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>资源Key：</label>
			<div class="formControls col-5">
				<input type="text" class="input-text" placeholder="格式如sys_user_add"
					name="reskey" id="" datatype="*2-36" nullmsg="资源Key不能为空！">
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>资源类型：</label>
			<div class="formControls col-5 skin-minimal">
				<div class="radio-box">
					<input type="radio" id="sex-1" name="type" datatype="*" value="0"
						nullmsg="请选择资源类型！"> <label for="sex-1">目录</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="sex-2" name="type" value="1"> <label
						for="sex-2">菜单</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="sex-3" name="type" value="2"> <label
						for="sex-3">按钮</label>
				</div>
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row cl">
			<label class="form-label col-3">资源描述：</label>
			<div class="formControls col-5">
				<textarea name="description" cols="" rows="" class="textarea"
					placeholder="对资源进行简单描述...最少输入10个字符" datatype="*10-100"
					dragonfly="true" nullmsg="资源描述不能为空！"
					onKeyUp="textarealength(this,100)"></textarea>
				<p class="textarea-numberbar">
					<em class="textarea-length">0</em>/100
				</p>
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row cl">
			<div class="col-9 col-offset-3">
				<input class="btn btn-primary radius" type="submit"
					value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="../lib/jquery.min.js"></script>
<script type="text/javascript" src="../lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="../lib/Validform_v5.3.2.js"></script>
<script type="text/javascript" src="../js/H-ui.js"></script>
<script type="text/javascript" src="../js/H-ui.admin.js"></script>
<script type="text/javascript">
	$(function() {
		$("#form-user-add").Validform({
			tiptype : 2,
		});
		$('.skin-minimal input').iCheck({
			checkboxClass : 'icheckbox-blue',
			radioClass : 'iradio-blue',
			increaseArea : '20%'
		});
	});
</script>
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
</body>
</html>