<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core_rt" prefix="jstl" %>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="${contextRoot}/">Stasy's Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="${contextRoot}/">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${contextRoot}/message/addMessages">Add Messages</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${contextRoot}/message/showMessages">Show Messages</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${contextRoot}/message/ajaxMessages">AJAX</a>
        </li>

      </ul>
    </div>
  </div>
</nav>
</body>
</html>