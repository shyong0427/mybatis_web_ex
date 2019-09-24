<%@page import="pack.business.jikwonAllBean"%>
<%@page import="pack.business.JikwonBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="processDao" class="pack.business.ProcessDao" />

<%
	ArrayList<JikwonBean> list_jikwon = (ArrayList)processDao.selectdatajikwon();
	ArrayList<jikwonAllBean> list_jikwonAll = (ArrayList)processDao.selectgruopby();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyBatis_ex</title>
</head>
<body>
	** 직원 정보 (MyBatis) ** <p/>
	<table border="1">
		<tr><th>사번</th><th>이름</th><th>직급</th><th>성별</th><th>연봉</th></tr>
		<c:forEach var="jikwon" items="<%=list_jikwon %>">
			<tr>
				<td>${jikwon.jikwon_no }</td>
				<td>${jikwon.jikwon_name }</td>
				<td>${jikwon.jikwon_jik }</td>
				<td>${jikwon.jikwon_gen }</td>
				<td>${jikwon.jikwon_pay }</td>
			</tr>
		</c:forEach>
			<td colspan="5"> 인원 수 : <%=list_jikwon.size() %> </td>
	</table>
	<br><br>
	<table border="1">
		<tr><th>직급</th><th>인원수</th><th>연봉합</th><th>연봉평균</th></tr>
		<c:forEach var="jikwonall" items="<%=list_jikwonAll %>">
			<tr>
				<td>${jikwonall.jikwon_jik }</td>
				<td>${jikwonall.jik_count }</td>
				<td>${jikwonall.pay_sum }</td>
				<td>${jikwonall.pay_avg }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>