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
<title>录入子事件</title>
</head>
<body align="center" >
	<div class="container form-group panel panel-primary">
	
		<dir class="panel-heading" style="background-color:#84c1ff;">
			<h1>增加子事件</h1>
		</dir>
		<div class="panel-body">
			<form action="addterri_sub" method="post" name="insert">
				<!-- <input class ="form-control" type="text" name="sub_id" placeholder="子编号"> -->
				<input class ="form-control" type="text" name="sub_event_id" placeholder="索引编号">
				<input class ="form-control" type="text" name="terr_location" placeholder="地点">
				<input class ="form-control" type="text" name="terr_measure" placeholder="手段">
				<input class ="form-control" type="text" name="terr_sub_numberOfTerr" placeholder="恐怖分子人数">
				<input class ="form-control" type="text" name="terr_sub_numberOfCas" placeholder="伤亡人数">
				<input class="btn btn-primary btn-lg" type="button" value="取消" onclick="showsubAll.jsp"> 
				<input class="btn btn-primary btn-lg" type="submit" style="margin-left:20px;">
			</form>
		</div>
	</div>
	<!-- <script type="text/javascript">
		function submit() {
			var sub_id = document.getElementById("id").value;
			window.location.href = "showsubAll.jsp?id =" + sub_id;
		}
	</script> -->
</body>
</html>