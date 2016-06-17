<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>添加用户</title>
<%@include file="../title.jspf"%>
</head>
<body>
	<div class="pd-20">
		<form action="" method="post" class="form form-horizontal"
			id="form-user-add">
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>用户姓名：</label>
				<div class="formControls col-4">
					<input type="text" class="input-text" placeholder=""
						name="userrealname" id="name" datatype="*2-16" nullmsg="用户姓名不能为空">
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>用户工号：</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" placeholder="用户工号"
						id="username" name="username" datatype="m" nullmsg="用户工号不能为空">
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>用户密码：</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" placeholder="密码" id="roleKey"
						name="userpassword" datatype="m" nullmsg="用户密码不能为空">
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>用户地址：</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" placeholder="地址" id="useraddress"
						name="useraddress" datatype="m" nullmsg="用户地址不能为空">
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>用户联系方式：</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" placeholder="联系方式"
						id="userphone" name="userphone" datatype="m" nullmsg="联系方式不能为空">
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>性别：</label>
				<div class="formControls col-5 skin-minimal">
					<div class="radio-box">
						<input type="radio" id="sex-1" name="usersex" datatype="*"
							value="男" nullmsg="请选择性别！"> <label for="sex-1">男</label>
					</div>
					<div class="radio-box">
						<input type="radio" id="sex-2" name="usersex" value="女"> <label
							for="sex-2">女</label>
					</div>
					<div class="radio-box">
						<input type="radio" id="sex-3" name="usersex" value="保密">
						<label for="sex-3">保密</label>
					</div>
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">添加角色：</label>
				<div class="formControls col-5">
					<table class="table table-border table-bordered">
						<tr>
							<td>系统角色</td>
							<td></td>
							<td>用户拥有角色</td>
						</tr>
						<tr>
							<td width="100px">
								<!--multiple="multiple" 能同时选择多个   size="10"  确定下拉选的长度--> <select
								multiple="multiple" size="10" id="left" style="width: 100%">
									<c:forEach items="${roles }" var="r">
										<option value="${r.id }">${r.name }</option>
									</c:forEach>
							</select>
							</td>
							<td width="8" valign="middle"><input type="button" id="add"
								value="&nbsp;&nbsp;add&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
								class="btn btn-secondary-outline radius" style="width: 100%">
								<input type="button" id="addAll"
								class="btn btn-secondary-outline radius" style="width: 100%"
								value="&nbsp;&nbsp;add&nbsp;All&nbsp;&nbsp;&nbsp;&nbsp;">
								<input type="button" id="remove"
								class="btn btn-secondary-outline radius"
								value="&nbsp;&nbsp;remove&nbsp;&nbsp;&nbsp;" style="width: 100%">
								<input type="button" id="removeAll"
								class="btn btn-secondary-outline radius" style="width: 100%"
								value="remove All"></td>
							<td width="100px" align="left"><select multiple="multiple"
								size="10" id="right" style="width: 100%">
									<option value=""></option>
							</select></td>
						</tr>
					</table>
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
		window.onload = function() {
			//获取左边的select
			var leftElement = document.getElementById("left");
			//获取option
			var optionElements = leftElement.getElementsByTagName("option");
			//获取右边的select
			var rightElement = document.getElementById("right");
			//获取右边的option
			var rightoptions = rightElement.getElementsByTagName("option");
			var len = rightoptions.length;
			var length = optionElements.length;
			/**
			 *遍历左边option
			 * leftElement.selectedIndex
			 *  *表示当前被选中的索引的值
			 *  *不等于-1表示被选中
			 */
			document.getElementById("add").onclick = function() {
				for (var i = 0; i < length; i++) {
					var optionele = optionElements[i];
					if (leftElement.selectedIndex != -1)
						rightElement
								.appendChild(optionElements[leftElement.selectedIndex]);
				}
			}
			/**
			 *双击 添加
			 */
			document.getElementById("left").ondblclick = function() {
				rightElement.appendChild(optionElements[this.selectedIndex]);
			}
			/**
			 * 从右边移除
			 */
			document.getElementById("remove").onclick = function() {
				for (var i = 0; i < len; i++) {
					if (rightElement.selectedIndex != -1)
						leftElement
								.appendChild(rightoptions[rightElement.selectedIndex]);
				}
			}
			/**
			 *双击从右边移除
			 */
			rightElement.ondblclick = function() {
				leftElement
						.appendChild(rightoptions[rightElement.selectedIndex]);
			}
			/**
			 *从左至右全部添加
			 */
			document.getElementById("addAll").onclick = function() {
				for (var i = 0; i <= length; i++)
					rightElement.appendChild(optionElements[0]);
			}
			/**
			 * 从右至左全部移除
			 */
			document.getElementById("removeAll").onclick = function() {
				var leftlen = rightElement.getElementsByTagName("option").length;
				for (var i = 0; i < leftlen; i++)
					leftElement.appendChild(rightoptions[0]);
			}
			document.getElementById("submit").onclick = function() {
				var len2 = rightElement.getElementsByTagName("option").length;
				var optionValue;
				for (var i = 1; i < len2; i++) {
					if (optionValue == null)
						optionValue = rightoptions[i].value + ",";
					else
						optionValue += rightoptions[i].value + ",";
				}
				var name = document.getElementById("name").value;
				var roleKey = document.getElementById("roleKey").value;
				var useraddress = document.getElementById("useraddress").value;
				var userSex = $("input[type='radio']:checked").val();
				var description = document.getElementById("userphone").value;
				$.post("role/save.action", {
					"userrealname":name,
					"userpassword" : roleKey,
					"userphone" : description,
					"useraddress":useraddress,
					"userSex":userSex,
					"roleids":optionValue
				}, function(data) {
					alert("添加成功！")
				}, "json");
			}
		}
	</script>
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