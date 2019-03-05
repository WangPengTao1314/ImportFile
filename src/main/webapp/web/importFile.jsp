<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>供应商信息导入</title>
</head>
<body>
	<div>
		<form   action="/importFile.do" method="POST"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="file">上传文件</label> <input type="file" id="file"
					name="file">
			</div>
			 
		</form>
	</div>

</body>
</html>