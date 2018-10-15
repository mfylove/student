<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>用户登录</title>
<link href="Wopop_files/style_log.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="Wopop_files/style.css">
<link rel="stylesheet" type="text/css" href="Wopop_files/userpanel.css">
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/Wopop_files/jquery.ui.all.css"> --%>

</head>

<body class="login" mycollectionplug="bind">
<div class="login_m">
	<div class="login_logo"><img src="Wopop_files/logo.png" width="196" height="160"></div>
	<div class="login_boder">
	
	<div class="login_padding" id="login_model">
	<form id="myform" action="admin/tologin.do">
	<h2>用户名</h2>
	  <label>
	    <input type="text" id="username" name="username" class="txt_input txt_input2">
	  </label>
	<h2>密码</h2>
	  <label>
	    <input type="password" name="password" id="userpwd" class="txt_input">
	  </label>
	 
	  <div class="rem_sub">
	    <div class="rem_sub_l">
   	<label><font id="f1" color="red"></font></label>
   </div>
	    <label>
	      <input type="button" id="btn" class="sub_button" name="button" value="登陆" style="opacity: 0.7;">
	    </label>
	  </div>
	</form>
	  
	</div>
	<!--login_padding  Sign up end-->
	</div><!--login_boder end-->
</div><!--login_m end-->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		$("#btn").click(function(){
			
			var param = $("#myform").serialize();
			
			//alert(param);
			
			$.ajax({
				url:"tologin.do",
				data:param,
				dataType:"text",
				type:"post",
				success:function(rec){
					//alert(rec);
					if(rec=="0"){
						location.href="students.do"
					}else{
						$("#f1").html("用户名或密码错误")
					}
				}
				
			});
			
		});
		
	})
</script>
</body>
</html>