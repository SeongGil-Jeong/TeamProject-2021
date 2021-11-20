<%@ page import="java.util.List"%>
<%@ page import="poly.dto.BusinessDTO"%>
<%@ page import="java.util.ArrayList"%><%--
  Created by IntelliJ IDEA.
  User: SeongGil
  Date: 2021-11-14
  Time: 오후 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    List<BusinessDTO> rList = (List<BusinessDTO>) request.getAttribute("rList");

// 사업자 조회 결과 보여주기
    if (rList == null) {
        rList = new ArrayList<BusinessDTO>();
    }
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">


    <title>유저 회원가입 화면</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
          type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <script type="text/javascript">
        //회원가입 정보의 유효성 체크하기
        function doRegUserCheck(f) {
            if (f.user_id.value == "") {
                alert("아이디를 입력하세요");
                return false;
            }
            if (f.user_name.value == "") {
                alert("이름를 입력하세요");
                return false;
            }
            if (f.user_nic.value == "") {
                alert("닉네임를 입력하세요");
                return false;
            }
            if (f.user_password.value == "") {
                alert("비밀번호를 입력하세요");
                return false;
            }
            if (f.user_password2.value == "") {
                alert("비밀번호확인를 입력하세요");
                return false;
            }
            if (f.email.value == "") {
                alert("이메일을 입력하세요");
                return false;
            }
            if (f.user_addr.value == "") {
                alert("주소를 입력하세요");
                return false;
            }
            if (f.user_addr2.value == "") {
                alert("상세주소를 입력하세요");
                return false;
            }if (f.user_password.value != f.user_password2.value) {
                alert("비밀번호가 일치하지 않습니다");
                return false;
            }

        }
    </script>

</head>

<body class="bg-gradient-primary">

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Create User Account!</h1>
                        </div>
                        <form class="user" action="/user/insertUser.do" method="post"
                              onsubmit="return doRegUserCheck(this);">
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user"
                                           placeholder="User ID" name="user_id">
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control form-control-user"
                                           placeholder="User Name" name="user_name">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user"
                                       placeholder="Email Address" name="email">
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="password" class="form-control form-control-user"
                                           placeholder="Password"
                                           name="user_password">
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control form-control-user"
                                           placeholder="Repeat Password"
                                           name="user_password2">
                                </div>
                            </div>
                            <div class="form-group">
                                    <input type="text" name="user_nic"
                                           class="form-control form-control-user" placeholder="User NIC"
                                    >
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user"
                                           placeholder="User Address" name="user_addr">
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control form-control-user"
                                           placeholder="User Address2" name="user_addr2">
                                </div>
                            </div>
                            <a class="btn btn-primary btn-user btn-block" href="#" data-toggle="modal" data-target="#selectModal">Register Account</a>

                            <!--Modal-->
                            <div class="modal fade" id="selectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">선호하는 지점을 골라주세요 (선택)</h5>
                                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                        <%
                                            for (int i = 0; i < rList.size(); i++) {
                                                BusinessDTO rDTO = rList.get(i);

                                                if (rDTO == null) {
                                                    rDTO = new BusinessDTO();
                                                }
                                        %>
                                            <input type="submit" name="like_branch" value="<%=rDTO.getBns_name()%>" class="btn btn-primary btn-user btn-block">
                                        <%
                                            }
                                        %>
                                        <input type="submit" name="like_branch" value="선택없음" class="btn btn-primary btn-user btn-block">
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <hr>

                        <!--Modal-->
                        <div class="text-center">
                            <a class="small" href="/index.do">Already have an account?
                                Login!</a>
                        </div>
                    </div>
                </div>
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

</body>

</html>