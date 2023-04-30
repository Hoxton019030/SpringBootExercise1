<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/standard/taglibs-impl-2.0.0.jar" prefix="jstl"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/standard/taglibs-impl-2.0.0.jar" prefix="fmt"%>

<!-- import the taglib  spring form, we can use the spring form in jsp 我們要用Spring的form表單-->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Message Page</title>
</head>
<body>
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<div class="container">
		<div class="row justify-content-center">
			<!-- 加了row justify-content-center之後，以下內容開始都置中對齊-->
			<div class="col-6">
				<h1>Show Message Page</h1>
				<jstl:forEach var="msg" items="${page.content}">
					<div class="card">
						<div class="card-header">
							message posted time:<span> <fmt:formatDate
									pattern="yyyy-MM-dd HH:mm:ss EEEE" value="${msg.date}" />
							</span>
						</div>
						<div class="card-body">
							${msg.text} <br/>
							<div style="display: flex">
								<!-- Baby Girl，你不是直接去action後面接的這個地方editMessages噢，這是submit form 之後去的地方唷。
							你想看這個頁面的話，是要去這個頁面的網址，也就是showMessages -->

								<!-- 這是在主頁面上出現edit編輯功能的按鈕 -->

								<!-- 這個form是用原生的HTML form表單，不是Spring form表單，所以不能直接寫method="delete" -->

								<!-- 這個form的method是什麼？ If the method attribute is not specified, the default method is "GET".-->
								<form action="${contextRoot}/message/editMessages">
									<input type="hidden" name="id" value="${msg.id}" /> 
									<input
										type="submit" class="btn btn-outline-info btn-sm" name="id"
										value="edit" />
								</form>

								<!-- 這是在主頁面上出現delete刪除功能的按鈕 -->
								<!-- 							這個name="_method"的filter功能在application.properties檔案中的spring.mvc.hiddenmethod.filter.enabled=true
 -->
								<form action="${contextRoot}/message/deleteMessages"
									method="post">
									<input type="hidden" name="id" value="${msg.id}" /> 
									<input
										type="hidden" name="_method" value="delete" /> 
									<input
										type="submit" class="btn btn-outline-danger btn-sm" name="id"
										value="delete" />
								</form>
							</div>

						</div>
					</div>
				</jstl:forEach>
				<br />

				<!-- 把每一頁都做一次條件判斷 -->
				<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
					<%-- <jstl:choose>裏面就是Java的switch --%>
					<jstl:choose>
						<jstl:when test="${page.number != pageNumber-1}">
							<!-- 這是從getNumber()得來的 ＝＝>page.number -->
							<!-- Page物件的getNumber從0開始，但是totalPages從1開始，所以可以選page.number+1 != pageNumber，或者page.number != pageNumber-1 -->
							<a href="${contextRoot}/message/showMessages?page=${pageNumber}">${pageNumber}</a>
						</jstl:when>
						<jstl:otherwise>
							${page.number+1} 
						</jstl:otherwise>
					</jstl:choose>
					<!-- 連結的頁與頁之間的一槓一槓 -->
					<!-- 判斷是否是最後一頁，如果是的話，就不要加一槓 -->
					<jstl:if test="${pageNumber!=page.totalPages}">
					|
					</jstl:if>
					<%-- <jstl:choose>裏面就是把Java的switch --%>
				</jstl:forEach>
			</div>
		</div>
	</div>
</body>
</html>