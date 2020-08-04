<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!--초기화-->
    <style>
        *{margin:0; padding:0; 
        /* border:1px solid black; */
        }

        body{font-family: sans-serif; width:1920px; margin: 0 auto;}
        li{list-style: none;}
        a{text-decoration:none; color:black;}
    </style>
    <!--header style-->
    <style>
        #main_header {

            width: 1920px;
            height: 80px;
            position: fixed;
            top: 0;
            z-index: 10;
        }

        #main_header>#top_header {
            height: 80px;
            background-color: white;
        }

        #main_header>#top_header>.logo {
            float: left;
            width: 20%;
            box-sizing: border-box;
            text-align: center;
            line-height: 80px;
            background-color: white;

            margin-left: 5%;
        }

        #main_header>#top_header>.main_gnb {
            float: left;
            width: 50%;
            box-sizing: border-box;
            margin: 0 auto;
            background-color: white;
            margin-left: 5%;
            color: gray;
        }

        #main_header>#top_header>.main_gnb>ul {
            overflow: hidden;
        }

        #main_header>#top_header>.main_gnb>ul>li {
            float: left;
            margin-top: 30px;
        }

        #main_header>#top_header>.main_gnb>#main_list>li {
            font-size: 13px;
        }

        #main_header>#top_header>.main_gnb>#main_list>li>a {
            padding: 20px;
            font-size: 13px;
        }

        #main_header>#top_header>.main_gnb>#main_list>li>div {
            margin-top: 20px;
        }

        #main_header>#top_header>.main_gnb>#main_list>li>div>div {
            overflow: hidden;
            position: absolute;
            width: 100%;
            left: 0;
            background-color: white;
        }

        #main_header>#top_header>.main_gnb>#main_list>li>div>div>.sub_menu {
            display: none;
            float: left;
            font-size: 12px;

            height: 400px;
        }

        #main_header>#top_header>.main_gnb>#main_list>li>div>div>.sub_menu>li {
            margin-top: 5px;
        }

        #main_header>#top_header>.main_gnb>#main_list>li>div>div>.sub_img {
            display: none;
            float: right;
            margin-top: 1%;
            margin-right: 10%;
            margin-bottom: 2%;
        }

        #main_header>#top_header>.main_gnb>#main_list>li>div>div>ul>li {
            margin-left: 100px;
            padding: 5px 0;
        }

        #main_header>#top_header>.main_gnb>#main_list>li>div>div>ul:first-child {
            margin-left: 80px;
        }

        #main_header>#top_header>.main_gnb>#main_list>li>a:hover+div>div>ul {
            display: block;
        }

        #main_header>#top_header>.main_gnb>#main_list>li>div>div:hover>ul {
            display: block;
        }

        #main_header>#top_header>.main_gnb>#main_list>li>div>div>ul>.sub_menu_top {
            font-size: 20px;
            margin-top: 15px;
        }

        #main_header>#top_header>.main_gnb>#main_list .red {
            color: red;
        }

        #main_header>#top_header>.main_gnb>#main_list>li>div>div>ul>img {
            width: 350px;
            height: 400px;
        }

        #main_header>#top_header>.side_bar {
            float: left;
            width: 20%;
            box-sizing: border-box;
            line-height: 80px;

            background-color: white;
        }

        #main_header>#top_header>.side_bar>ul {
            overflow: hidden;
        }

        #main_header>#top_header>.side_bar>ul>li {
            float: left;
            box-sizing: border-box;
            padding-right: 20px;
            font-size: 12px;
        }

        .neon {
            color: red;
            animation: neon 1s ease infinite;
            -moz-animation: neon 1s ease infinite;
            -webkit-animation: neon 1s ease infinite;
        }

        @keyframes neon {

            0%,
            100% {
                text-shadow: 0 0 1vw #FA1C16, 0 0 3vw #FA1C16, 0 0 10vw #FA1C16, 0 0 10vw #FA1C16, 0 0 .4vw #FED128;
                color: #FED128;
            }

            50% {
                text-shadow: 0 0 .5vw #800E0B, 0 0 1.5vw #800E0B, 0 0 5vw #800E0B, 0 0 5vw #800E0B, 0 0 .2vw #800E0B;
                color: #806914;
            }
        }
    </style>

    <!--content style-->    
    <style>
        #content{
            margin-top:100px; /* 헤더높이 100px만큼 띄워줌으로써 헤더에 겹치는 현상 해결 */
        }
        .top{
            overflow: hidden;
            width:100%;
            height:700px;
        }
        .top > #left_top{
            box-sizing: border-box;
            float:left;
            text-align:left;
            padding: 100px 50px;
            width:40%;
        }
        .top > #left_top > ul{
            overflow: hidden;
        }
        .top > #left_top > ul > li{
            float: left;
        }
        .top > #left_top > ul > li > a{
            display: block;
            padding: 20px 20px;
            border: 1px solid black;
            margin: 30px 10px;
        }
        .top > #left_top > ul > li > a:hover{
            background-color: black;
            color:white;
        }
        .top > #right_top{
            box-sizing: border-box;
            float:right;
            width:60%;
        }

        /* 본문 오른쪽 상단 이미지 슬라이드*/
        .top> #right_top > .slide{
            width:1170px;
            height:600px;
            overflow: hidden;
            position:relative;
        }
        .top > #right_top > .slide > ul{
            display:flex; width:(100% * 4);
            position:absolute;left:0;right:0;top:0;bottom:0;
            animation:slide 13s infinite;
            z-index: 5;
        }
        
        @keyframes slide {
            0% {margin-left:0;} /* 0 ~ 10  : 정지 */
            10% {margin-left:0;} /* 10 ~ 25 : 변이 */
            25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
            35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
            50% {margin-left:-200%;}
            60% {margin-left:-200%;}
            75% {margin-left:-300%;}
            85% {margin-left:-300%;}
            100% {margin-left:0;}
        }

        .center{
            overflow: hidden;
            width:100%;
        }
        .center > .woman_center_text{
            margin-top:5%;
            width:100%;
            height:300px;
            opacity: 0.9;
            background-image:url("woman_center.jpg");
            background-repeat:no-repeat;
            background-attachment:fixed;
            background-position:top;
            background-size:cover;
        }
        .center > .woman_center_text > h1{
            text-align: center;
            line-height: 300px;
            color:white;
        }
        .center > .man_center_text{
            margin-top:5%;
            width:100%;
            height:300px;
            opacity: 0.9;
            background-image:url("man_center.jpg");
            background-repeat:no-repeat;
            background-attachment:fixed;
            background-position:top;
            background-size:cover;
        }
        .center > .man_center_text > h1{
            text-align: center;
            line-height: 300px;
            color:white;
        }
        .center > .menu_box{
            overflow: hidden;
            width:100%;
            margin:auto 5%;
        }
        .center > .menu_box > .image {
            float:left;
            display: block;
            margin:5% 2%;
            box-sizing: border-box;
        }
        .center > .menu_box > .image > a > img:hover{
            opacity:0.7;
        }
        .center > .menu_box > .image > ul > li > a{
            display: block;
            width:150px;
            text-align: center;
            padding: 20px 20px;
            border: 1px solid black;
        }
        .center > .menu_box > .image > ul > li > a:hover{
            background-color: black;
            color:white;
        }
        .bottom{
            overflow: hidden;
            width: 100%;
            margin: 20px auto;
        }
        .bottom > #bottom_menu{
            display:block;
            overflow: hidden;
            margin-bottom: 10%;
        }
        .bottom > #bottom_menu > #left_bottom{
            float:left;
            margin-left:10%;
            box-sizing: border-box;
        }
        .bottom > #bottom_menu > #left_bottom > ul{
            overflow: hidden;
        }
        .bottom > #bottom_menu > #left_bottom > ul > li{
            float:left;
        }
        .bottom > #bottom_menu > #left_bottom > ul > li > a{
            display: block;
            padding: 30px 30px;
            border: 1px solid black;
            margin-top:20px;
            margin-right:10px;
        }
        .bottom > #bottom_menu > #left_bottom > ul > li > a:hover{
            background-color: black;
            color:white;
        }
        .bottom > #bottom_menu > #right_bottom{
            float:left;
            margin-left:5%;
            box-sizing: border-box;
        }
        .bottom > #bottom_menu > #right_bottom > ul{
            overflow: hidden;
        }
        .bottom > #bottom_menu > #right_bottom > ul > li{
            float:left;
        }
        .bottom > #bottom_menu > #right_bottom > ul > li > a{
            display: block;
            padding: 30px 30px;
            border: 1px solid black;
            margin-top:20px;
            margin-right:10px;
        }
        .bottom > #bottom_menu > #right_bottom > ul > li > a:hover{
            background-color: black;
            color:white;
        }
    </style>
    <!--footer style-->
    <style>
        #main_footer{
            width:100%;
            background-color: black;
            color:white;
        }
        #main_footer > .footer_menu{
            overflow: hidden; 
            margin-left: 13%;
        }
        #main_footer > .footer_menu > h1{margin-top:20px;}
        #main_footer > .footer_menu > .footer_list{
            float:left;
            margin-top: 30px;
            margin-left: 0;
            margin-right: 10%;
            margin-bottom:30px;
        }
        #main_footer > .footer_menu > .footer_list >li { margin : 10px}
        #main_footer > .footer_menu > .footer_list > li > a{ color:white;}
        
        #main_footer > #sns_img{ margin-left:13%; padding-bottom:2%;}
        #main_footer > #sns_img > a {padding:0 1px;}
        #main_footer > #sns_img > a > img:nth-child(1){margin-left:30px;}

        #main_footer > #footer_bottom{ color:white; padding-bottom:2%;}
        #main_footer > #footer_bottom > ul{overflow:hidden;}
        #main_footer > #footer_bottom > ul > #footer_left_bottom{float: left;overflow: hidden;margin-left:13%;}
        #main_footer > #footer_bottom > ul > #footer_right_bottom{width:40%;float:right;overflow: hidden;margin-right:10%;}
        #main_footer > #footer_bottom > ul > ul > li{float:left;}
        #main_footer > #footer_bottom > ul > #footer_right_bottom > li{border-right:1px solid white;padding: 0 2%;}
        #main_footer > #footer_bottom > ul > #footer_right_bottom > li:last-child{border:none;}
        #main_footer > #footer_bottom > ul > ul > li > a{color:white;}
        
    </style>
