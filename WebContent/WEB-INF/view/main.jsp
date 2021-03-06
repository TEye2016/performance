<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="../favicon.ico" >
<LINK rel="Shortcut Icon" href="../favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="../lib/html5.js"></script>
<script type="text/javascript" src="../lib/respond.min.js"></script>
<script type="text/javascript" src="../lib/PIE_IE678.js"></script>
<![endif]-->
<link href="../css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="../css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../lib/iconfont/iconfont.css" rel="stylesheet" type="text/css" />
<link href="../lib/font-awesome/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]>
<link href="../lib/font-awesome/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="../lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>滁州学院</title>
<meta name="keywords" content="">
<meta name="description" content="">
</head>
<body>
<header class="Hui-header cl"> <a class="Hui-logo l" title="教师绩效管理系统" href="/">计算机与信息工程学院</a> <a class="Hui-logo-m l" href="/" title="H-ui.admin"></a> <span class="Hui-subtitle l"></span> <span class="Hui-userbox"><span class="c-white">欢迎：${sessionScope.userSession.userrealname }</span> <a class="btn btn-danger radius ml-10" href="${pageContext.request.contextPath }/user/loginOut.action" title="退出"><i class="icon-off"></i> 退出</a></span> <a aria-hidden="false" class="Hui-nav-toggle" href=""></a> </header>
<aside class="Hui-aside">
  <input runat="server" id="divScrollValue" type="hidden" value="" />
  <div class="menu_dropdown bk_2">
    <c:forEach items="${resources}" var="key" varStatus="stut">
    <dl id="menu-system">
		<c:if test="${key.type eq 0}">
      <dt><i class="icon-cogs"></i> ${key.name}<i class="iconfont menu_dropdown-arrow">&#xf02a9;</i></dt>
     	</c:if>
      <dd>
        <ul>
        <c:forEach items="${resources}" var="k">
			<c:if test="${k.parentId eq key.id}">
			<c:if test="${k.type eq 1}">
          <li><a _href="${pageContext.request.contextPath }/${k.resurl }" href="javascript:void(0)">${k.name}</a></li>
        	</c:if>
        	</c:if>
        </c:forEach>
        </ul>
      </dd>
    </dl>
      </c:forEach>
  </div>
</aside>
<div class="dislpayArrow"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
  <div id="Hui-tabNav" class="Hui-tabNav">
    <div class="Hui-tabNav-wp">
      <ul id="min_title_list" class="acrossTab cl">
        <li class="active"><span title="我的桌面" data-href="welcome.html">我的桌面</span><em></em></li>
      </ul>
    </div>
    <div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="icon-step-backward"></i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="icon-step-forward"></i></a></div>
  </div>
  <div id="iframe_box" class="Hui-article">
    <div class="show_iframe">
      <div style="display:none" class="loading"></div>
      <iframe scrolling="yes" frameborder="0" src="main.action"></iframe>
    </div>
  </div>
</section>
<script type="text/javascript" src="../lib/jquery.min.js"></script> 
<script type="text/javascript" src="../lib/Validform_v5.3.2.js"></script> 
<script type="text/javascript" src="../lib/layer1.8/layer.min.js"></script> 
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
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
</script>
</body>
</html>