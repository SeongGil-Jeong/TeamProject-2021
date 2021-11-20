<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Elate &mdash; 100% Free Fully Responsive HTML5 Template
        by FREEHTML5.co</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
    <meta name="keywords"
          content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
    <meta name="author" content="FREEHTML5.CO" />

    <!--
        //////////////////////////////////////////////////////

        FREE HTML5 TEMPLATE
        DESIGNED & DEVELOPED by FREEHTML5.CO

        Website: 		http://freehtml5.co/
        Email: 			info@freehtml5.co
        Twitter: 		http://twitter.com/fh5co
        Facebook: 		https://www.facebook.com/fh5co

        //////////////////////////////////////////////////////
         -->

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content="" />
    <meta property="og:image" content="" />
    <meta property="og:url" content="" />
    <meta property="og:site_name" content="" />
    <meta property="og:description" content="" />
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="/resources/favicon.ico">

    <link
            href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,600,400italic,700'
            rel='stylesheet' type='text/css'>

    <!-- Animate.css -->
    <link rel="stylesheet" href="/resources/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="/resources/css/icomoon.css">
    <!-- Simple Line Icons -->
    <link rel="stylesheet" href="/resources/css/simple-line-icons.css">
    <!-- Magnific Popup -->
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="/resources/css/bootstrap.css">

    <!--
        Default Theme Style
        You can change the style.css (default color purple) to one of these styles

        1. pink.css
        2. blue.css
        3. turquoise.css
        4. orange.css
        5. lightblue.css
        6. brown.css
        7. green.css

        -->
    <link rel="stylesheet" href="/resources/css/style.css">

    <!-- Styleswitcher ( This style is for demo purposes only, you may delete this anytime. ) -->
    <link rel="stylesheet" id="theme-switch" href="/resources/css/style.css">
    <!-- End demo purposes only -->


    <style>
        /* For demo purpose only */

        /* For Demo Purposes Only ( You can delete this anytime :-) */
        #colour-variations {
            padding: 10px;
            -webkit-transition: 0.5s;
            -o-transition: 0.5s;
            transition: 0.5s;
            width: 140px;
            position: fixed;
            left: 0;
            top: 100px;
            z-index: 999999;
            background: #fff;
            /*border-radius: 4px;*/
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px;
            -webkit-box-shadow: 0 0 9px 0 rgba(0, 0, 0, .1);
            -moz-box-shadow: 0 0 9px 0 rgba(0, 0, 0, .1);
            -ms-box-shadow: 0 0 9px 0 rgba(0, 0, 0, .1);
            box-shadow: 0 0 9px 0 rgba(0, 0, 0, .1);
        }

        #colour-variations.sleep {
            margin-left: -140px;
        }

        #colour-variations h3 {
            text-align: center;;
            font-size: 11px;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: #777;
            margin: 0 0 10px 0;
            padding: 0;;
        }

        #colour-variations ul, #colour-variations ul li {
            padding: 0;
            margin: 0;
        }

        #colour-variations li {
            list-style: none;
            display: block;
            margin-bottom: 5px !important;
            float: left;
            width: 100%;
        }

        #colour-variations li a {
            width: 100%;
            position: relative;
            display: block;
            overflow: hidden;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -ms-border-radius: 4px;
            border-radius: 4px;
            -webkit-transition: 0.4s;
            -o-transition: 0.4s;
            transition: 0.4s;
        }

        #colour-variations li a:hover {
            opacity: .9;
        }

        #colour-variations li a>span {
            width: 33.33%;
            height: 20px;
            float: left;
            display: -moz-inline-stack;
            display: inline-block;
            zoom: 1;
            *display: inline;
        }

        .option-toggle {
            position: absolute;
            right: 0;
            top: 0;
            margin-top: 5px;
            margin-right: -30px;
            width: 30px;
            height: 30px;
            background: #f64662;
            text-align: center;
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px;
            color: #fff;
            cursor: pointer;
            -webkit-box-shadow: 0 0 9px 0 rgba(0, 0, 0, .1);
            -moz-box-shadow: 0 0 9px 0 rgba(0, 0, 0, .1);
            -ms-box-shadow: 0 0 9px 0 rgba(0, 0, 0, .1);
            box-shadow: 0 0 9px 0 rgba(0, 0, 0, .1);
        }

        .option-toggle i {
            top: 2px;
            position: relative;
        }

        .option-toggle:hover, .option-toggle:focus, .option-toggle:active {
            color: #fff;
            text-decoration: none;
            outline: none;
        }
    </style>
    <!-- End demo purposes only -->


    <!-- Modernizr JS -->
    <script src="/resources/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="/resources/js/respond.min.js"></script>
    <![endif]-->

