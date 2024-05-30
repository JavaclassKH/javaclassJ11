<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<!DOCTYPE html>
<html lang="ko">
<head>	
<title>test1.jsp</title>
<script>
	'use strict';
	
	function test() {
		let readonlyTest = textForm.readonly.value;
		let disabledTest = textForm.disabled.value;
		
		alert("readonlyTest = " + readonlyTest);
		alert("disabledTest = " + disabledTest);
	}
	
	
</script>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp" %>
<p><br/></p>
<div class="container">
	<form name="textForm">
		<div>
			<input type="text" name="readonly" value="readonly" class="form-control" readonly />
		</div><br/>
		<div>
			<input type="text" name="disabled" value="disabled" class="form-control" disabled />
		</div><br/>
		<div>
			<input type="button" value="전송" onclick="test()" class="btn btn-success form-control" />
		</div>
	</form>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>