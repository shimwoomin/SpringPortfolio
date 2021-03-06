<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<div class="wrap">
		<div class="title">
			<span class="font">${title}</span>
		</div>
		<div class="form">
			<form action="/member/update" method="post">
				<div class="input">
					${input}
					<span id="certification_key">${change}</span>
				</div>
			</form>
		</div>
		<div class="btn">
			<a id = "updateSubmit">수정</a> 
			<c:choose>
				<c:when test="${login.m_grant eq '운영자'}">
					<a href='/member/list'>되돌아가기</a>
				</c:when> 
				<c:otherwise>
					<a href='/member/read'>되돌아가기</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>