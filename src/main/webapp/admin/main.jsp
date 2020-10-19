<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="../resource/fontawesome/css/all.css">
    <link href="https://fonts.googleapis.com/css2?family=Mulish&display=swap" rel="stylesheet">

    <script src="../resource/jquery-3.5.1.min.js"></script>
    <script src="../resource/JS/underscore-min.js"></script>
    <script src="../resource/sweetalert2/sweetalert2.all.min.js"></script>
    <link rel="stylesheet" href="../resource/sweetalert2/sweetalert2.min.css">
    <link href="../resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resource/TimePicker/mdtimepicker.css" rel="stylesheet" type="text/css">
    <script src="../resource/TimePicker/mdtimepicker.js"></script>
    <script type="text/javascript" src="../resource/DateTimePicker/demo/es5-shim.min.js"></script>
    <script type="text/javascript" src="../resource/DateTimePicker/dist/date-time-picker.min.js"></script>


    <link rel="stylesheet" href="css/Main.css">
    <link rel="stylesheet" href="../Login_v1/vendor/animate/animate.css">
    <link rel="stylesheet" href="../resource/css/animate.min.css"/>


</head>

<body>
<div class="wrapper">
    <div class="top-navbar">
        <div class="logo">
            <a href="#">HSM</a>
        </div>
        <div class="top-manu">
            <div class="home-link">
                <a href="#">
                        <span class="icon">
                            <i class="fas fa-home"></i>
                        </span>
                    <span>Admin</span>
                </a>
            </div>
            <div class="right-info">
                <div class="icon-wrap">
                    <div class="icon">
                        <i class="fas fa-bell"></i>
                    </div>
                </div>
                <div class="icon-wrap">
                    <div class="icon">
                        <i class="fas fa-cog"></i>
                    </div>
                </div>
            </div>
        </div>

    </div>


    <div class="main-body">
        <div class="sidebar-menu">
            <div class="inner-sidebar-menu">
                <ul>
                    <li>
                        <a href="#" id="dashboard" class="dashboard active">
                                <span class="icon">
                                    <i class="fas fa-tachometer-alt"></i>
                                </span>
                            <span class="list">Dashboard</span>
                        </a>

                    </li>
                    <li>
                        <a id="doctor" class="doctor" href="#">
                                <span class="icon">
                                    <i class="fas fa-chart-pie"></i>
                                </span>
                            <span class="list">Doctor</span>
                        </a>
                    </li>
                    <li>
                        <a id="staff" class="staff" href="#">
                                <span class="icon">
                                    <i class="fas fa-address-book"></i>
                                </span>
                            <span class="list">Staff</span>
                        </a>
                    </li>
                    <li>
                        <a id="patient" class="patient" href="#">
                                <span class="icon">
                                    <i class="fas fa-address-card"></i>
                                </span>
                            <span class="list">Patient</span>
                        </a>
                    </li>
                    <li>
                        <a id="about" class="about" href="#">
                                <span class="icon">
                                    <i class="fab fa-blogger"></i>
                                </span>
                            <span class="list">Abouts</span>
                        </a>
                    </li>
                </ul>

                <div class="hamburger">
                    <div class="inner-hamburger">
                            <span class="arrow">
                                <i class="fas fa-long-arrow-alt-left"></i>
                                <i class="fas fa-bars" style="display: none;"></i>
                            </span>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="content">
        <div class="container1">
            <%@include file="dashboard.jsp" %>
            <%@include file="doctor.jsp" %>
            <%@include file="Staff.jsp" %>
            <%@include file="patient.jsp" %>
        </div>
    </div>


</div>
</body>


<script>
    $(document).ready(function () {

        $(".hamburger").click(function () {
            $(".wrapper").toggleClass("active");
        })
        $("#dashboard").click(function () {
            $(".dashboard").addClass("content_active active");
            $(".doctor").removeClass("content_active active");
            $(".staff").removeClass("content_active active");
            $(".patient").removeClass("content_active active");
            $(".about").removeClass("content_active active");

        })
        $("#doctor").click(function () {

            $(".dashboard").removeClass("content_active active");
            $(".doctor").addClass("content_active active");
            $(".staff").removeClass("content_active active");
            $(".patient").removeClass("content_active active");
            $(".about").removeClass("content_active active");

        })
        $("#staff").click(function () {
            $(".dashboard").removeClass("content_active active");
            $(".doctor").removeClass("content_active active");
            $(".staff").addClass("content_active active");
            $(".patient").removeClass("content_active active");
            $(".about").removeClass("content_active active");

        })
        $("#patient").click(function () {
            $(".dashboard").removeClass("content_active active");
            $(".doctor").removeClass("content_active active");
            $(".staff").removeClass("content_active active");
            $(".patient").addClass("content_active active");
            $(".about").removeClass("content_active active");

        })

        $("#about").click(function () {
            $(".dashboard").removeClass("content_active active");
            $(".doctor").removeClass("content_active active");
            $(".staff").removeClass("content_active active");
            $(".patient").removeClass("content_active active");
            $(".about").addClass("content_active active");

        })
        
    });
</script>
<script src="../resource/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../resource/JS/AdminMain.js"></script>
</html>