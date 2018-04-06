<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/style/header.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/style/button.css"/>
<div class="navbar">
            <ul class="topnav left">
                <li><a href="<%=request.getContextPath() %>/">P1AYGROUND</a></li>
            </ul>    
            <ul class="rightNav">
            <c:if test="${empty sessionScope.userid}">
                <li><a href="login.play">로그인</a></li>
                <li><a href="join.play">회원가입</a></li>
            </c:if>
            <c:if test="${not empty sessionScope.userid}">
                <li><a href="logout.play">로그아웃</a></li>
                <li><a href="mypage.play">마이페이지</a></li>
                <li>장소관리
                <ul class="rightSubNav">
                            <li><a href="new_place.play">신규 등록</a></li>
                            <li><a href="place_list.play">목록 보기</a></li>
                </ul>
                </li>
                <li>게임관리
                <ul class="rightSubNav">
                            <li><a href="new_game.play">신규 등록</a></li>
                            <li><a href="game_list.play">목록 보기</a></li>
                </ul>
                </li>
            </c:if>    
                <li>도움말
                        <ul class="rightSubNav">
                            <li><a href="#" onclick="alert('PLAYGROUND PROJECT 를 소개합니다.')">프로젝트 소개</a></li>
                            <li><a href="#" onclick="alert('TEAM PLAYGROUND 를 소개합니다.')">만든 사람들</a></li>
                        </ul>
                </li>
            </ul>
        </div>