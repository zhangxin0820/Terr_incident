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



<title>录入新数据</title>
</head>
<body align="center" >
	<div class="container form-group panel panel-primary">
	
		<dir class="panel-heading" style="background-color:#84c1ff;">
			<h1>增加新事件</h1>
		</dir>
		
		<div class="panel-body">
			<form action="addterri" method="post" name="insert">
				<!-- <input class ="form-control" type="text" name="id" placeholder="编号"> -->
				<input class ="form-control" type="text"name="terr_date" placeholder="日期">
				<input class ="form-control" type="text" name="terr_state" placeholder="国家">
				<input class ="form-control" type="text" name="terr_organization" placeholder="组织">
				<input class ="form-control" type="text" name="terr_numberOfTerr" placeholder="恐怖分子人数">
				<input class ="form-control" type="text" name="terr_numberOfCas" placeholder="伤亡人数">
				<input class ="form-control" type="text" name="terr_crimeForm" placeholder="犯罪形式">
				<input class ="form-control" type="text" name="terr_influence" placeholder="社会影响">
				<input class="btn btn-primary btn-lg" type="button" value="取消" onclick="window.location.href='showAllInfo.jsp'"> 
				<input class="btn btn-primary btn-lg" type="submit" style="margin-left:20px;"/>
			</form>
		</div>
	</div>
</body>
</html>