</head>
<body>
    <header id = "main_header">
        <div id = "top_header">
            <div class="logo">
                <a href="main.html"><h1>CALVIN FLY</h1></a>
            </div>
            <div class="main_gnb">
                <ul id="main_list">
                    <li>
                        <a href="../man/man2.html">남성</a>
                        <div>
                            <div>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">하이라이트</li>
                                    <li><a href="#" class = "red">중반판매</a></li>
                                    <li><a href="#">신제품</a></li>
                                    <li><a href="#">Body Stretch Denim</a></li>
                                    <li><a href="#">CK ONE</a></li>
                                    <li><a href="#">선물 아이디어♥</a></li>
                                    <li><a href="#">커플 세트</a></li>
                                    <li><a href="#">오프 시즌</a></li>
                                </ul>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">의류</li>
                                    <li><a href="#">모든 제품 쇼핑</a></li>
                                    <li><a href="#">재킷</a></li>
                                    <li><a href="#">코트</a></li>
                                    <li><a href="#">스웨터</a></li>
                                    <li><a href="#">셔츠</a></li>
                                    <li><a href="#">데님 팬츠</a></li>
                                    <li><a href="#">팬츠 + 쇼츠</a></li>
                                    <li><a href="#">언더웨어</a></li>
                                    <li><a href="#">액티브웨어</a></li>
                                </ul>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">액세서리</li>
                                    <li><a href="#">모든 제품 쇼핑</a></li>
                                    <li><a href="#">백 + 백팩</a></li>
                                    <li><a href="#">지갑 + 액세서리 소품</a></li>
                                    <li><a href="#">벨트</a></li>
                                    <li><a href="#">시계 + 주얼리</a></li>
                                    <li><a href="#">부츠 + 스니커즈</a></li>
                                    <li><a href="#">양말</a></li>
                                    <li><a href="#">선글라스</a></li>
                                    <li><a href="#">캡 + 스카프</a></li>
                                </ul>
                                <ul class = "sub_img">
                                    <img src="top_submenu_1.jpg" alt="이미지">
                                </ul>
                            </div>
                        </div>    
                    </li>
                    <li>
                        <a href="../women/women.html">여성</a>
                        <div>
                            <div>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">하이라이트</li>
                                    <li><a href="#" class = "red">중반판매</a></li>
                                    <li><a href="#">신제품</a></li>
                                    <li><a href="#">Body Stretch Denim</a></li>
                                    <li><a href="#">CK ONE</a></li>
                                    <li><a href="#">선물 아이디어♥</a></li>
                                    <li><a href="#">커플 세트</a></li>
                                    <li><a href="#">오프 시즌</a></li>
                                </ul>
                                <ul class = "sub_menu">
                                    
                                    <li class = "sub_menu_top">의류</li>
                                    <li><a href="#">모든 제품 쇼핑</a></li>
                                    <li><a href="#">재킷</a></li>
                                    <li><a href="#">코트</a></li>
                                    <li><a href="#">스웨터</a></li>
                                    <li><a href="#">셔츠</a></li>
                                    <li><a href="#">데님 팬츠</a></li>
                                    <li><a href="#">팬츠 + 쇼츠</a></li>
                                    <li><a href="#">스커트</a></li>
                                    <li><a href="#">언더웨어</a></li>
                                </ul>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">액세서리</li>
                                    <li><a href="#">모든 제품 쇼핑</a></li>
                                    <li><a href="#">핸드백 + 파우치</a></li>
                                    <li><a href="#">지갑 + 액세서리 소품</a></li>
                                    <li><a href="#">보석</a></li>
                                    <li><a href="#">시계</a></li>
                                    <li><a href="#">신발 + 스니커즈</a></li>
                                    <li><a href="#">삭스 + 양말류</a></li>
                                    <li><a href="#">선글라스</a></li>
                                    <li><a href="#">벨트</a></li>
                                    <li><a href="#">캡 + 비니</a></li>
                                </ul>
                                <ul class = "sub_img">
                                    <img src="top_submenu_2.jpg" alt="이미지">
                                </ul>
                            </div>
                        </div>    
                    </li>
                    <li>
                        <a href="../Kids/Kids.html">키즈</a>
                        <div>
                            <div>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">하이라이트</li>
                                    <li><a href="#">남아 신제품</a></li>
                                    <li><a href="#">여아신제품</a></li>
                                    <li><a href="#" class = "red">오프 시즌</a></li>
                                </ul>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">남아</li>
                                    <li><a href="#">모든 제품 쇼핑</a></li>
                                    <li><a href="#">티셔츠 + 탑</a></li>
                                    <li><a href="#">스웨트셔츠 + 후디</a></li>
                                    <li><a href="#">재킷 + 코트</a></li>
                                    <li><a href="#">팬츠 + 쇼츠</a></li>
                                    <li><a href="#">언더웨어</a></li>
                                    <li><a href="#">수영복</a></li>
                                    <li><a href="#">남아 액세서리</a></li>
                                </ul>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">여아</li>
                                    <li><a href="#">모든 제품 쇼핑</a></li>
                                    <li><a href="#">티셔츠 + 탑</a></li>
                                    <li><a href="#">스웨트셔츠 + 후디</a></li>
                                    <li><a href="#">드레스</a></li>
                                    <li><a href="#">재킷 + 코트</a></li>
                                    <li><a href="#">스커트</a></li>
                                    <li><a href="#">팬츠 + 쇼츠</a></li>
                                    <li><a href="#">언더웨어</a></li>
                                    <li><a href="#">수영복</a></li>
                                    <li><a href="#">여아 액세서리</a></li>
                                </ul>
                                <ul class = "sub_img">
                                    <img src="top_submenu_3.jpg" alt="이미지">
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="#">언더웨어</a>
                        <div>
                            <div>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">하이라이트</li>
                                    <li><a href="#">CK ONE</a></li>
                                    <li><a href="#">커플 세트</a></li>
                                    <li><a href="#" class = "red">오프 시즌</a></li>
                                    <li><a href="#">New Arrivals</a></li>
                                    <li><a href="#">T-shirt Bras</a></li>
                                    <li><a href="#">CK Black</a></li>
                                </ul>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">남성</li>
                                    <li><a href="#">모든 제품 쇼핑</a></li>
                                    <li><a href="#">멀티팩</a></li>
                                    <li><a href="#">트렁크</a></li>
                                    <li><a href="#">브리프</a></li>
                                    <li><a href="#">박서</a></li>
                                    <li><a href="#">박서 브리프</a></li>
                                    <li><a href="#">잠옷</a></li>
                                </ul>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">여성</li>
                                    <li><a href="#">모든 제품 쇼핑</a></li>
                                    <li><a href="#">브라</a></li>
                                    <li><a href="#">팬티</a></li>
                                    <li><a href="#">멀티팩</a></li>
                                    <li><a href="#">잠옷</a></li>
                                </ul>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">남아</li>
                                    <li><a href="#">모든 제품 쇼핑</a></li>
                                    <li><a href="#">멀티팩</a></li>
                                    <li><a href="#">수영복</a></li>
                                    <li><a href="#">잠옷</a></li>
                                </ul>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">여아</li>
                                    <li><a href="#">모든 제품 쇼핑</a></li>
                                    <li><a href="#">멀티팩</a></li>
                                    <li><a href="#">수영복</a></li>
                                    <li><a href="#">잠옷</a></li>
                                </ul>
                                <ul class = "sub_img">
                                    <img src="top_submenu_4.jpg" alt="이미지">
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="../performance/포퍼먼스.html">퍼포먼스</a>
                        <div>
                            <div>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">하이라이트</li>
                                    <li><a href="#">행아웃 에디션</a></li>
                                    <li><a href="#">워크아웃 필수 아이템</a></li>
                                    <li><a href="#" class = "red">오프시즌</a></li>
                                    <li><a href="#">New Arrivals</a></li>
                                </ul>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">남성용 의류</li>
                                    <li><a href="#">모든 제품 쇼핑</a></li>
                                    <li><a href="#">재킷 + 코트</a></li>
                                    <li><a href="#">스웨트셔츠 + 후디</a></li>
                                    <li><a href="#">티셔츠 + 탱크</a></li>
                                    <li><a href="#">타이즈</a></li>
                                    <li><a href="#">팬츠 + 쇼츠</a></li>
                                    <li><a href="#">수영복</a></li>
                                    <li><a href="#">워크아웃 액세서리</a></li>
                                </ul>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">여성용 의류</li>
                                    <li><a href="#">모든 제품 쇼핑</a></li>
                                    <li><a href="#">스포츠 브라</a></li>
                                    <li><a href="#">레깅스</a></li>
                                    <li><a href="#">재킷 + 코트</a></li>
                                    <li><a href="#">스웨트셔츠 + 후디</a></li>
                                    <li><a href="#">티셔츠 + 탱크</a></li>
                                    <li><a href="#">드레스 + 오버롤</a></li>
                                    <li><a href="#">팬츠 + 쇼츠</a></li>
                                    <li><a href="#">스커트</a></li>
                                    <li><a href="#">수영복</a></li>
                                    <li><a href="#">워크아웃 액세서리</a></li>
                                </ul>
                                <ul class = "sub_img">
                                    <img src="top_submenu_5.jpg" alt="이미지">
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="../off_season/off.html" class = "neon">오프시즌</a>
                        <div>
                            <div>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">남성용 의류</li>
                                    <li><a href="#">모든 제품 쇼핑</a></li>
                                    <li><a href="#">자켓 + 아우터</a></li>
                                    <li><a href="#">스웨터/a></li>
                                    <li><a href="#">셔츠</a></li>
                                    <li><a href="#">티셔츠 + 탱크</a></li>
                                    <li><a href="#">팬츠 + 쇼츠</a></li>
                                    <li><a href="#">잠옷</a></li>
                                    <li><a href="#">언더웨어</a></li>
                                </ul>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">남성용 액세서리</li>
                                    <li><a href="#">모든 제품 쇼핑</a></li>
                                    <li><a href="#">백 + 백팩</a></li>
                                    <li><a href="#">지갑 + 액세서리 소품</a></li>
                                    <li><a href="#">벨트</a></li>
                                    <li><a href="#">신발</a></li>
                                </ul>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">여성용 의류</li>
                                    <li><a href="#">모든 제품 쇼핑</a></li>
                                    <li><a href="#">재킷</a></li>
                                    <li><a href="#">스웨터 + 카디건</a></li>
                                    <li><a href="#">셔츠</a></li>
                                    <li><a href="#">상의</a></li>
                                    <li><a href="#">티셔츠 + 탱크</a></li>
                                    <li><a href="#">드레스 + 오버롤</a></li>
                                    <li><a href="#">팬츠 + 쇼츠</a></li>
                                    <li><a href="#">잠옷</a></li>
                                    <li><a href="#">언더웨어</a></li>
                                </ul>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">여성용 액세서리</li>
                                    <li><a href="#">모든 제품 쇼핑</a></li>
                                    <li><a href="#">핸드백 + 파우치</a></li>
                                    <li><a href="#">지갑 + 액세서리 소품</a></li>
                                    <li><a href="#">구두 + 샌들</a></li>
                                    <li><a href="#">벨트</a></li>
                                </ul>
                                <ul class = "sub_menu">
                                    <li class = "sub_menu_top">아동용</li>
                                    <li><a href="#">남아용 제품 쇼핑</a></li>
                                    <li><a href="#">여아용 제품 쇼핑</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>

                </ul>
            </div>
            <div class = "side_bar">
                <ul>
                    <li><a href="#"><img src="top1.png" alt="검색이미지" widt=20px>검색</a></li>
                    <li><a href="#"><img src="top2.png" alt="매장검색이미지">매장 검색</a></li>
                    <li><a href="../login/login.html"><img src="top3.png" alt="로그인이미지">로그인</a></li>
                    <li><a href="#"><img src="top4.png" alt="백이미지">백</a></li>
                </ul>
            </div>
        </div>
        
    </header>
    <div id="content">
        <div class="top">
            <div id="left_top">
                <h1>SELF-CONFIDENCE IS SEXY.</h1>
                <h1>#MYCALVINS</h1>
                <h2>나는 나. 내가 좋아하는 것을 좋아하고,</h2>
                <h2>내가 원하는 것을 하지. 있는 그대로 받아들이는 거야.</h2>
                <ul>
                    <li><a href="#">남성용 구매하기</a></li>
                    <li><a href="#">여성용 구매하기</a></li>
                </ul>
            </div>
            <div id="right_top">
                <div class="slide">
                    <ul>
                        <li><img src="sbanner1.jpg" alt="이미지"></li>
                        <li><img src="sbanner2.jpg" alt="이미지"></li>
                        <li><img src="sbanner3.jpg" alt="이미지"></li>
                        <li><img src="sbanner4.jpg" alt="이미지"></li>
                    </ul>
    
                </div>
    
            </div>
        </div>
        <div class="center">
            <div class="woman_center_text">
                <h1>WOMEN'S APPAREL</h1>
            </div>
            <div class="menu_box">
                <div class="image">
                    <a href="#"><img src="picture_1.jpg" alt="이미지"></a>
                    <h1>APPAREL</h1>
                    <ul>
                        <li><a href="#">지금 구매하기</a></li>
                    </ul>
                </div>
                <div class="image">
                    <a href="#"><img src="picture_2.jpg" alt="이미지"></a>
                    <h1>UNDERWEAR</h1>
                    <ul>
                        <li><a href="#">지금 구매하기</a></li>
                    </ul>
                </div>
                <div class="image">
                    <a href=""><img src="picture_3.jpg" alt="이미지"></a>
                    <h1>ACTIVEWEAR</h1>
                    <ul>
                        <li><a href="#">지금 구매하기</a></li>
                    </ul>
                </div>
                <div class="image">
                    <a href=""><img src="picture_4.jpg" alt="이미지"></a>
                    <h1>ACCESSORIES</h1>
                    <ul>
                        <li><a href="#">지금 구매하기</a></li>
                    </ul>
                </div>
            </div>
    
            <div class="man_center_text">
                <h1>MEN'S APPAREL</h1>
            </div>
            <div class="menu_box">
                <div class="image">
                    <a href="../man/man.html"><img src="picture_5.jpg" alt="이미지"></a>
                    <h1>APPAREL</h1>
                    <ul>
                        <li><a href="../man/man.html">지금 구매하기</a></li>
                    </ul>
                </div>
                <div class="image">
                    <a href="#"><img src="picture_6.jpg" alt="이미지"></a>
                    <h1>UNDERWEAR</h1>
                    <ul>
                        <li><a href="#">지금 구매하기</a></li>
                    </ul>
                </div>
                <div class="image">
                    <a href=""><img src="picture_7.jpg" alt="이미지"></a>
                    <h1>ACTIVEWEAR</h1>
                    <ul>
                        <li><a href="#">지금 구매하기</a></li>
                    </ul>
                </div>
                <div class="image">
                    <a href=""><img src="picture_8.jpg" alt="이미지"></a>
                    <h1>ACCESSORIES</h1>
                    <ul>
                        <li><a href="#">지금 구매하기</a></li>
                    </ul>
                </div>
            </div>
            <div class="bottom">
                <div id="bottom_menu">
                    <div id="left_bottom">
                        <img src="picture_9.jpg" alt="이미지대체">
                        <h1>NEW ARRIVALS</h1>
                        <ul>
                            <li><a href="../man/man.html">남성용 구매하기</a></li>
                            <li><a href="#">여성용 구매하기</a></li>
                        </ul>
                    </div>
                    <div id="right_bottom">
                        <img src="picture_10.jpg" alt="이미지대체">
                        <h1>CK ONE COLLECTION</h1>
                        <ul>
                            <li><a href="../man/man.html">남성용 구매하기</a></li>
                            <li><a href="#">여성용 구매하기</a></li>
                        </ul>
                    </div>
    
                </div>
            </div>
        </div>
    </div>
    <footer id = "main_footer">
        <div class = "footer_menu">
            <h1>CALVIN FLY</h1>
            <ul class = "footer_list">
                <h1>고객 서비스</h1>
                <li><a href="#">주문 조회/반품</a></li>
                <li><a href="#">배송 정보</a></li>
                <li><a href="#">반품 정책</a></li>
                <li><a href="#">결제 방법</a></li>
                <li><a href="#">친구에게 추천하기</a></li>
            </ul>
            <ul class = "footer_list">
                <h1>탐색</h1>
                <li><a href="#">남성</a></li>
                <li><a href="#">여성</a></li>
                <li><a href="#">언더웨어</a></li>
                <li><a href="#">기능성</a></li>
                <li><a href="#">세일</a></li>
            </ul>
            <ul class = "footer_list">
                <h1>소개</h1>
                <li><a href="#">CALVIN FLY소개</a></li>
                <li><a href="#">직업</a></li>
            </ul>
            <ul class = "footer_list">
                <h1>연락처</h1>
                <li><a href="#">이메일</a></li>
                <li><a href="#">연락처</a></li>
            </ul>
        </div>
        <div id = "sns_img">
            <a href=""><img src="facebook.png" alt=""></a>
            <a href=""><img src="instagram.png" alt=""></a>
            <a href=""><img src="blog.png" alt=""></a>
            <a href=""><img src="twitter.png" alt=""></a>
        </div>
        <div id = "footer_bottom">
            <ul>
                <ul id = "footer_left_bottom">
                    <li>Calvin FLY는 전 세계 목화 농업 개선을 위해 The Better Cotton Initiative와 협력합니다.</li>
                </ul>
                <ul id="footer_right_bottom">
                    <li>캘리포니아 공급망 투명성 & UK 현대판 노예제도 선언</li>
                    <li><a href="#">개인정보 보호정책</a></li>
                    <li><a href="#">이용 약관</a></li>
                </ul>
                
            </ul>
        </div>
    </footer>
</body>
</html>