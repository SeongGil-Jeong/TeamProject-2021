<%@ page import="java.util.List" %>
<%@ page import="poly.dto.BusinessDTO" %>
<%@ page import="poly.util.CmmUtil" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: SeongGil
  Date: 2021-11-14
  Time: 오후 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<BusinessDTO> rList = (List<BusinessDTO>) request.getAttribute("rList");

    // 사업자 조회 결과 보여주기
    if (rList == null) {
        rList = new ArrayList<BusinessDTO>();
    }
%>
<html>
<head>
    <title>유저 회원가입 화면</title>
    <script type="text/javascript">
        //회원가입 정보의 유효성 체크하기
        function doRegUserCheck(f){
            if(f.user_id.value==""){
                alert("아이디를 입력하세요");
                f.user_id.focus();
                return false;
            }if(f.user_name.value==""){
                alert("이름를 입력하세요");
                f.user_name.focus();
                return false;
            }if(f.user_nic.value==""){
                alert("닉네임를 입력하세요");
                f.user_nic.focus();
                return false;
            }if(f.user_password.value==""){
                alert("비밀번호를 입력하세요");
                f.user_password.focus();
                return false;
            }if(f.user_password2.value==""){
                alert("비밀번호확인를 입력하세요");
                f.password2.focus();
                return false;
            }if(f.email.value==""){
                alert("이메일을 입력하세요");
                f.email.focus();
                return false;
            }if(f.user_addr.value==""){
                alert("주소를 입력하세요");
                f.user_addr1.focus();
                return false;
            }if(f.user_addr2.value==""){
                alert("상세주소를 입력하세요");
                f.user_addr2.focus();
                return false;
            }
        }
    </script>
</head>
<body>
<form name="f" method="post" action="/user/insertUser.do" onsubmit="return doRegUserCheck(this);">
    <table border="1">
        <col width="150px">
        <col width="150px">
        <col width="150px">
        <col width="150px">
        <tr>
            <td>아이디</td>
            <td><input type="text" name="user_id" style="width:150px"/></td>
            <td>이름</td>
            <td><input type="text" name="user_name" style="width:150px"/></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="user_password" style="width:150px"/></td>
            <td>비밀번호 확인</td>
            <td><input type="password" name="user_password2" style="width:150px"/></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td colspan="3"><input type="text" name="email" style="width:450px"/></td>
        </tr>
        <tr>
            <td>NIC</td>
            <td><input type="text" name="user_nic"></td>
            <td>선호하는 지점</td>
            <td>
                <select name="like_branch">
                    <option value="">선택 없음</option>
                    <%
                        for (int i = 0; i < rList.size(); i++) {
                            BusinessDTO rDTO = rList.get(i);

                            if (rDTO == null) {
                                rDTO = new BusinessDTO();
                            }
                    %>
                    <option value="<%=rDTO.getBns_name()%>"><%=rDTO.getBns_name()%></option>
                    <% } %>
                </select>
            </td>
        </tr>
        <tr>
            <td>주소</td>
            <td colspan="3"><input type="text" name="user_addr" style="width:450px"/></td>
        </tr>
        <tr>
            <td>상세주소</td>
            <td colspan="3"><input type="text" name="user_addr2" style="width:450px"/></td>
        </tr>
    </table>
    <input type="submit" value="회원가입" />
</form>

</body>
</html>
