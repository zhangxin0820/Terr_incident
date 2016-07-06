<%@ page import="java.util.LinkedList"%>
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
<style>
.body-main {
	background: url(image/bkground.png) repeat-x;
}

.table {
	text-overflow: elipsis;
	white-space: nowrap;
}

.add-btn {
	margin-top: 30px;
	margin-bottom: 15px;
	margin-right: 30px;
}

.liblogo {
	margin-top: 25px;
	margin-left: 25px;
}

.logo-container {
	height: 100px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>数据查询</title>
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
		<%
			request.setCharacterEncoding("utf-8");
			//response.setCharacterEncoding("utf-8");
			String tempvalue1 = new String();

			Date tempvalue2 = null;
			Date tempvalue3 = null;
			
			String terr_coun = request.getParameter("terr_coun");
			String type = request.getParameter("state");
			//String type = new String(request.getParameter("state").getBytes("ISO-8859-1"), "utf-8");
			List<Terrincident> result = new LinkedList<Terrincident>();

			if (type.equals("1")) {
				tempvalue1 = terr_coun;
				//System.out.println("qwq"+tempvalue1);
				try {
					result = TerrincidentDao.getAll(terr_coun);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			if (type.equals("2")) {
				String tempterr_date1 = new String(request.getParameter("terr_date1").toString());
				String tempterr_date2 = new String(request.getParameter("terr_date2").toString());
				Date terr_date1 = Date.valueOf(tempterr_date1);
				Date terr_date2 = Date.valueOf(tempterr_date2);
				tempvalue2 = terr_date1;
				tempvalue3 = terr_date2;
				try {
					result = TerrincidentDao.getAll(terr_date1, terr_date2);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (type.equals("3")) {
				String tempterr_date1 = new String(request.getParameter("terr_date1").toString());
				String tempterr_date2 = new String(request.getParameter("terr_date2").toString());
				Date terr_date1 = Date.valueOf(tempterr_date1);
				Date terr_date2 = Date.valueOf(tempterr_date2);
				tempvalue1 = terr_coun;
				
				tempvalue2 = terr_date1;
				tempvalue3 = terr_date2;
				try {
					result = TerrincidentDao.getAll(terr_coun, terr_date1, terr_date2);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		%>
		<%
			//显示操作
			int rowCount = result.size();//总行数
			int i = 1;
			int pageSize = 10;
			int pageNow = 1;

			//默认显示第一页  
			int pageCount = 0;//总页数  0
			String nowpage = request.getParameter("pageNow");
			if (nowpage != null) {
				pageNow = Integer.parseInt(nowpage);
			}
			if (rowCount % pageSize == 0) {
				pageCount = rowCount / pageSize;
			} else {
				pageCount = rowCount / pageSize + 1;
			}

			int beginIndex = (pageNow - 1) * pageSize + 1;
			int total = 0;
			if (!result.isEmpty()) {

				if (pageNow < pageCount) {
					total = beginIndex + pageSize;
				} else
					total = rowCount - (pageCount - 1) * pageSize + beginIndex;
				for (int j = beginIndex - 1; j < total - 1; j++) {

					Terrincident tempInfo = result.get(j);

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

		<div style="margin-top: 20px;" align="center">
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
			<form name="delete" action="" method="post">
				<input class="btn btn-primary add-btn pull-right" type="button"
					onclick="window.location.href='showAllInfo.jsp'" value="返回主页面" />
				<table class="table table-responsive table-striped" width="100%"
					border="0" align="center" cellpadding="0" cellspacing="0">
					<tr align="center" height="30"
						style="border: 2px solid; text-align: center; vertical-align: middle; font-size: 18px; font-weight: bold;">
						<td width="58"><input class="btn btn-primary" type="submit"
							value="删除" onclick="deleteConfirm()"></td>
						<td width="80">编号</td>
						<td width="80">日期</td>
						<td width="80">国家</td>
						<td width="80">组织</td>
						<td width="80">罪犯人数</td>
						<td width="80">伤亡人数</td>
						<td width="80">犯罪形式</td>
						<td width="80">社会影响</td>
						<td width="80">事件详情</td>
						<td width="80">罪犯详情</td>
						<td width="80">更新事件</td>

						<%
							List<Terrincident> list = result;

							int n = list.size();
							int m = 0;
							for (m = beginIndex - 1; m < total - 1; m++) {
								Terrincident t = list.get(m);
								int id = t.getId();
								String date = t.getTerr_date().toString();
								String country = t.getTerr_state();
								String organization = t.getTerr_organization();
								int numberOfTerr = t.getTerr_numberOfTerr();
								int numberOfCas = t.getTerr_numberOfCas();
								String crimeForm = t.getTerr_crimeForm();
								String influence = t.getTerr_influence();
						%>
					
					<tr align="center" height="30">
						<td width="58"><input type="checkbox" name="ck"
							value="<%=id%>"></td>
						<td width="80"><%=id%></td>
						<td class="edit" width="80"><%=date%></td>
						<td class="edit" width="80"><%=country%></td>
						<td class="edit" width="80"><%=organization%></td>
						<td class="edit" width="80"><%=numberOfTerr%></td>
						<td class="edit" width="80"><%=numberOfCas%></td>
						<td class="edit" width="80"><%=crimeForm%></td>
						<td class="edit" width="80"><%=influence%></td>
						<td><a class="btn btn-primary"
							href="showsubAll.jsp?id=<%=id%>">事件详情</a></td>
						<td><a class="btn btn-primary"
							href="showcrimAll.jsp?id=<%=id%>">罪犯详情</a></td>
						<td width="58"><input class="btn btn-primary" type="button"
							value="编辑"></td>

						<%
							}
						%>
					
				</table>
				<%
					if (pageNow != 1) {
						out.println(" <a  href=selectResult.jsp?pageNow=1" + "&terr_coun=" + tempvalue1 + "&terr_date1="
								+ tempvalue2 + "&terr_date2=" + tempvalue3 + "&state=" + type + ">首页</a> ");
						out.println(" <a   href=selectResult.jsp?pageNow=" + (pageNow - 1) + "&terr_coun=" + tempvalue1
								+ "&terr_date1=" + tempvalue2 + "&terr_date2=" + tempvalue3 + "&state=" + type + ">上一页</a> ");
					}
					if (pageNow != pageCount) {
						out.println(" <a   href=selectResult.jsp?pageNow=" + (pageNow + 1) + "&terr_coun=" + tempvalue1
								+ "&terr_date1=" + tempvalue2 + "&terr_date2=" + tempvalue3 + "&state=" + type + "> 下一页</a>");
						out.println(" <a   href=selectResult.jsp?pageNow=" + pageCount + "&terr_coun=" + tempvalue1
								+ "&terr_date1=" + tempvalue2 + "&terr_date2=" + tempvalue3 + "&state=" + type + "> 尾页</a>");
					}
					//显示当前页的前三页与后三页
					for (i = ((pageNow - 3) > 0 ? (pageNow - 3) : 1); i <= (pageCount < (pageNow + 3)
							? pageCount
							: (pageNow + 3)); i++) {
						out.println("<a href=selectResult.jsp?pageNow=" + i + "&terr_coun=" + tempvalue1 + "&terr_date1="
								+ tempvalue2 + "&terr_date2=" + tempvalue3 + "&state=" + type + ">[" + i + "]</a>");
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

		<script type="text/javascript" src="jquery-1.11.1.js"></script>
		<script type="text/javascript">
			function deleteConfirm() {
				if (confirm("确认要删除吗?")) {
					return true;
				}
				return false;
			}

			$(function() {
				$("input:button").click(
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
		</script>
	</div>
</body>
</html>


