<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import the taglib  spring form, we can use the spring form in jsp 我們要用Spring的form表單-->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/standard/taglibs-impl-2.0.0.jar" prefix="jstl"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/standard/taglibs-impl-2.0.0.jar" prefix="fmt"%>



<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!-- 很重要所以寫三行 -->
<!-- 這是Spring FORM表單 -->
<!-- 這是Spring FORM表單 -->
<!-- 這是Spring FORM表單 -->
<!-- 不是原生form表單 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Message Page</title>
</head>
<body>
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<div class="container">
		<div class="row justify-content-center">
			<!-- 加了row justify-content-center之後，以下內容開始都置中對齊-->
			<div class="col-6">
				<!-- 	insert the bootstrap v5.2 cards-->
				<h1>Edit Message</h1>
				<div class="card">
					<div class="card-header">new message</div>
					<div class="card-body">
					<!-- 我們現在在用Spring form表單，所以method可以用put -->
					<!-- 不然原生的HTTP Request的FORM表單是不行直接用method=“put" -->
						<form:form class="form-control" modelAttribute="messages"
							method="put" action="${contextRoot}/message/editMessages">
							<!-- 為了這個textarea與modelAttribute綁定,我們需要讓Spring知道這個textarea是屬於Spring form的text area，我們需要加上prefix-->
							<!-- path是表示“textarea"綁定了"messages"的哪個屬性，這裡用'path'指定”text" -->
							<!-- 這個name是在幹嘛用的？ -->
							<form:input path="id" type="hidden"/>
							
							
							<form:textarea path="text" class="form-control" id="" cols="30"
								rows="10"></form:textarea>
							<!-- button type="submit" 應該被夾在form裏面 -->
							<button type="submit" class="btn btn-primary">Submit</button>
						</form:form>
					</div>
				</div>
				<br />
			</div>
		</div>
	</div>
</body>
</html>