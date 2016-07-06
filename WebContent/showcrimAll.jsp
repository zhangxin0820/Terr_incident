<%@ page import="com.zx.db.DBConn"%>
<%@ page import="com.zx.dao.TerrcriminalDao"%>
<%@ page import="com.zx.model.Terrcriminal"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<style>
.body-main {
	background: url(image/bkground.png) repeat-x;
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

<title>罪犯资料</title>

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
			//删除操作
			String deleteName[];
			if (request.getParameter("sub_ck") != null) {
				deleteName = request.getParameterValues("sub_ck");
				int[] deleteId = new int[deleteName.length];

				TerrcriminalDao.delTerrcriminal(deleteName);
			}
		%>
		<%
			//显示操作
			int temp_crim_id = Integer.parseInt(request.getParameter("id").trim());
			List<Terrcriminal> resultInfor = TerrcriminalDao.getcrimAll(temp_crim_id);
			int rowCount = resultInfor.size();//总行数
			int i = 1;
			int pageSize = 10;
			int pageNow = 1;

			//默认显示第一页 
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

					Terrcriminal tempInfo = resultInfor.get(j);

					int terr_id = tempInfo.getTerr_id();
					int event_id = tempInfo.getEvent_id();
					String name = tempInfo.getTerr_name();
					String gender = tempInfo.getTerr_gender();
					String birthday = tempInfo.getTerr_birthday().toString();
					String job = tempInfo.getTerr_job();

					int tempj = j;
		%>


		<%
			}
			}
		%>

		<div class="containt-fluid" align="center">
			<form Action="" method="post">



				<input class="btn btn-primary add-btn pull-right" type="button"
					onclick="window.location.href='addcrim.jsp'" value="增加新罪犯" /> <input
					class="btn btn-primary add-btn pull-right" type="button"
					onclick="window.location.href='showAllInfo.jsp'" value="返回主页面" />
				<table class="containt-fluid table table-striped" width="100%"
					border="0" align="center" cellpadding="0" cellspacing="0">
					<tr align="center" height="30"
						style="border: 2px solid; text-align: center; vertical-align: middle; font-size: 18px; font-weight: bold;">
						<td width="58"><input class="btn btn-primary" type="submit"
							value="删除" onclick="deleteConfirm()"></td>
						<td width="80">子编号</td>
						<td width="80" style="display: none;">索引编号</td>
						<td width="80">姓名</td>
						<td width="80">性别</td>
						<td width="80">生日</td>
						<td width="80">工作</td>
						<td width="80">更新人物</td>

						<%
							List<Terrcriminal> list = TerrcriminalDao.getcrimAll(temp_crim_id);

							int n = list.size();
							if (!list.isEmpty()) {
								for (int k = beginIndex - 1; k < total - 1; k++) {
									Terrcriminal t = list.get(k);

									int terr_id = t.getTerr_id();
									int event_id = t.getEvent_id();
									String name = t.getTerr_name();
									String gender = t.getTerr_gender();
									String birthday = t.getTerr_birthday().toString();
									String job = t.getTerr_job();
						%>
					
					<tr align="center" height="30">
						<td width="58"><input type="checkbox" name="crim_ck"
							value=<%=terr_id%>></td>
						<td width="80"><%=terr_id%></td>
						<td width="80" style="display: none;"><%=event_id%></td>
						<td class="edit" width="80"><%=name%></td>
						<td class="edit" width="80"><%=gender%></td>
						<td class="edit" width="80"><%=birthday%></td>
						<td class="edit" width="80"><%=job%></td>
						<td width="58"><input class="btn btn-primary" type="button"
							value="编辑"></td>


						<%
							}
							}
						%>
					
				</table>
				<%
					if (pageCount != 0) {
						if (pageNow != 1) {
							out.println(" <a  href=showcrimAll.jsp?pageNow=1>" + "&id=" + temp_crim_id + "首页</a> ");
							out.println(" <a   href=showcrimAll.jsp?pageNow=" + (pageNow - 1) + "> 上一页</a> ");
						}
						if (pageNow != pageCount) {
							out.println(" <a   href=showcrimAll.jsp?pageNow=" + (pageNow + 1) + "&id=" + temp_crim_id
									+ "> 下一页</a>");
							out.println(" <a   href=showcrimAll.jsp?pageNow=" + pageCount + "&id=" + temp_crim_id + "> 尾页</a>");
						}
						//显示当前页的前三页与后三页
						for (i = ((pageNow - 3) > 0 ? (pageNow - 3) : 1); i <= (pageCount < (pageNow + 3)
								? pageCount
								: (pageNow + 3)); i++) {
							out.println("<a href=showcrimAll.jsp?pageNow=" + i + "&id=" + temp_crim_id + ">[" + i + "]</a>");
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
							//$.post("updateterri.java",{{edit:$(".edit").val()}})
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
									//alert(obj_text.val());
									data.push(obj_text.val());
								});
								var terr_id = tr.children().eq(1).text();
								$.post("updateterri_crim", {
									"terr_id" : terr_id,
									"terr_name" : data[0],
									"terr_gender" : data[1],
									"terr_birthday" : data[2],
									"terr_job" : data[3],
								}, function callback(result) {
									alert(result.status);
								}, "json");
							}
							;
						});
			});
			/* function jump() {
				if (window.event.keyCode == 13) {
					var pages = document.getElementById("pages").value;//得到id为pages输入框的值
					var total = document.getElementById("total").value;//得到总页数

					if (pages > 0 && pages <= total && parseInt(pages) == pages) {
						window.location.href = "showcrimAll.jsp?pageNow=" + pages;
						return false;
					} else {
						alert("您输入的页码有误！");
						return false;
					}
					return true;
				}

			} */
		</script>
	</div>
</body>
</html>