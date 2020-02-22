<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>

<script type="text/javascript">


$(document).ready(function() {
	jQuery(".panel").hide();
	//content 클래스를 가진 div를 표시/숨김(토글)
	$(".flip").click(function() {
		$(".panel").not($(this).next(".panel").slideToggle(500)).slideUp();
	});
});


function bupdate(noticeid, nowPage){

	 var allData = { "noticeid": noticeid, "nowPage": nowPage};
	 $.ajax({
	       	url:"${pageContext.request.contextPath}/admin/update",
	        type:'GET',
	        data: allData,
	        success:function(data){
	        	$(".panel").html(data);
	        	$(".flip").hide();
	        } 
	    });
}

</script>




</script>
 <script type="text/javascript">
 

//  function loadDoc() {
//    var xhttp = new XMLHttpRequest();
//    xhttp.onreadystatechange = function() {
//      if (this.readyState == 4 && this.status == 200) {
//        document.getElementById("demo").innerHTML = this.responseText;
//      }
//    };
//    xhttp.open("GET", "../notice/list", true);
//    xhttp.send();
//  }
 
 
 
//  $(document).ready(function(){
	 
 
	 	function bdelete(noticeid){
		if(confirm("정말 삭제하시겠습니까?")){
		var url = "${pageContext.request.contextPath}/admin/delete";
		url+="?noticeid="+noticeid;
		url+="&col=${col}";
		url+="&word=${word}";
		url+="&nowPage=${nowPage}";
		location.href=url; // 이동하는 것 삭제누르는 순간 이동한다
		}
	}
 
	
</script>
<style type="text/css"> 
/* *{  */
/*   font-family: gulim;  */
/*   font-size: 20px;  */
/* }  */
.search{
	width: 80%;
	text-align: center;
	margin: 1px auto;
}
#t1{
text-align: center;
}

.table1{
table-layout:fixed;
word-break:break-all;
}

/*  table{   */
/*  width: 60%;  */
/*  margin: 0 auto;  */
/*  }  */
/*  tabla, th, td{ */
/*   	border: 0px solid black;  */
/*   	border-collapse: collapse;   */
/*   }   */
/*  th, td{  */
/*  	padding: px;  */
/*  	}  */
</style> 
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">


</head> 
<!-- *********************************************** -->
<body>

	<DIV>공지사항</DIV>
	<c:forEach items="${list}" var="dto">
		<div class="flip" id="t1">
			<table width="600" class="table1" id="table">
				<tr>
					<td style="text-align: left;">${dto.title} <c:if
							test="${util:newImg(fn:substring(dto.cdate,0,10)) }">
							<img src="${pageContext.request.contextPath}/images/new.gif">
						</c:if>
					</td>
					<td style="text-align: right; width: 70px;">관리자</td>
					<td style="text-align: right; width: 100px;">${fn:substring(dto.cdate,0, 10)}</td>
				</tr>
			</table>
		</div>


		<div class="panel">
			<TABLE width="600" class="table1">
				<TR>
					<TD colspan="3">${dto.content}

						<DIV class='bottom'>

							<c:if
								test="${not empty sessionScope.id && sessionScope.grade == 'A' }">
								<input type='button' value='수정'
									onclick="bupdate('${dto.noticeid}','${param.nowPage}')" />


								<input type='button' value='삭제'
									onclick="bdelete('${dto.noticeid}')">

							</c:if>
						</DIV>
					</TD>
				</TR>
			</TABLE>
		</div>
	</c:forEach>
<br>
<div style="text-align: center" class="flip">
<form method="post" action="./list">
 	<select name="col"><!-- 검색할 컬럼명 -->
 		<option value="title"
 		<c:if test="${col=='title'}">selected='selected'</c:if>
		>제목</option>
 		<option value="content"
 		<c:if test="${col=='content'}">selected='selected'</c:if>
 		>내용</option>
 		<option value="total">전체출력</option>
 	</select>
 	<input type="text" name="word" value="${word}"><!-- 검색어 -->
 	<input type="submit" value="검색">
 	<c:if test="${not empty sessionScope.id && sessionScope.grade=='A' }">
			<input type='button' value='등록'
				onclick="location.href='${pageContext.request.contextPath}/admin/create'">
		</c:if>
 	</form>


<div class="text-center">
	${paging }
</div>
</div>
<br><br><br>

</body>
<!-- *********************************************** -->

</html> 