</head>
<body>

<section id="fh5co-work" data-section="work">
    <div class="col-md-12 section-heading text-center">
        <h2 class="to-animate">CLEAN LABEL</h2>
        <div class="col-md-8 col-md-offset-2 subtext to-animate"></div>
    </div>
    <div style="text-align: center" class="col-md-4 col-sm-6 col-xxs-12">
        <a href="/resources/img/da1.jpg"
           class="fh5co-project-item image-popup to-animate"> <img
                src="/resources/img/da1.jpg" alt="Image" class="img-responsive"
                style="width:200px; height:170px; display:block; margin:0  auto">
            <div class="fh5co-text">
                <h2>다림질을 할수없는옷입니다</h2>
            </div>
        </a>
    </div>
    <div style="text-align: center" class="col-md-4 col-sm-6 col-xxs-12">
        <a href="/resources/img/da2.jpg"
           class="fh5co-project-item image-popup to-animate"> <img
                src="/resources/img/da2.jpg" alt="Image" class="img-responsive"
                style="width:200px; height:170px; display:block; margin:0  auto">
            <div class="fh5co-text">
                <h2>80~120˚로 다림질</h2>
            </div>
        </a>
    </div>
    <div style="text-align: center" class="col-md-4 col-sm-6 col-xxs-12">
        <a href="/resources/img/da3.jpg"
           class="fh5co-project-item image-popup to-animate"> <img
                src="/resources/img/da3.jpg" alt="Image" class="img-responsive"
                style="width:200px; height:170px; display:block; margin:0  auto">
            <div class="fh5co-text">
                <h2>140~160˚로 다림질</h2>
            </div>
        </a>
    </div>
    <div style="text-align: center" class="col-md-4 col-sm-6 col-xxs-12">
        <a href="/resources/img/da4.jpg"
           class="fh5co-project-item image-popup to-animate"> <img
                src="/resources/img/da4.jpg" alt="Image" class="img-responsive"
                style="width:200px; height:170px; display:block; margin:0  auto">
            <div class="fh5co-text">
                <h2>180~210˚로 다림질</h2>
            </div>
        </a>
    </div>
    <div style="text-align: center" class="col-md-4 col-sm-6 col-xxs-12">
        <a href="/resources/img/mul1.jpg"
           class="fh5co-project-item image-popup to-animate"> <img
                src="/resources/img/mul1.jpg" alt="Image" class="img-responsive"
                style="width:200px; height:170px; display:block; margin:0  auto">
            <div class="fh5co-text">
                <h2>물세탁 안되는 옷입니다</h2>
            </div>
        </a>
    </div>
    <div style="text-align: center" class="col-md-4 col-sm-6 col-xxs-12">
        <a href="/resources/img/mul2.jpg"
           class="fh5co-project-item image-popup to-animate"> <img
                src="/resources/img/mul2.jpg" alt="Image" class="img-responsive"
                style="width:200px; height:170px; display:block; margin:0  auto">
            <div class="fh5co-text">
                <h2>30˚물로 중성세제사용 세탁기불가</h2>
            </div>
        </a>
    </div>
    <div style="text-align: center" class="col-md-4 col-sm-6 col-xxs-12">
        <a href="/resources/img/mul3.jpg"
           class="fh5co-project-item image-popup to-animate"> <img
                src="/resources/img/mul3.jpg" alt="Image" class="img-responsive"
                style="width:200px; height:170px; display:block; margin:0  auto">
            <div class="fh5co-text">
                <h2>30˚물로 중성세제사용 세탁기가능</h2>
            </div>
        </a>
    </div>
    <div style="text-align: center" class="col-md-4 col-sm-6 col-xxs-12">
        <a href="/resources/img/mul4.jpg"
           class="fh5co-project-item image-popup to-animate"> <img
                src="/resources/img/mul4.jpg" alt="Image" class="img-responsive"
                style="width:200px; height:170px; display:block; margin:0  auto">
            <div class="fh5co-text">
                <h2>40˚물로 세탁하시면됩니다</h2>
            </div>
        </a>
    </div>
    <div style="text-align: center" class="col-md-4 col-sm-6 col-xxs-12">
        <a href="/resources/img/mul5.jpg"
           class="fh5co-project-item image-popup to-animate"> <img
                src="/resources/img/mul5.jpg" alt="Image" class="img-responsive"
                style="width:200px; height:170px; display:block; margin:0  auto">
            <div class="fh5co-text">
                <h2>60˚물로 세탁하시면됩니다</h2>
            </div>
        </a>
    </div>
    <div style="text-align: center" class="col-md-4 col-sm-6 col-xxs-12">
        <a href="/resources/img/mul6.jpg"
           class="fh5co-project-item image-popup to-animate"> <img
                src="/resources/img/mul6.jpg" alt="Image" class="img-responsive"
                style="width:200px; height:170px; display:block; margin:0  auto">
            <div class="fh5co-text">
                <h2>40˚물로 세탁하고 삶을 수 있음</h2>
            </div>
        </a>
    </div>
    <div style="text-align: center" class="col-md-4 col-sm-6 col-xxs-12">
        <a href="/resources/img/pyo1.jpg"
           class="fh5co-project-item image-popup to-animate"> <img
                src="/resources/img/pyo1.jpg" alt="Image" class="img-responsive"
                style="width:200px; height:170px; display:block; margin:0  auto">
            <div class="fh5co-text">
                <h2>산소,염소계 표백제 표백불가</h2>
            </div>
        </a>
    </div>
    <div style="text-align: center" class="col-md-4 col-sm-6 col-xxs-12">
        <a href="/resources/img/pyo2.jpg"
           class="fh5co-project-item image-popup to-animate"> <img
                src="/resources/img/pyo2.jpg" alt="Image" class="img-responsive"
                style="width:200px; height:170px; display:block; margin:0  auto">
            <div class="fh5co-text">
                <h2>산소,염소계 표백제 표백가능</h2>
            </div>
        </a>
    </div>
    <div style="text-align: center" class="col-md-4 col-sm-6 col-xxs-12">
        <a href="/resources/img/pyo3.jpg"
           class="fh5co-project-item image-popup to-animate"> <img
                src="/resources/img/pyo3.jpg" alt="Image" class="img-responsive"
                style="width:200px; height:170px; display:block; margin:0  auto">
            <div class="fh5co-text">
                <h2>산소계 표백제 표백불가</h2>
            </div>
        </a>
    </div>
    <div style="text-align: center" class="col-md-4 col-sm-6 col-xxs-12">
        <a href="/resources/img/pyo4.jpg"
           class="fh5co-project-item image-popup to-animate"> <img
                src="/resources/img/pyo4.jpg" alt="Image" class="img-responsive"
                style="width:200px; height:170px; display:block; margin:0  auto">
            <div class="fh5co-text">
                <h2>염소계 표백제 표백불가</h2>
            </div>
        </a>
    </div>

    <div style="text-align: center" class="col-md-4 col-sm-6 col-xxs-12">
        <a href="/resources/img/pyo6.jpg"
           class="fh5co-project-item image-popup to-animate"> <img
                src="/resources/img/pyo6.jpg" alt="Image" class="img-responsive"
                style="width:200px; height:170px; display:block; margin:0  auto">
            <div class="fh5co-text">
                <h2>염소계 표백제 표백가능</h2>
            </div>
        </a>
    </div>


</section>





<!-- End demo purposes only -->


<!-- jQuery -->
<script src="/resources/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="/resources/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="/resources/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="/resources/js/jquery.waypoints.min.js"></script> //
<!-- Stellar Parallax -->
<script src="/resources/js/jquery.stellar.min.js"></script>
<!-- Counter -->
<script src="/resources/js/jquery.countTo.js"></script>
<!-- Magnific Popup -->
<script src="/resources/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/js/magnific-popup-options.js"></script>
<!-- Google Map -->
<script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
<script src="/resources/js/google_map.js"></script>

<!-- For demo purposes only styleswitcher ( You may delete this anytime ) -->
<script src="/resources/js/jquery.style.switcher.js"></script>
<script>
    $(function() {
        $('#colour-variations ul').styleSwitcher({
            defaultThemeId : 'theme-switch',
            hasPreview : false,
            cookie : {
                expires : 30,
                isManagingLoad : true
            }
        });
        $('.option-toggle').click(function() {
            $('#colour-variations').toggleClass('sleep');
        });
    });
</script>
<!-- End demo purposes only -->

<!-- Main JS (Do not remove) -->
<script src="/resources/js/main.js"></script>
</body>
</html>

