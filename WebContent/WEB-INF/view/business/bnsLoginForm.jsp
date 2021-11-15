<%--
  Created by IntelliJ IDEA.
  User: data04
  Date: 2021-11-12
  Time: 오후 5:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>사업자 로그인</title>
</head>
<body>
<form action="/business/businessLogin.do">
    id : <input type="text" name="bns_id">
    password : <input type="password" name="bns_password">
    <input type="submit" value="로그인">
</form>
<a href="/business/bnsRegForm.do">회원가입 화면 이동</a>
</body>
</html>
