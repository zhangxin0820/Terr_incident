<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" href = "bootstrap/css/bootstrap.min.css">

<style>
	.form-control{
		margin-top:10px;
		margin-bottom:10px;
	}
	.panel{
		margin-top:30px;
	}
	
	.panel-heading{
		font-weight:bold;
		font-style:italic;
		text-align:left;
	}
</style>
<title>Insert title here</title>
</head>
<body align="center" >
	<div class="container form-group panel panel-primary">
		<dir class="panel-heading" style="background-color:#84c1ff;">
			<h1>增加罪犯个人信息</h1>
		</dir>
		<div class="panel-body">
			<form action="addterri_crim" method="post" name="insert">
				<!-- <input class ="form-control" type="text" name="terr_id" placeholder="犯罪分子编号"> --> 
				<input class ="form-control" type="text" name="event_id" placeholder="索引编号">
				<input class ="form-control" type="text" name="terr_name" placeholder="名字">
				<input class ="form-control" type="text" name="terr_gender" placeholder="性别">
				<input class ="form-control" type="text" name="terr_birthday" placeholder="生日"> 
				<input class ="form-control" type="text" name="terr_job" placeholder="工作">
				<input class="btn btn-primary btn-lg" type="button" value="取消" onclick="showcrimAll.jsp" > 
				<input class="btn btn-primary btn-lg" type="submit" style="margin-left:20px;">
			</form>
		</div>
	</div>
</body>
</html>