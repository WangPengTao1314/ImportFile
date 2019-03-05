<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学子商城注册页面</title>
</head>
<body>
	<div class="parent">
		<!--<video src="audio/snow.mp4" width="100%" autoplay loop muted></video>-->
		<div class="container">
			<div class="panel rt">
				<form id="form-register" method="post" action="">
					<div class="txt">
						<p>
							新用户注册 <span> <a href="${pageContext.request.contextPath}/web/importFile.jsp">直接登录</a>
							</span>
						</p>
					</div>
					<div class="form-group">
						<label for="uname">用户名：</label> <input autocomplete required
							minlength="6" maxlength="9" type="text" placeholder="请输入用户名"
							autofocus name="uname" id="uname" /> <span class="msg-default"
							id="unameSpan">用户名长度在6到9位之间</span>
					</div>
					<div class="form-group">
						<label for="upwd">登录密码：</label> <input required type="password"
							minlength="6" maxlength="12" placeholder="请输入密码" name="upwd"
							autofocus id="upwd" /> <span class="msg-default hidden">密码长度在6到12位之间</span>
					</div>
					<div class="form-group">
						<label for="upwdconfirm">确认密码：</label> <input required
							type="password" minlength="6" maxlength="12" placeholder="请确认密码"
							name="upwdconfirm" autofocus id="upwdconfirm" /> <span
							class="msg-default hidden">密码长度在6到12位之间</span>
					</div>
					<div class="form-group">
						<label for="email">邮箱：</label> <input autocomplete required
							type="email" placeholder="请输入邮箱地址" name="email" id="email" /> <span
							class="msg-default hidden" id="emailSpan">请输入合法的邮箱地址</span>
					</div>
					<div class="form-group">
						<label for="phone">手机号：</label> <input id="phone" name="phone"
							placeholder="请输入您的手机号"
							pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$"
							required type="text" /> <span class="msg-default hidden"
							id="phoneSpan">请输入合法的手机号</span>
					</div>
					<div class="form-group">
						<label></label> <input type="button" value="提交注册信息"
							id="bt-register" />
					</div>
				</form>
			</div>
		</div>
	</div>

	<!--弹出的小广告-->
	<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
	<script>
		/* 
		 *lenghts??????? 
		 *提问?这是一个什么鬼?
		 怎么去理解这个操作?
		 */

		$('#bt-register').click(function() {
			var lengths = 0;
			$('.form-group').each(function() {
				if ($(this).find('span').hasClass('msg-success')) {
					lengths++;
				}
			});
			if (lengths == 5) {
				$.ajax({
					"url" : "${pageContext.request.contextPath}/register.do",
					"data" : $("#form-register").serialize(),
					"type" : "GET",
					"dataType" : "json",
					"success" : function(obj) {
						if (obj.state == 0) {
							alert(obj.message);
						}
					}
				});
			}

		})
	</script>
	<script>
		/*1.对用户名进行验证*/
		uname.onblur = function() {
			if (this.validity.valueMissing) {
				this.nextElementSibling.innerHTML = '用户名不能为空';
				this.nextElementSibling.className = 'msg-error';
				this.setCustomValidity('用户名不能为空');
			} else if (this.validity.tooShort) {
				this.nextElementSibling.innerHTML = '用户名不能少于6位';
				this.nextElementSibling.className = 'msg-error';
				this.setCustomValidity('用户名不能少于6位');
			} else {
				this.nextElementSibling.innerHTML = '用户名格式正确';
				this.nextElementSibling.className = 'msg-success';
				this.setCustomValidity('');
				var data = document.getElementById("uname").value;
				if (!data) { //用户没有输入任何内容
					return;
				}
				/**发起异步GET请求，询问服务器用户名是否已经存在**/

				$.ajax({
					"url" : "${pageContext.request.contextPath}/checkName.do",
					"data" : "username=" + $("#uname").val(),
					"dataType" : "json",
					"type" : "POST",
					"success" : function(obj) {
						//alert(obj.state+","+obj.message);
						$("#unameSpan").html(obj.message);
						if (obj.state == 0) {
							$("#unameSpan").attr("class", "msg-error");
						} else {
							$("#unameSpan").attr("class", "msg-success");
						}
					}
				});

			}
		}

		uname.onfocus = function() {
			this.nextElementSibling.innerHTML = '用户名长度在6到9位之间';
			this.nextElementSibling.className = 'msg-default';
		}
		upwd.onfocus = function() {
			this.nextElementSibling.innerHTML = '密码长度在6到12位之间';
			this.nextElementSibling.className = 'msg-default';
		}
		upwd.onblur = function() {
			if (this.validity.valueMissing) {
				this.nextElementSibling.innerHTML = '密码不能为空';
				this.nextElementSibling.className = 'msg-error';
				this.setCustomValidity('密码不能为空');
			} else if (this.validity.tooShort) {
				this.nextElementSibling.innerHTML = '密码长度在尽量别少于6位';
				this.nextElementSibling.className = 'msg-error';
				this.setCustomValidity('密码长度在尽量别少于6位');
			} else {
				this.nextElementSibling.innerHTML = '密码格式正确';
				this.nextElementSibling.className = 'msg-success';
				this.setCustomValidity('');
			}
		}

		upwdconfirm.onfocus = function() {
			this.nextElementSibling.innerHTML = '密码长度在6到12位之间';
			this.nextElementSibling.className = 'msg-default';
		}
		upwdconfirm.onblur = function() {
			if (this.validity.valueMissing) {
				this.nextElementSibling.innerHTML = '密码不能为空';
				this.nextElementSibling.className = 'msg-error';
				this.setCustomValidity('密码不能为空');
			} else if (this.validity.tooShort) {
				this.nextElementSibling.innerHTML = '密码长度在尽量别少于6位';
				this.nextElementSibling.className = 'msg-error';
				this.setCustomValidity('密码长度在尽量别少于6位');
			} else {
				this.nextElementSibling.innerHTML = '密码格式正确';
				this.nextElementSibling.className = 'msg-success';
				this.setCustomValidity('');
			}
		}

		/*3.对邮箱地址进行验证*/
		email.onblur = function() {
			if (this.validity.valueMissing) {
				this.nextElementSibling.innerHTML = '邮箱不能为空';
				this.nextElementSibling.className = 'msg-error';
				this.setCustomValidity('邮箱不能为空');
			} else if (this.validity.typeMismatch) {
				this.nextElementSibling.innerHTML = '邮箱格式不正确';
				this.nextElementSibling.className = 'msg-error';
				this.setCustomValidity('邮箱格式不正确');
			} else {
				this.nextElementSibling.innerHTML = '邮箱格式正确';
				this.nextElementSibling.className = 'msg-success';
				this.setCustomValidity('');

				var data = document.getElementById("email").value;
				if (!data) { //用户没有输入任何内容
					return;
				}
				/**发起异步GET请求，询问服务器用户名是否已经存在**/
				$.ajax({
					"url" : "${pageContext.request.contextPath}/checkEmail.do",
					"data" : "email=" + $("#email").val(),
					"dataType" : "json",
					"type" : "POST",
					"success" : function(obj) {
						//alert(obj.state+","+obj.message);
						$("#emailSpan").html(obj.message);
						if (obj.state == 0) {
							$("#emailSpan").attr("class", "msg-error");
						} else {
							$("#emailSpan").attr("class", "msg-success");
						}
					}
				});

			}
		}

		email.onfocus = function() {
			this.nextElementSibling.innerHTML = '请输入合法的邮箱地址';
			this.nextElementSibling.className = 'msg-default';
		}
		/*3.对手机号进行验证*/
		phone.onblur = function() {
			if (this.validity.valueMissing) {
				this.nextElementSibling.innerHTML = '手机号不能为空';
				this.nextElementSibling.className = 'msg-error';
				this.setCustomValidity('手机号不能为空');
			} else if (this.validity.patternMismatch) {
				this.nextElementSibling.innerHTML = '手机号格式不正确';
				this.nextElementSibling.className = 'msg-error';
				this.setCustomValidity('手机号格式不正确');
			} else {
				this.nextElementSibling.innerHTML = '手机号格式正确';
				this.nextElementSibling.className = 'msg-success';
				this.setCustomValidity('');

				var data = document.getElementById("phone").value;
				if (!data) { //用户没有输入任何内容
					return;
				}
				/**发起异步GET请求，询问服务器用户名是否已经存在**/
				$.ajax({
					"url" : "${pageContext.request.contextPath}/checkPhone.do",
					"data" : "phone=" + $("#phone").val(),
					"dataType" : "json",
					"type" : "POST",
					"success" : function(obj) {
						//alert(obj.state+","+obj.message);
						$("#phoneSpan").html(obj.message);
						if (obj.state == 0) {
							$("#phoneSpan").attr("class", "msg-error");
						} else {
							$("#phoneSpan").attr("class", "msg-success");
						}
					}
				});

			}
		}
		phone.onfocus = function() {
			this.nextElementSibling.innerHTML = '请输入合法的手机号';
			this.nextElementSibling.className = 'msg-default';
		}
	</script>
</body>
</html>