<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../title.jspf"%>
<title>添加资源</title>
</head>
<body>
	<div class="pd-20">
		<form
			action="${pageContext.request.contextPath }/resources/save.action"
			method="post" class="form form-horizontal" id="form-user-add">
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>资源名称：</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" placeholder="" value="${r.name }"
						id="user-name" name="name" datatype="*2-16" nullmsg="资源名称不能为空">
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>资源URL：</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" 
						placeholder="格式如：resources/save.action" id="" name="resurl" value="${r.resurl }"
						datatype="*2-36" nullmsg="资源URL">
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>资源Key：</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" placeholder="格式如sys_user_add"
						name="reskey" id="" datatype="*2-36" nullmsg="资源Key不能为空！" value="${r.reskey }">
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">资源描述：</label>
				<div class="formControls col-5">
					<textarea name="description" cols="" rows="" class="textarea"
						placeholder="对资源进行简单描述...最少输入10个字符" datatype="*10-100"
						dragonfly="true" nullmsg="资源描述不能为空！"
						onKeyUp="textarealength(this,100)">${r.description }</textarea>
					<p class="textarea-numberbar">
						<em class="textarea-length">0</em>/100
					</p>
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<div class="col-9 col-offset-3">
					<c:if test="${not empty message }">
						<b style="color: red">${message }</b>
					</c:if>
				</div>
			</div>
			<div class="row cl">
				<div class="col-9 col-offset-3">
					<input class="btn btn-primary radius" type="submit" id="submit"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</div>
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
</body>
</html>