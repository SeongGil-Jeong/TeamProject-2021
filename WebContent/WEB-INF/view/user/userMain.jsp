<%@ page import="poly.util.CmmUtil" %>
<%@ page import="poly.dto.OrderDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: SeongGil
  Date: 2021-11-14
  Time: 오후 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String SS_USER_ID = CmmUtil.nvl((String) session.getAttribute("SS_USER_ID"));
    String SS_USER_NAME = CmmUtil.nvl((String) session.getAttribute("SS_USER_NAME"));
    String SS_USER_SEQ = CmmUtil.nvl((String) session.getAttribute("SS_USER_SEQ")); // 주문 등 조회 시 사용
    List<OrderDTO> rList = (List<OrderDTO>) request.getAttribute("rList");
    String msg = CmmUtil.nvl((String) request.getAttribute("msg"));

    if (rList == null) {
        rList = new ArrayList<OrderDTO>();
    }
%>
<html>
<head>
    <title>유저 Main 화면</title>
    <div align="right" style="float: right">USER_ID : <%=SS_USER_ID%><br/>USER_NAME : <%=SS_USER_NAME%><br/>
<%--        <a href="/business/bnsLogout.do">로그아웃</a>--%>
    </div>
    <script type="text/javascript">
        function doOnload(){
            var user_id = "<%=SS_USER_ID%>";
            if (user_id.toString().length < 1){
                alert("로그인된 사용자만 접근 가능합니다.");
                top.location.href="/index.do";
            }
        }
        // 주문 삭제 함수 추가 (세탁 완료 시 주문 삭제)
    </script>
</head>
USER_ID : <%=SS_USER_ID%><br/>
USER_NAME : <%=SS_USER_NAME%>
<body>
<table border="1">
    <tr><td align="center" colspan="6">주문 목록</td></tr>
    <tr>
        <td colspan="5" align="center"><%=msg%></td><td colspan="1" align="center"><a href="/order/userSelectOrder.do">새로고침</a></td>
    </tr>
    <tr>
        <td>ORDER_SEQ</td>
        <td>CLOTHES_CNT</td>
        <td>CLOTHES_CONTENTS</td>
        <td>ORDER_STATUS</td>
        <td>ORDER_DT</td>
        <td></td>
    </tr>
    <%
        for (int i = 0; i < rList.size(); i++) { // 주문 상태 int 문자열로 바꾸기
            OrderDTO rDTO = rList.get(i);
            String status = "";
            if (rDTO == null) {
                rDTO = new OrderDTO();
            } else if(rDTO.getOrder_status().equals("1")){
                status = "준비중";
            }else if(rDTO.getOrder_status().equals("2")){
                status = "세탁중";
            } else if (rDTO.getOrder_status().equals("3")) {
                status = "세탁완료";
            }
    %>
    <tr>
        <td align="center"><%=rDTO.getOrder_seq()%></td>
        <td align="center"><%=rDTO.getClothes_cnt()%></td>
        <td align="center"><%=rDTO.getClothes_contents()%></td>
        <td align="center"><%=status%></td>
        <td align="center"><%=rDTO.getOrder_dt().substring(0, 10)%></td>
        <td align="center"><a href="javascript:checkUpdate('<%=rDTO.getOrder_status()%>','<%=rDTO.getOrder_seq()%>')">상태변경</a></td>
    </tr>
    <%
        }
    %>

</table>

</body>
</html>
