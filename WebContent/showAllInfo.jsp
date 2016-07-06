<%@ page import="com.zx.db.DBConn"%>
<%@ page import="com.zx.dao.TerrincidentDao"%>
<%@ page import="com.zx.model.Terrincident"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.top {
	margin-bottom: 15px;
}

.body-main {
	background: url(image/bkground.png) repeat-x;
}

.test-select {
	padding-top: 5px;
	padding-bottom: 5px;
	font-size: 18px;
	background-color: #fcfcfc;
	color: #000000;
}

.select-label {
	font-size: 18px;
	font-weight: bold;
	margin-right: 5px;
}

.table {
	text-overflow: elipsis;
	white-space: nowrap;
}

.liblogo {
	margin-top: 25px;
	margin-left: 25px;
}

.logo-container {
	height: 100px;
}
</style>
<title>恐怖事件</title>
</head>
<body class="body-main">


	<div class="containt-fluid logo-container">
		<div class="row">
			<!-- logo -->
			<div class="col-md-8">
				<img src="image/a_logo.png" class="img-responsive liblogo">
			</div>
			<!--  校徽  -->
			<div class="col-md-4">
				<div class="bg">
					<img src="image/bg-header.png" class="img-responsive">
				</div>
			</div>



		</div>
		<div class="containt-fluid">

			<%
				//显示操作
				List<Terrincident> resultInfor = TerrincidentDao.getAll();
				int rowCount = resultInfor.size();//总行数
				int i = 1;
				int pageSize = 10;
				int pageNow = 1;

				//默认显示第一页  s
				int pageCount = 0;//总页数  0
				String nowpage = (String) request.getParameter("pageNow");
				if (nowpage != null) {
					pageNow = Integer.parseInt(nowpage);
				}
				if (rowCount != 0) {
					if (rowCount % pageSize == 0) {
						pageCount = rowCount / pageSize;
					} else {
						pageCount = rowCount / pageSize + 1;
					}
				} else {
					pageCount = 0;
				}

				int beginIndex = (pageNow - 1) * pageSize + 1;
				int total = 0;
				if (!resultInfor.isEmpty()) {

					if (pageNow < pageCount) {
						total = beginIndex + pageSize;
					} else
						total = rowCount - (pageCount - 1) * pageSize + beginIndex;
					for (int j = beginIndex - 1; j < total - 1; j++) {

						Terrincident tempInfo = resultInfor.get(j);

						int id = tempInfo.getId();
						String date = tempInfo.getTerr_date().toString();
						String state = tempInfo.getTerr_state();
						String organization = tempInfo.getTerr_organization();
						int numberOfTerr = tempInfo.getTerr_numberOfTerr();
						int numberOfCas = tempInfo.getTerr_numberOfCas();
						String crimeForm = tempInfo.getTerr_crimeForm();
						String influence = tempInfo.getTerr_influence();

						int tempj = j;
			%>


			<%
				}
				}
			%>

			<div style="margin-top: 20px; width: 100%;" align="center">
				<form Action="" method="post">
					<%
						//删除操作
						String deleteName[];
						if (request.getParameter("ck") != null) {
							deleteName = request.getParameterValues("ck");
							int[] deleteId = new int[deleteName.length];

							TerrincidentDao.delTerrincident(deleteName);
						}
					%>
				</form>
				<form action="selectResult.jsp" class="top" method="post"
					name="selectInfo">
					<select class="test-select" name="state">
						<option value="1">按照国家查找结果</option>
						<option value="2">按照日期查找结果</option>
						<option value="3">按照国家和日期查找结果</option>
					</select> <span class="select-label">国家</span><input type="text"
						name="terr_coun" /><span class="select-label">日期</span><input
						type="text" style="margin-right: 10px;" name="terr_date1" />-<input
						style="margin-left: 10px;" type="text" name="terr_date2" /> <input
						class="btn btn-primary" type="submit" value="选择" /> <input
						class="btn btn-primary " type="button"
						onclick="window.location.href='add.jsp'"
						style="margin-left: 100px;" value="增加新事件" />
				</form>
				<form name="delete" action="" method="post">
					<table class="table table-responsive table-striped" width="100%"
						border="0" align="center" cellpadding="0" cellspacing="0">
						<tr align="center" height="30"
							style="border: 2px solid; text-align: center; vertical-align: middle; font-size: 18px; font-weight: bold;">

							<td width="58"><input class="btn btn-primary" type="submit"
								value="删除" onclick="return deleteConfirm()"></td>

							<td width="80">编号</td>
							<td width="80">日期</td>
							<td width="80">国家</td>
							<td width="80">组织</td>
							<td width="80">犯罪人数</td>
							<td width="80">伤亡人数</td>
							<td width="80">犯罪形式</td>
							<td width="80">社会影响</td>
							<td width="80">事件详情</td>
							<td width="80">罪犯详情</td>
							<td width="80">更新事件</td>

							<%
								List<Terrincident> list = TerrincidentDao.getAll();

								int n = list.size();
								for (int k = beginIndex - 1; k < total - 1; k++) {
									Terrincident t = list.get(k);

									int id = t.getId();
									String date = t.getTerr_date().toString();
									String state = t.getTerr_state();
									String organization = t.getTerr_organization();
									int numberOfTerr = t.getTerr_numberOfTerr();
									int numberOfCas = t.getTerr_numberOfCas();
									String crimeForm = t.getTerr_crimeForm();
									String influence = t.getTerr_influence();
							%>
						
						<tr align="center" height="30">

							<td width="58"><input type="checkbox" name="ck"
								value=<%=id%>></td>

							<td width="80"><%=id%></td>
							<td class="edit" width="80"><%=date%></td>
							<td class="edit" width="80"><%=state%></td>
							<td class="edit" width="80"><%=organization%></td>
							<td class="edit" width="80"><%=numberOfTerr%></td>
							<td class="edit" width="80"><%=numberOfCas%></td>
							<td class="edit" width="80"><%=crimeForm%></td>
							<td class="edit" width="80"><%=influence%></td>
							<td><a class="link-a btn btn-primary"
								href="showsubAll.jsp?id=<%=id%>">事件详情</a></td>
							<td><a class="link-a btn btn-primary"
								href="showcrimAll.jsp?id=<%=id%>">罪犯详情</a></td>
							<td width="58"><input class="btn btn-primary" id="toEdit"
								type="button" value="编辑"></td>
						</tr>
						<%
							}
						%>

					</table>
					<%
						if (pageCount != 0) {
							if (pageNow != 1) {
								out.println(" <a  href=showAllInfo.jsp?pageNow=1>首页</a> ");
								out.println(" <a   href=showAllInfo.jsp?pageNow=" + (pageNow - 1) + "> 上一页</a> ");
							}
							if (pageNow != pageCount) {
								out.println(" <a   href=showAllInfo.jsp?pageNow=" + (pageNow + 1) + "> 下一页</a>");
								out.println(" <a   href=showAllInfo.jsp?pageNow=" + pageCount + "> 尾页</a>");
							}
							//显示当前页的前三页与后三页
							for (i = ((pageNow - 3) > 0 ? (pageNow - 3) : 1); i <= (pageCount < (pageNow + 3)
									? pageCount
									: (pageNow + 3)); i++) {
								out.println("<a href=showAllInfo.jsp?pageNow=" + i + ">[" + i + "]</a>");
							}
						}
						out.print("第");
					%>
					<input type="text" name="pages" id="pages" size="3"
						onkeydown="return jump()" value="<%=pageNow%>"
						title="按回车键将快速跳转到指定页面" />
					<%
						out.print("/");
					%>
					<font size="2"><%=pageCount%></font>

					<%
						out.print("页");
					%>

				</form>
			</div>

		</div>



		<script type="text/javascript" src="jquery-1.11.1.js"></script>
		<script type="text/javascript">
			function deleteConfirm() {
				if (confirm("确认要删除吗?")) {
					return true;
				}
				return false;
			}

			$(function() {
				$("#toEdit").click(
						function() {
							str = $(this).val();
							if (str == "编辑") {
								$(this).val("确定"); // 按钮被点击后，在“编辑”和“确定”之间切换
								tr = $(this).parents("tr")
								$('.edit', tr).each(
										function() { // 获取当前行的其他单元格
											obj_text = $(this).find(
													"input:text"); // 判断单元格下是否有文本框
											if (!obj_text.length) // 如果没有文本框，则添加文本框使之可以编辑
												$(this).html(
														"<input type='text' value='"
																+ $(this)
																		.text()
																+ "'>");
											else
												// 如果已经存在文本框，则将其显示为文本框修改的值
												$(this).html(obj_text.val());
										});
							} else {
								$(this).val("编辑");
								tr = $(this).parents("tr")
								var data = new Array();
								$('.edit', tr).each(function() {
									obj_text = $(this).find("input:text");
									$(this).html(obj_text.val());
									data.push(obj_text.val());
								});
								var id = tr.children().eq(1).text();
								//alert(id)
								$.post("updateterri", {
									"id" : id,
									"terr_date" : data[0],
									"terr_state" : data[1],
									"terr_organization" : data[2],
									"terr_numberOfTerr" : data[3],
									"terr_numberOfCas" : data[4],
									"terr_crimeForm" : data[5],
									"terr_influence" : data[6]
								}, function callback(result) {
									alert(result.status);
								}, "json");
							}
							;
						});
			});

			/* function jump()
			{
				if(window.event.keyCode==13)
					{	
					var pages = document.getElementById("pages").value;//得到id为pages输入框的值
					var total= document.getElementById("total").value;//得到总页数
					
					if(pages>0&&pages<=total&&parseInt(pages)==pages)
						{
									   	alert("您输入的页码有误！"+pages);

				            window.location.href = "showAllInfo.jsp?pageNow="+pages;
				           return false;
						}
					 else
					    {
					    	return false;
					    }  
				     return true;
					}

			} */
		</script>
	</div>
</body>
</html>