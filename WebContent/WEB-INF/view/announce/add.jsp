<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../title.jspf"%>
<title>发布任务</title>
</head>
<body>
	<div class="pd-20">
		<form
			action="${pageContext.request.contextPath }/announce/save.action"
			method="post" class="form form-horizontal" id="form-user-add"  enctype="multipart/form-data">
			<div class="row cl">
				<label class="form-label col-3">附件：</label>
				<div class="formControls col-5">
					<span class="btn-upload form-group"> <input
						class="input-text upload-url" type="text" name="uploadfile-2"
						id="uploadfile-2" readonly style="width: 200px"> <a
						href="javascript:void();"
						class="btn btn-primary radius upload-btn"><i class="iconfont">&#xf0020;</i>
							浏览文件</a> <input type="file" name="appendixfile" class="input-file">
					</span>
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>任务标题：</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" value="" placeholder=""
						id="user-name" name="aName" datatype="*2-16" nullmsg="任务标题不能为空">
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>任务分值：</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" value=""
						placeholder="任务分值应小于10" id="" name="aScore" datatype="*1-2"
						nullmsg="任务分值">
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>任务起止时间：</label>
				<div class="formControls col-5">
					<input type="text"
						onfocus="WdatePicker({minDate:'%y-%M-%d\'}'})"
						id="datemin" class="input-text Wdate" style="width: 120px;"
						name="beginDate"> - <input type="text"
						onfocus="WdatePicker({minDate:'%y-%M-{%d+1}\'}'})"
						id="datemax" class="input-text Wdate" style="width: 120px;"
						name="endDate"/>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">任务详情：</label>
				<div class="formControls col-5">
					<textarea name="aDetail" cols="" rows="" class="textarea"
						placeholder="对任务进行简单描述...最少输入10个字符" datatype="*10-100"
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