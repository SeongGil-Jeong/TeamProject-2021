<%@ page import="poly.util.CmmUtil" %>
<%@ page import="poly.dto.OrderDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="poly.dto.ClothesDTO" %>
<%@ page import="poly.dto.BusinessDTO" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String SS_USER_ID = CmmUtil.nvl((String) session.getAttribute("SS_USER_ID"));
    String SS_USER_NAME = CmmUtil.nvl((String) session.getAttribute("SS_USER_NAME"));
    String SS_USER_SEQ = CmmUtil.nvl((String) session.getAttribute("SS_USER_SEQ")); // 주문 등 조회 시 사용

    // 주문 조회 시 사용
    List<OrderDTO> rList = (List<OrderDTO>) request.getAttribute("rList");
    String orderMsg = CmmUtil.nvl((String) request.getAttribute("orderMsg"));

    // 옷장 조회 시 사용
    List<ClothesDTO> clothesRList = (List<ClothesDTO>) request.getAttribute("clothesRList");

    // 주문 조회 시 세탁 업소 선택을 위해 사용
    List<BusinessDTO> businessList = (List<BusinessDTO>) request.getAttribute("businessList");

    if (rList == null) {
        rList = new ArrayList<OrderDTO>();
    }
%>

<% // 세탁중인 주문, 완료된 주문, 준비중인 주문 표시
    int cnt_st1 = 0;
    int cnt_st2 = 0;
    int cnt_st3 = 0;
    for (int i = 0; i < rList.size(); i++) {
        OrderDTO rDTO = rList.get(i);
        if (rDTO == null) {
            rDTO = new OrderDTO();
        }else {
            if (rDTO.getOrder_status().equals("2")) {
                cnt_st2 = cnt_st2 + 1;
            } else if (rDTO.getOrder_status().equals("3")) {
                cnt_st3 += 1;
            } else if (rDTO.getOrder_status().equals("1")) {
                cnt_st1 += 1;
            }
        }
    }
    int alerts_cnt = 0; // 알림이 있을 경우 알림 + 1; / 주문 확인 알림 +1
    if (cnt_st3 > 0) {
        alerts_cnt += 1;
    }
    // 주문 확인 시 OrderSEQ를 받아서 a,b,c 로 저장 후 split하여 반복해서 값 지우기
    String deleteOrderSEQ = "";
