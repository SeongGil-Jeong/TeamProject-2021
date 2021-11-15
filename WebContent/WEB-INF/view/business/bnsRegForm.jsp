<%--
  Created by IntelliJ IDEA.
  User: data04
  Date: 2021-11-12
  Time: 오후 5:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>사업자 회원가입</title>
</head>
<body>
<form action="/business/insertBusiness.do">
    id : <input type="text" name="bns_id"><br />
    password : <input type="password" name="bns_password"><br />
    Name : <input type="text" name="bns_name"><br />
    사업자 번호 : <input type="text" name="bns_code"><br />
    주소 : <input type="text" name="bns_addr"><br />
    주소2 : <input type="text" name="bns_addr2"><br />
    <input type="submit" value="회원가입">

</form>
</body>
</html>
