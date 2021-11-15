<%@ page import="poly.util.CmmUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="poly.dto.OrderDTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: SeongGil
  Date: 2021-11-13
  Time: 오후 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String SS_BNS_ID = CmmUtil.nvl((String) session.getAttribute("SS_BNS_ID"));
    String SS_BNS_NAME = CmmUtil.nvl((String) session.getAttribute("SS_BNS_NAME"));
    String SS_BNS_SEQ = CmmUtil.nvl((String) session.getAttribute("SS_BNS_SEQ"));
    List<OrderDTO> rList = (List<OrderDTO>) request.getAttribute("rList");
    String msg = CmmUtil.nvl((String) request.getAttribute("msg"));

    if (rList == null) {
        rList = new ArrayList<OrderDTO>();
    }
%>
<html>
<head>
    <title>사업자 Main page</title>
    <div align="right" style="float: right">BNS_ID : <%=SS_BNS_ID%><br/>BNS_NAME : <%=SS_BNS_NAME%><br/>
    <a href="/business/bnsLogout.do">로그아웃</a>
    </div>
    <script type="text/javascript">
        function doOnload(){
            var bns_id = "<%=SS_BNS_ID%>";
            if (bns_id.toString().length < 1){
                alert("로그인된 사업자만 접근 가능합니다.");
                top.location.href="/index.do";
            }
        }

        function checkUpdate(status, seq){ // 상태가 세탁 완료 (3) 일 경우 상태 변경 금지
            if (status >= 3){
                alert("상태 변경 불가능");
            }else{
                location.href = "/order/updateStatus.do?order_seq=" + seq;
            }

        }

    </script>
</head>
<body onload="doOnload();">
<table border="1">
    <tr><td align="center" colspan="6">주문 목록</td></tr>
    <tr>
        <td colspan="5" align="center"><%=msg%></td><td colspan="1" align="center"><a href="/order/bnsSelectOrder.do">새로고침</a></td>
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