%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>메인페이지</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <script type="text/javascript">

        function doOnload() {
            var user_id = "<%=SS_USER_ID%>";
            if (user_id.toString().length < 1) {
                alert("로그인된 사용자만 접근 가능합니다.");
                top.location.href = "/index.do";
            }
        }
        // order 관련 함수
        var orderList = [];
        function setOrderClassName(order_seq) {
            if (orderList.includes(order_seq)) {
                var index = orderList.indexOf(order_seq);
                orderList.splice(index, 1);
                document.getElementById("orderCheck2" + order_seq).className = "btn btn-danger btn-circle btn-sm";
                document.getElementById('orderCheck'+order_seq).className = "fas fa-trash";
                //    이미 체크 했으면 원래 상태로 복구해주고 List에서 값 제거

            }else{
                orderList.push(order_seq);
                console.log(orderList);
                document.getElementById("orderCheck2" + order_seq).className = "btn btn-success btn-circle btn-sm";
                document.getElementById('orderCheck' + order_seq).className = "fas fa-check";
                //    체크 상태를 바꿔주고 List에 seq추가
            }
        }
        function clearOrderName(){ // cancel 클릭 시 orderList 삭제 후 return
            for(i = 0; i < orderList.length; i++){
                document.getElementById("orderCheck2" + orderList[i]).className = "btn btn-danger btn-circle btn-sm";
                document.getElementById("orderCheck" + orderList[i]).className = "fas fa-trash";
            }
            orderList = [];

        }
        function deleteOrder(){
            user_seq = '<%=SS_USER_SEQ%>';
            order_seqList = orderList.join(); // 문자열로 변경하여 넘겨주기

            top.location.href = "/order/deleteOrder.do?user_seq=" + user_seq + "&order_seqList=" + order_seqList;
        }

        // #insertOrder 모달창을 위한 함수

        var orderClothesList = [];
        function setInsertOrderClassName(clothes_seq, clothes_name) {
            if (orderClothesList.includes(clothes_name)) {
                console.log("orderClothesList : "+ orderClothesList);
                var index = orderClothesList.indexOf(clothes_name);
                orderClothesList.splice(index, 1);
                document.getElementById("insertOrderCheck2" + clothes_seq).className = "btn btn-danger btn-circle btn-sm";
                document.getElementById('insertOrderCheck'+clothes_seq).className = "fas fa-trash";
                //    이미 체크 했으면 원래 상태로 복구해주고 List에서 값 제거

            }else{
                orderClothesList.push(clothes_name);
                console.log("orderClothesList : "+ orderClothesList);
                document.getElementById("insertOrderCheck2" + clothes_seq).className = "btn btn-success btn-circle btn-sm";
                document.getElementById('insertOrderCheck' + clothes_seq).className = "fas fa-check";
                //    체크 상태를 바꿔주고 List에 seq추가
            }
        }
        function clearInsertOrderName(){ // cancel 클릭 시 orderClothesList 삭제 후 return
            for(i = 0; i < orderClothesList.length; i++){
                document.getElementById("insertOrderCheck2" + orderClothesList[i]).className = "btn btn-danger btn-circle btn-sm";
                document.getElementById("insertOrderCheck" + orderClothesList[i]).className = "fas fa-trash";
            }
            orderClothesList = [];

        }
        function insertOrder(){
            //세션에서 꺼낸 user_seq
            user_seq = '<%=SS_USER_SEQ%>';
            //정수형이므로 문자열로 변환
            clothes_cnt = orderClothesList.length+"";
            // 위의 함수를 통해 만든 옷 리스트를 문자열로 변환하여 전송 및 저장
            clothes_contents = orderClothesList.join();
            //주문 시작한 직후의 상태는 '준비중' 이므로 status에 1을 담은 채로 전송
            order_status = "1";

            //select태그로부터 선택된 option의 value값 가져오기 --> 선택된 업소의 seq값을 가져옴
            var target = document.getElementById("selectBNS");
            bns_seq = target.options[target.selectedIndex].value;

            //url을 통해 파라미터값과 함께 요청 --> 파라미터 값은 DTO에 들어가게 됌
            top.location.href = "/order/insertOrder.do?user_seq=" + user_seq + "&clothes_contents=" + clothes_contents
                +"&clothes_cnt="+ clothes_cnt+"&order_status="+ order_status+"&bns_seq="+bns_seq;
        }


        // clothes 관련 함수
        var clothesInfoList = []; // submit 전 옷 세탁 정보를 저장
        function setClothesInfo(clothesInfo){ // 옷 세탁 정보 변경
            if (clothesInfoList.includes(clothesInfo)) { // 값 제거

                var clothesIndex = clothesInfoList.indexOf(clothesInfo);
                clothesInfoList.splice(clothesIndex, 1);
                document.getElementById("clothes_info").value = clothesInfoList;

            }else{
                clothesInfoList.push(clothesInfo);
                document.getElementById("clothes_info").value = clothesInfoList;
            }
        }

        function clearClothesInfo() { //  등록된 옷 정보 초기화
            document.getElementById("clothes_info").value = "";
            clothesInfoList = [];
        }

        function insertClothes() { // 옷 추가 실행
            user_seq = '<%=SS_USER_SEQ%>';
            clothes_name = document.getElementById("clothes_name").value;
            clothes_type = document.getElementById("clothes_type").value;
            clothesInfo_list = clothesInfoList.join();
            top.location.href = "/clothes/insertClothes.do?user_seq=" + user_seq + "&clothes_name=" + clothes_name + "&clothes_type=" + clothes_type +
                "&clothesInfo_list=" + clothesInfo_list;
        }


    </script>
    <!-- 옷 리스트 테이블 css -->
    <style>
        *:before, *:after {
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        table {
            max-width: 2000px;
            margin: 50px ;
        }

        thead th {
            background: #0c3390;
            color: #fff;
            font-weight: initial;
        }

        tr {
            background: #f1f1f1;
        }

        tr:nth-child(2n) {
            background: #e0e0e0;
        }

        th, td {
            text-align: center;
            padding: 16px;
        }

        tfoot tr {
            background: none;
        }

    </style>

</head>

<body id="page-top" onload="doOnload();">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/user/userMain.do">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Washing for me</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="/user/userMain.do">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Main</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            About
        </div>

        <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link" href="/user/washingInfo.do">
                <i class="fas fa-fw fa-table"></i>
                <span>Washing INFO</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                             aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="Search for..." aria-label="Search"
                                           aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <!-- Nav Item - Alerts -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-bell fa-fw"></i>
                            <!-- Counter - Alerts -->
                            <%
                                if (alerts_cnt > 0){ // 만약 알림이 있을 경우 알림 있음 표시 출력


                            %>
                            <span class="badge badge-danger badge-counter"><%=alerts_cnt%></span>
                            <%
                                }
                            %>
                        </a>
                        <!-- Dropdown - Alerts title -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="alertsDropdown">
                            <h6 class="dropdown-header">
                                Alerts Center
                            </h6>
                            <%
                                if (cnt_st3 > 0){ // 만약 완료가 필요한 주문이 있다면
                            %>
                            <a class="dropdown-item d-flex align-items-center" data-toggle="modal" data-target="#deleteOrder">
                                <div class="mr-3">
                                    <div class="icon-circle bg-primary">
                                        <i class="fas fa-file-alt text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <%--                                    <div class="small text-gray-500">December 12, 2019</div>  알림 시간--%>
                                    <span class="font-weight-bold">주문을 완료해 주세요!</span>
                                </div>
                            </a>
                            <%
                                }
                            %>
                            <%--                            모든 알람 보기--%>
                            <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                        </div>
                    </li>

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=SS_USER_NAME%> 님</span>
                            <img class="img-profile rounded-circle"
                                 src="/resources/img/undraw_profile.svg">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Profile
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                Settings
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Activity Log
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">OrderDashboard</h1>
                </div>

                <!-- Content Row -->
                <div class="row">

                    <!-- Earnings (Monthly) Card Example-->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-danger shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-danger text-danger mb-1">
                                            준비중인 주문</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=cnt_st1%></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            세탁중인 주문</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=cnt_st2%></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            완료된 주문</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=cnt_st3%></div>
                                    </div>
                                    <%
                                        if(cnt_st3 > 0){ // 완료된 주문이 있다면
                                    %>
                                    <%--                                    <a href="#" data-toggle="modal" data-tartget="#deleteOrder" class="btn btn-success btn-circle"><i class="fas fa-check"></i></a>--%>
                                    <a class="btn btn-success btn-circle" href="#" data-toggle="modal" data-target="#deleteOrder"><i class="fas fa-check"></i></a>

                                    <%
                                    }else{
                                    %>
                                    <div class="col-auto"><i class="fas fa-clipboard-list fa-2x text-gray-300"></i></div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--완료된 주문 지우기 modal-->
                <div class="modal fade" id="deleteOrder" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">완료된 주문을 선택해 주세요</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close" onclick="clearOrderName()">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <% for (int i = 0; i < rList.size(); i++) {
                                    OrderDTO rDTO = rList.get(i);
                                    if (rDTO.getOrder_status().equals("3")) {


                                %>
                                <div>
                                    주문번호 : <%=rDTO.getOrder_seq()%>
                                    <a onclick="setOrderClassName('<%=rDTO.getOrder_seq()%>');" class="btn btn-danger btn-circle btn-sm" style="float: right"
                                       id="orderCheck2<%=rDTO.getOrder_seq()%>">
                                        <i class="fas fa-trash" id="orderCheck<%=rDTO.getOrder_seq()%>">
                                        </i></a>
                                </div>
                                <hr>
                                <%
                                        }
                                    }
                                %>
                                ※ 확정 시 취소하실 수 없습니다.
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal" onclick="clearOrderName()">Cancel</button>
                                <a class="btn btn-primary" onclick="deleteOrder();">확정</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Content Row -->

                <div class="row">
                    <!-- 옷 정보 리스트-->
                    <!-- Area Chart -->
                    <div class="col-xl-6 col-lg-5">
                        <div class="card shadow mb-4">
                            <!-- Card Header -->
                            <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">나의 옷장</h6>
                                <a class="m-0 font-weight-bold text-primary" href="#"
                                   data-toggle="modal" data-target="#insertClothes">옷 추가</a>
                            </div>
                            <!-- Card Body -->
                            <div style="overflow: scroll; padding: 0px; height:500px;">
                                <% if(clothesRList.size() == 0){%>
                                <div>옷이 없습니다.</div>
                                <%}%>
                                <table style="align: center; width: 720px;">
                                    <thead>
                                    <tr>
                                        <th>유형</th>
                                        <th>번호</th>
                                        <th>이름</th>
                                        <th>정보</th>
                                        <th>삭제</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%for(ClothesDTO e : clothesRList)  {
                                        String seq = e.getClothes_seq();
                                        String type = e.getClothes_type();
                                    %>
                                    <tr>
                                        <td><img src="/resources/img/clothesImage/<%=type%>.png" alt="<%=type%>"/></td>
                                        <td><%=seq %></td>
                                        <td><%=e.getClothes_name() %></td>
                                        <td><%=e.getClothes_info() %></td>
                                        <td><a class="btn btn-danger btn-circle" href="/clothes/deleteClothes.do?clothes_seq=<%=seq%>">
                                            <i class="fas fa-trash"></i></a></td>
                                    </tr>
                                    <%} %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer" style="text-align: center;">
                                <a class="m-0 font-weight-bold text-primary" href="#"
                                   data-toggle="modal" data-target="#insertOrder">옷 세탁하기</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-6 col-lg-5">

                        <!-- Project Card Example -->
                        <div class="card shadow mb-4">
                            <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">진행 상황</h6>
                            </div>
                            <div class="card-body">
                                <% for (int i = 0; i < rList.size(); i++) {
                                    OrderDTO rDTO = rList.get(i);
                                    String status = "";
                                    String status_name = "";
                                    String status_color = "";
                                    if (rDTO == null) {
                                        rDTO = new OrderDTO();
                                    }else if (rDTO.getOrder_status().equals("1")) {
                                        status = "20";
                                        status_name = "준비중";
                                        status_color = "progress-bar bg-danger";
                                    } else if (rDTO.getOrder_status().equals("2")) {
                                        status = "60";
                                        status_name = "세탁중";
                                        status_color = "progress-bar";
                                    } else if (rDTO.getOrder_status().equals("3")) { // 완료된 주문은 표시하지 않음 / tables에서만 표시
                                        status = "100";
                                        status_name = "세탁 완료";
                                        status_color = "progress-bar bg-success";
                                    } else {
                                        status = "0";
                                    }
                                %>
                                <h4 class="small font-weight-bold">
                                    ORDER_NUMBER :
                                    <%=rDTO.getOrder_seq()%><span class="float-right"><%=status_name%>
											<%=status%>%</span>
                                </h4>
                                <div class="progress mb-4">
                                    <div class="<%=status_color%>" role="progressbar"
                                         style="width: <%=status%>%" aria-valuenow="<%=status%>"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>



                        <!-- 옷 등록 modal -->
                        <div class="modal fade" id="insertClothes" tabindex="-1"
                             role="dialog" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" style="width: 700px;">
                                    <div class="modal-header">
                                        <h5 class="modal-title">옷 추가하기</h5>
                                        <button class="close" type="button" data-dismiss="modal"
                                                aria-label="Close" onclick="clearClothesInfo()">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div>
                                            <input type="text" name="clothes_name" id="clothes_name"
                                                   placeholder="옷 이름" style="width: 100%;">
                                        </div>
                                        <hr />
                                        <div>
                                            <select name="clothes_type" id="clothes_type" style="width: 100%;">
                                                <option value="none">=== 유형 선택 ===</option>
                                                <option value="shortshirts">반팔티셔츠</option>
                                                <option value="longshirts">긴팔티셔츠</option>
                                                <option value="shortpants">반바지</option>
                                                <option value="longpants">긴바지</option>
                                                <option value="skirt">치마</option>
                                                <option value="dress">원피스</option>
                                            </select>
                                        </div>
                                        <hr />
                                        <p>옷 정보</p>
                                        <div>
                                            <input type="image" src="/resources/img/da1.jpg" onclick="setClothesInfo('다림질금지')" style="width: 100px;">
                                            <input type="image" src="/resources/img/da2.jpg" onclick="setClothesInfo('다림질80-120')" style="width: 100px;">
                                            <input type="image" src="/resources/img/da3.jpg" onclick="setClothesInfo('다림질140-160')" style="width: 100px;">
                                            <input type="image" src="/resources/img/da4.jpg" onclick="setClothesInfo('다림질180-210')" style="width: 100px;">
                                            <input type="image" src="/resources/img/dry1.jpg" onclick="setClothesInfo('드라이크리닝금지')" style="width: 100px;">
                                            <input type="image" src="/resources/img/mul1.jpg" onclick="setClothesInfo('물세탁금지')" style="width: 100px;">
                                            <input type="image" src="/resources/img/mul2.jpg" onclick="setClothesInfo('손세탁30')" style="width: 100px;">
                                            <input type="image" src="/resources/img/mul3.jpg" onclick="setClothesInfo('세탁기30')" style="width: 100px;">
                                            <input type="image" src="/resources/img/mul4.jpg" onclick="setClothesInfo('손세탁세탁기40')" style="width: 100px;">
                                            <input type="image" src="/resources/img/mul5.jpg" onclick="setClothesInfo('손세탁세탁기60')" style="width: 100px;">
                                            <input type="image" src="/resources/img/mul6.jpg" onclick="setClothesInfo('손세탁세탁기40삶을수있음')" style="width: 100px;">
                                            <input type="image" src="/resources/img/pyo1.jpg" onclick="setClothesInfo('산소계염소계표백제금지')" style="width: 100px;">
                                            <input type="image" src="/resources/img/pyo2.jpg" onclick="setClothesInfo('산소계염소계표백제사용가능')" style="width: 100px;">
                                            <input type="image" src="/resources/img/pyo3.jpg" onclick="setClothesInfo('산소계표백제금지')" style="width: 100px;">
                                            <input type="image" src="/resources/img/pyo4.jpg" onclick="setClothesInfo('염소계표백제금지')" style="width: 100px;">
                                            <input type="image" src="/resources/img/pyo6.jpg" onclick="setClothesInfo('염소계표백제사용가능')" style="width: 100px;">
                                        </div>
                                        <div>
                                            <input type="text" name="clothes_info" id="clothes_info"
                                                   style="width: 100%">
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-secondary" type="button"
                                                data-dismiss="modal" onclick="clearClothesInfo()">Cancel</button>
                                        <input type="button" class="btn btn-primary"
                                               onclick="insertClothes()" value="등록하기">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 주문 등록 모달창 -->
                        <div class="modal fade" id="insertOrder" tabindex="-1"
                             role="dialog" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">주문 맡길 옷들을 선택해 주세요</h5>
                                        <button class="close" type="button" data-dismiss="modal"
                                                aria-label="Close" onclick="clearInsertOrderName()">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <%
                                            for (ClothesDTO e : clothesRList) {
                                                String clothes_seq = e.getClothes_seq();
                                                String clothes_name = e.getClothes_name();
                                        %>
                                        <div>
                                            옷 정보
                                            <%=clothes_seq%>
                                            :
                                            <%=clothes_name%>
                                            <a
                                                    onclick="setInsertOrderClassName('<%=clothes_seq%>', '<%=clothes_name%>');"
                                                    class="btn btn-danger btn-circle btn-sm"
                                                    style="float: right" id="insertOrderCheck2<%=clothes_seq%>">
                                                <i class="fas fa-trash"
                                                   id="insertOrderCheck<%=clothes_seq%>"> </i>
                                            </a>
                                        </div>
                                        <hr>
                                        <%

                                            }
                                        %>
                                        희망 세탁 업소 선택 : <select id="selectBNS">
                                        <% for(BusinessDTO e : businessList) {
                                            String bns_seq = e.getBns_seq();
                                            String bns_name = e.getBns_name(); %>

                                        <option value="<%=bns_seq%>">
                                            <%="#"+bns_seq+" : "+bns_name %>
                                        </option>

                                        <% }%>

                                    </select> <br /> ※ 확정 시 취소하실 수 없습니다.
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-secondary" type="button"
                                                data-dismiss="modal" onclick="clearInsertOrderName()">Cancel</button>
                                        <a class="btn btn-primary" onclick="insertOrder();">주문 확정</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; TeamProject 2021</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="/business/bnsLogout.do">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/resources/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/js/demo/chart-area-demo.js"></script>
<script src="/resources/js/demo/chart-pie-demo.js"></script>

</body>

</html>