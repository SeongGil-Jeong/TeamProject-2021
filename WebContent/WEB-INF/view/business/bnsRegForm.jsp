<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Register</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <script type="text/javascript">
        //회원가입 정보의 유효성 체크하기
        function doRegUserCheck(f){
            if(f.bns_id.value==""){
                alert("아이디를 입력하세요");
                f.bns_id.focus();
                return false;
            }if(f.bns_name.value==""){
                alert("세탁소 이름을 입력하세요");
                f.bns_name.focus();
                return false;
            }if(f.bns_code.value==""){
                alert("사업자번호를 입력하세요");
                f.bns_code.focus();
                return false;
            }if(f.bns_addr.value==""){
                alert("주소를 입력하세요");
                f.bns_addr.focus();
                return false;
            }if(f.bns_password.value==""){
                alert("비밀번호를 입력하세요");
                f.bns_password.focus();
                return false;
            }if(f.bns_password2.value==""){
                alert("비밀번호 확인을 입력하세요");
                f.bns_password2.focus();
                return false;
            }
            if (f.bns_password != f.bns_password2) {
                alert("비밀번호가 일치하지 않습니다");
                f.bns_password.focus();
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
                            <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                        </div>
                        <form class="user" action="/business/insertBusiness.do" method="post" onsubmit="return doRegUserCheck(this);">
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                           placeholder="ID" name="bns_id">
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control form-control-user" id="exampleLastName"
                                           placeholder="사업자 번호" name="bns_code">
                                </div>

                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user"
                                       placeholder="NAME" name="bns_name">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user"
                                       placeholder="ADDR" name="bns_addr">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user"
                                       placeholder="ADDR2" name="bns_addr2">
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="password" class="form-control form-control-user"
                                           id="exampleInputPassword" placeholder="Password" name="bns_password">
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control form-control-user"
                                           id="exampleRepeatPassword" placeholder="Repeat Password" name="bns_password2">
                                </div>
                            </div>
                            <input type="submit" class="btn btn-primary btn-user btn-block" value="Register Account">
                        </form>
                        <hr>
                        <div class="text-center">
                            <a class="small" href="forgot-password.html">Forgot Password?</a>
                        </div>
                        <div class="text-center">
                            <a class="small" href="/business/bnsLoginForm.do">Already have an account? Login!</a>
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