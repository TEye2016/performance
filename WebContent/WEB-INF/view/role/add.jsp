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
				<label class="form-label col-3"><span class="c-red">*</span>角色名称：</label>
				<div class="formControls col-4">
					<input type="text" class="input-text" placeholder="" name="name"
						id="name" datatype="*2-16" nullmsg="用户名不能为空">
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>角色Key：</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" placeholder="格式如Admin、User"
						id="roleKey" name="roleKey" datatype="m" nullmsg="角色key不能为空">
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">角色描述：</label>
				<div class="formControls col-5">
					<textarea name="description" cols="" rows="" class="textarea"
						id="description" placeholder="描述一下所添加的角色...最少输入10个字符"
						datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！"
						onKeyUp="textarealength(this,100)"></textarea>
					<p class="textarea-numberbar">
						<em class="textarea-length">0</em>/100
					</p>
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">角色赋权：</label>
				<div class="formControls col-5">
					<table class="table table-border table-bordered">
						<tr>
							<td>系统权限</td>
							<td></td>
							<td>角色拥有权限</td>
						</tr>
						<tr>
							<td width="100px">
								<!--multiple="multiple" 能同时选择多个   size="10"  确定下拉选的长度--> <select
								multiple="multiple" size="10" id="left" style="width: 100%">
									<c:forEach items="${resources }" var="r">
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
				for (var i = 0; i < length; i++)
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
				var description = document.getElementById("description").value;
				$.post("role/save.action",{"name":name,"roleKey":roleKey,"description":description},function(data){
					
				},"text/json");
			}
		}
	</script>
</body>
</html>