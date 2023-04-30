<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import the taglib  spring form, we can use the spring form in jsp 我們要用Spring的form表單-->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/standard/taglibs-impl-2.0.0.jar" prefix="jstl"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/standard/taglibs-impl-2.0.0.jar" prefix="fmt"%>


<!-- 為了要有日期properly formatted，兩個jstl與fmt都要引入 -->


<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Message Page</title>
</head>
<body>
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<div class="container">
		<div class="row justify-content-center">
			<!-- 加了row justify-content-center之後，以下內容開始都置中對齊-->
			<div class="col-6">
				<!-- 	insert the bootstrap v5.2 cards-->
				<h1>Add Message Page</h1>
				<br />
				<div class="card">
					<div class="card-header">new message</div>

					<div class="card-body">
						<form:form class="form-control" modelAttribute="msg"
							method="post" action="${contextRoot}/message/postMessages">
							<!-- 為了這個textarea與modelAttribute綁定,我們需要讓Spring知道這個textarea是屬於Spring form的text area，我們需要加上prefix-->
							<!-- path是表示“textarea"綁定了"messages"的哪個屬性，這裡用'path'指定”text" -->
							<!-- 這個name是在幹嘛用的？ -->
							<form:textarea path="text" class="form-control" id="" cols="30"
								rows="10"></form:textarea>
							<!-- button type="submit" 應該被夾在form裏面 -->
							<button type="submit" class="btn btn-primary">Submit</button>
						</form:form>
					</div>
				</div>
				<br/>
				<div class="card">
					<div class="card-header">latest message time:<span> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE" value="${latest.added}"/> </span></div>
					<div class="card-body">
						${latest.text} 
					</div>
				</div>
				
			</div>
		</div>
		<!-- 	insert the bootstrap v5.2 cards-->
	</div>
</body>

</html>