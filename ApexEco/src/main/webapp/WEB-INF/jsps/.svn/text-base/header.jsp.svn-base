<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Apex - Ecotronyx</title>
<script type="text/javascript">
function display()
{
	var selectedYearMonth=document.getElementById("yearMonth").value;
	
	$.ajax({
		type : 'POST',
		contentType : "application/json",
		url : "longterm?yearMonth=" + selectedYearMonth,
		data : {
		//yearMonth : yearMonth
		},
		statusCode : {
			200 : function(msg, textStatus, jqXHR) {
				handler(msg, textStatus, jqXHR);
			},
			400 : function() {
				alert('400 status code! user error');
			},
			500 : function() {
				alert('500 status code! server error');
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			AjaxError(XMLHttpRequest, textStatus, errorThrown);
		}
	});
}

</script>
</head>
<body>
<section>
<hr align="center">
<table border="0">
<tr>
<td>

<table border="1">
<th>View Selections</th>
	<tr><td>*<u><b>Year-Month</b></u><br/>
	<form>
	<select name="yearMonth" id="yearMonth" onchange="display();">
	<c:if test="${(fn:length(yearMonthList))>0}">
	<c:forEach var="yearMonth" items="${yearMonthList}">
		<option value="${yearMonth.year}">${yearMonth.yearMonth}</option>
 	</c:forEach>
 	</c:if>
</select>
</form>
</td>

<td>*<u><b>Zone</b></u><br/>
<SELECT>
<OPTION>All</OPTION>
<OPTION value="1">2013-Jan</OPTION>
<OPTION>2013-Feb</OPTION>
<OPTION>2013-Mar</OPTION>
</SELECT></td>
<td>

*<u><b>Customer-Type</b></u><br/>
<SELECT>
<OPTION>All</OPTION>
<OPTION>Residential</OPTION>
<OPTION>Commercial</OPTION>
</SELECT></td>
<td>

*<u><b>Contract-Type</b></u><br/>
<SELECT>
<OPTION>All</OPTION>
<OPTION>Moth-to-Moth</OPTION>
<OPTION>Fixed</OPTION>
</SELECT></td>
<td>

*<u><b>Demand</b></u><br/>
<SELECT>
<OPTION>All</OPTION>
<OPTION>off-Peak Hours</OPTION>
<OPTION>Peak Hours</OPTION>
</SELECT></td>
</tr>
<tr></tr><tr></tr>
</table>&nbsp;&nbsp;
</td>
<td>
<table border="1">
<th> Generate Order</th><th><input type="submit" alt="right" value="Generate Order Details"></th>
		<tr>
		<td>*<u><b>Supplier - Agreement</b></u><br/>
<SELECT>
<OPTION>Constellation Energy- 01/01/2012</OPTION>
</SELECT></td>
<td>

*<u><b>Purchase-Order</b></u><br/>
<SELECT>
<OPTION>New Order</OPTION>
<OPTION>Add to Order #11 </OPTION>
<OPTION>Add to Order #12 </OPTION>
<OPTION>Add to Order #13 </OPTION>
</SELECT></td>
<td>

*<u><b>Hedge</b></u><br/>
<SELECT>
<OPTION>As Agreed</OPTION>
<OPTION>100%</OPTION>
<OPTION>90%</OPTION>
</SELECT></td>
</tr>
</table>
	</td>
	</tr>
	
	</table>
	<hr align="cemter">
</section>
</body>
</html>