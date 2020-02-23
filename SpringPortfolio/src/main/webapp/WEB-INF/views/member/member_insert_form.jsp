<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/css/member/member_insert.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/member/member_insert.js"></script> 
<script type="text/javascript">
	
</script>

<!-- <script type="text/javascript">
	function blankFocus(target, value) {
		$(target).forcusout(function() {
			if (value.length)
		});
	}
</script> -->
<style>
msg {
	border-collapse: 2;
}

form {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<form action="/member/insert" method="POST">
		<table>
			<tr>
				<th>아이디</th>
				<td><input required type="text" name="m_id" /></td>
			</tr>
			<tr>
				<th id="id_msg" class="msg" colspan="1">&nbsp;</th>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="m_password" id="password_1" /></td>
			</tr>
			<tr>
				<th id="password_msg_1" class="msg">&nbsp;</th>
			</tr>
			<tr>
				<th>비밀번호 재확인</th>
				<td><input type="password" name = "password_2" id="password_2" /></td>
			</tr>
			<tr>
				<th id="password_msg_2" class="msg">&nbsp;</th>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="m_name" /></td>
			</tr>
			<tr>
				<th id="name_msg" class="msg">&nbsp;</th>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="genderCheck" id="man" checked="checked"/>남자 
				<input type="radio" id = "woman" />여자</td>
			</tr>
			<tr>
				<th id="gender_msg" class="msg">&nbsp;</th>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><select name="year">
						<c:forEach items="${util.year }" var="year">
							<option value="${year }">${year }</option>
						</c:forEach>
				</select> <samp style="font-size: 20px;">-</samp><select name="month">
						<c:forEach items="${util.month }" var="month">
							<option value="${month }">${month }</option>
						</c:forEach>
				</select> <samp style="font-size: 20px;">-</samp><select name="date"
					id="date">
						<option value="00">00</option>
				</select></td>
			</tr>
			<tr>
				<th id="birth_msg" class="msg">&nbsp;</th>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="m_email" />
			</tr>
			<tr>
				<th id="email_msg" class="msg">&nbsp;</th>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input name="m_phone" /></td>
			</tr>
			<tr>
				<th id="" class="msg">&nbsp;</th>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input name="m_zipcode" id="m_zipcode" />
					<button onclick="daumPostcode()">우편찾기</button></td>
			</tr>
			<tr>
				<th id="" class="msg">&nbsp;</th>
			</tr>
			<tr>
				<th>주소</th>
				<td><input name="m_address1" id="m_address1" /></td>
			</tr>
			<tr>
				<th id="" class="msg">&nbsp;</th>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input name="m_address2" id="m_address2" required /></td>
			</tr>
			<tr>
				<th id="" class="msg">&nbsp;</th>
			</tr>
			<tr>
				<th><input type="submit" value="회원가입" /></th>
			</tr>
		</table>
	</form>
</body>
</html>