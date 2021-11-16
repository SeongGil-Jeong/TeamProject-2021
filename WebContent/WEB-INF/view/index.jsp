<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil" %>
<% String msg = CmmUtil.nvl((String)request.getAttribute("msg")); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table, th, td{
		border : 1px solid black;
	}
</style>
</head>
<body>
<form name="f" method="post" action="/user/userLogin.do" onsubmit="return doLoginUserCheck(this);">
    <table border="1">
        <col width="150px">
        <col width="150px">
        <col width="150px">
        <col width="150px">
        <tr>
            <td>아이디</td>
            <td><input type="text" name="user_id" style="width:150px"/></td>
            <td>비밀번호</td>
            <td><input type="password" name="user_password" style="width:150px"/></td>
        </tr>
    </table>
    <input type="submit" value="로그인" />
</form>
<a href="/user/userRegForm.do">회원가입</a>
<a href="/business/bnsLoginForm.do">사업자로 로그인하기</a>
</body>
</html>