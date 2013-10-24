
/*
 * this function is used to get day ahead (real time) chart data 
 */
function dayAhead(x,y){
	$.ajax({
		type : 'POST',
		contentType : "application/json",
		url : "dayahead?x=" + x + "&y=" + y,
		data : {
		},
		statusCode : {
			200 : function(msg, textStatus, jqXHR) {
				dayAheadhandler(msg, textStatus, jqXHR);
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
