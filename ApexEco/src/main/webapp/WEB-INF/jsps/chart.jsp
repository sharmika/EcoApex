<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Apex - Ecotronyx</title>

<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/ajax_chart.js"></script>
<script type='text/javascript' src="js/date.js"></script>
<script type="text/javascript">
	/*
	 * this function is called through body onload to display chart  
	 */
	function show() {
		var yearMonth = gettingDate();
		$.ajax({
			type : 'POST',
			contentType : "application/json",
			url : "longterm?yearMonth=" + yearMonth,
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

	/*
	 * this function is used for getting year and month 
	 */
	function gettingDate() {
		var months = new Array(12);
		months[0] = "Jan";
		months[1] = "Feb";
		months[2] = "Mar";
		months[3] = "Apr";
		months[4] = "May";
		months[5] = "Jun";
		months[6] = "Jul";
		months[7] = "Aug";
		months[8] = "Sep";
		months[9] = "Oct";
		months[10] = "Nov";
		months[11] = "Dec";

		var current_date = new Date();
		month_value = current_date.getMonth();
		day_value = current_date.getDate();
		year_value = current_date.getFullYear();
		return year_value + "" + 6;
	}
	/*
	 * this handler function is used to retrieve Longterm chart data from ajax response
	 */

	function handler(msg, textStatus, jqXHR) {
		var status = jqXHR.status;
		if (status == 200) {
			document.getElementById('json').value = msg;
			$(function() {
				hedgedBoolValue = true;
				proposedBoolValue = true;
				scheduledBoolValue = true;
				availableBoolValue = true;

				var jsonVal = document.getElementById('json').value;
				var obj = JSON.parse(jsonVal);

				/*line data*/
				var lineObj = JSON.stringify(obj[0].lineChartData);
				var lineData = JSON.parse(lineObj);
				line = lineData;

				/*hedgedStackBarData*/
				var hedgedStackBarObj = JSON
						.stringify(obj[1].hedgedStackBarData);
				var hedgedStackbarData = JSON.parse(hedgedStackBarObj);
				hedgedStackBar = hedgedStackbarData;
				if (typeof (hedgedStackBar) == undefined
						|| hedgedStackBar == null) {
					hedgedBoolValue = false;
				}

				/*proposedStackBarData*/
				var proposedStackBarObj = JSON
						.stringify(obj[2].proposedStackBarData);
				var proposedStackbarData = JSON.parse(proposedStackBarObj);
				proposedStackBar = proposedStackbarData;
				if (typeof (proposedStackBar) == undefined
						|| proposedStackBar == null) {
					proposedBoolValue = false;
				}

				/*scheduledDemandStackBarData*/
				var scheduledDemandStackBarObj = JSON
						.stringify(obj[3].scheduledDemandStackBarData);
				var scheduledDemandStackbarData = JSON
						.parse(scheduledDemandStackBarObj);
				scheduledDemandStackBar = scheduledDemandStackbarData;
				if (typeof (scheduledDemandStackBar) == undefined
						|| scheduledDemandStackBar == null) {
					scheduledBoolValue = false;
				}

				/*availableDemandStackBarData*/
				var availableDemandStackBarObj = JSON
						.stringify(obj[4].availableDemandStackBarData);
				var availableDemandStackbarData = JSON
						.parse(availableDemandStackBarObj);
				availableDemandStackBar = availableDemandStackbarData;
				if (typeof (availableDemandStackBar) == undefined
						|| availableDemandStackBar == null) {
					availableBoolValue = false;
				}

				/*averages data*/
				var averagesObj = JSON.stringify(obj[5].averagesChartData);
				var averagesData = JSON.parse(averagesObj);
				averages = averagesData;

				/*ranges data*/
				var rangesObj = JSON.stringify(obj[6].rangesChartData);
				var rangesData = JSON.parse(rangesObj);
				ranges = rangesData;

				/*chart xAxis data*/
				var chartXaxis = JSON.stringify(obj[7].chartdata);

				/* chart data for no.of days in a month,weekends,holidays*/
				var dataObj = eval("(" + chartXaxis + ")");

				var noOfDays = dataObj["No.of.days"];

				var monthFirstValue = dataObj["monthFirstValue"];

				var monthLastValue = dataObj["monthLastValue"];

				var month = dataObj["month"];

				var year = dataObj["year"];

				var weekdaysList = JSON.stringify(dataObj.weekends);

				var weekDaysLength = JSON.parse(weekdaysList);

				/*first week end data*/
				var firstWeekList = JSON.stringify(dataObj.weekends[0]);
				firstWeekList = firstWeekList.substring(1,
						firstWeekList.length - 1);
				var firstWeekMinValue;
				var firstWeekMaxValue;
				var firstResult = firstWeekList.split(",");
				if (firstResult.length == 1) {
					for ( var i = 0; i < firstResult.length; i++) {
						firstWeekMinValue = firstResult[0];
						firstWeekMaxValue = firstResult[0];
					}
				} else {
					for ( var i = 0; i < firstResult.length; i++) {
						firstWeekMinValue = firstResult[0];
						firstWeekMaxValue = firstResult[1];
					}
				}

				/*second week end data*/

				var secondWeekList = JSON.stringify(dataObj.weekends[1]);
				secondWeekList = secondWeekList.substring(1,
						secondWeekList.length - 1);

				var secondWeekMinValue;
				var secondWeekMaxValue;
				var secondResult = secondWeekList.split(",");

				for ( var j = 0; j < secondResult.length; j++) {
					secondWeekMinValue = secondResult[0];
					secondWeekMaxValue = secondResult[1];
				}

				/*third week end data*/
				var thirdWeekList = JSON.stringify(dataObj.weekends[2]);
				thirdWeekList = thirdWeekList.substring(1,
						thirdWeekList.length - 1);

				var thirdWeekMinValue;
				var thirdWeekMaxValue;
				var thirdResult = thirdWeekList.split(",");
				for (i = 0; i < thirdResult.length; i++) {
					thirdWeekMinValue = thirdResult[0];
					thirdWeekMaxValue = thirdResult[1];
				}

				/*fourth week end data*/
				var fourthWeekList = JSON.stringify(dataObj.weekends[3]);
				fourthWeekList = fourthWeekList.substring(1,
						fourthWeekList.length - 1);

				var fourthWeekMinValue;
				var fourthWeekMaxValue;
				var fourthResult = fourthWeekList.split(",");

				for (i = 0; i < fourthResult.length; i++) {
					fourthWeekMinValue = fourthResult[0];
					fourthWeekMaxValue = fourthResult[1];
				}
				/*fifth week end data*/
				if (weekDaysLength.length > 4) {

					var fifthWeekList = JSON.stringify(dataObj.weekends[4]);
					fifthWeekList = fifthWeekList.substring(1,
							fifthWeekList.length - 1);
					var fifthWeekMinValue;
					var fifthWeekMaxValue;
					var fifthResult = fifthWeekList.split(",");

					for (i = 0; i < fifthResult.length; i++) {
						fifthWeekMinValue = fifthResult[0];
						fifthWeekMaxValue = fifthResult[1];
					}
				}
				/*preparing holidays list*/
				var holidaysList = JSON.stringify(dataObj.holidays[0]);
				holidaysList = holidaysList.substring(1,
						holidaysList.length - 1);
				var holidaysMinValue;
				var holidaysMaxValue;
				var Result = holidaysList.split(",");
				for (i = 0; i < Result.length; i++) {
					holidaysMinValue = Result[1];
					holidaysMaxValue = Result[2];
				}

				/*this is for adding 5th plot bands*/
				$('document')
						.ready(
								function() {
									var chart = $('#container').highcharts();
									if (weekDaysLength.length == 5) {
										//chart.xAxis[0].removePlotBand('fifthWeek');
										chart.xAxis[0]
												.addPlotBand({
													color : 'rgba(255,204,255,0.8)',
													from : fifthWeekMinValue,
													to : fifthWeekMaxValue,
													zIndex : 2,
													label : {
														style : {
															color : '#000',
															font : 'bold 12px Trebuchet MS, Verdana, sans-serif'
														},
														text : 'Weekend',
														rotation : 0,
														textAlign : 'center'
													},
													id : 'fifthWeek'
												});
									}
								});
				/* market Price data*/
				var marketpriceObj = JSON
						.stringify(obj[8].marketPriceChartData);
				var marketPriceData = JSON.parse(marketpriceObj);
				marketPrice = marketPriceData;

				/*
				 * Longterm Position chart designing starts from here
				 */
				$('#container')
						.highcharts(
								{
									chart : {
										width : 1700,
										backgroundColor : {
											linearGradient : {
												x1 : 0,
												y1 : 0,
												x2 : 1,
												y2 : 1
											},
											stops : [
													[ 0, 'rgb(255, 255, 255)' ],
													[ 1, 'rgb(240, 240, 255)' ] ]
										},
										borderWidth : 2,
										plotBackgroundColor : 'rgba(255, 255, 255, .9)',
										plotShadow : true,
										plotBorderWidth : 1,

									},
									title : {
										text : 'Position(LongTerm)',
										style : {
											fontWeight : 'bold',
											fontFamily : 'Verdana',
										},

									},
									subtitle : {
									//text : 'Source: WorldClimate.com'
									},
									legend : {
										title : {
											text : 'Legend'
										},
										layout : 'vertical',
										align : 'right',
										verticalAlign : 'top',
										y : 50,
										padding : 3,
										itemMarginTop : 5,
										itemMarginBottom : 5,
										itemStyle : {
											fontSize : '10px',
											fontFamily : 'Verdana',
										}
									},
									xAxis : [ {// Primary xAxis
										gridLineWidth : 1,
										title : {
											text : 'Day Of Month',
											style : {
												color : '#140718',
												fontWeight : 'bold',
												fontSize : '10px',
												fontFamily : 'Verdana',
											}
										},

										type : "datetime",
										dateTimeLabelFormats : {
											day : '%e',
										},
										tickInterval : 24 * 3600 * 1000,
										max : monthLastValue,

										plotBands : [ { // mark the Holiday
											color : 'rgba(255,204,153,0.8)',
											from : holidaysMinValue,
											to : holidaysMaxValue,
											zIndex : 3,
											label : {
												style : {
													color : '#000',
													fontWeight : 'bold',
													fontSize : '10px',
													fontFamily : 'Verdana',
												},
												text : 'Holiday',
												rotation : 0,
												textAlign : 'center'
											}
										}, { // mark the first weekend
											color : 'rgba(255,204,255,0.8)',
											from : firstWeekMinValue,
											to : firstWeekMaxValue,
											zIndex : 3,
											label : {
												style : {
													color : '#000',
													fontWeight : 'bold',
													fontSize : '10px',
													fontFamily : 'Verdana',
												},

												text : 'Weekend',
												rotation : 0,
												textAlign : 'center'
											}
										}, { // mark the second weekend
											color : 'rgba(255,204,255,0.8)',
											from : secondWeekMinValue,
											to : secondWeekMaxValue,
											zIndex : 3,
											label : {
												style : {
													color : '#000',
													fontWeight : 'bold',
													fontSize : '10px',
													fontFamily : 'Verdana',
												},

												text : 'Weekend',
												rotation : 0,
												textAlign : 'center'
											}
										}, { // mark the third weekend
											color : 'rgba(255,204,255,0.8)',
											from : thirdWeekMinValue,
											to : thirdWeekMaxValue,
											zIndex : 3,
											label : {
												style : {
													color : '#000',
													fontWeight : 'bold',
													fontSize : '10px',
													fontFamily : 'Verdana',
												},

												text : 'Weekend',
												rotation : 0,
												textAlign : 'center'
											}
										}, { // mark the fourth weekend
											color : 'rgba(255,204,255,0.8)',
											from : fourthWeekMinValue,
											to : fourthWeekMaxValue,
											zIndex : 3,
											label : {
												style : {
													color : '#000',
													fontWeight : 'bold',
													fontSize : '10px',
													fontFamily : 'Verdana',
												},

												text : 'Weekend',
												rotation : 0,
												textAlign : 'center'
											}
										} ]
									} ],
									yAxis : [ { // Primary yAxis

										gridLineWidth : 1,
										minorGridLineColor : '#F0F0F0',
										minorTickInterval : 'auto',
										labels : {
											format : '{value}',
											style : {
												color : '#140718'
											}
										},
										title : {
											text : 'Megawatts',
											style : {
												color : '#140718',
												fontWeight : 'bold',
												fontSize : '10px',
												fontFamily : 'Verdana',
											}
										},

										tickInterval : 500,
										style : {
											fontWeight : 'bold',
											fontSize : '10px',
											fontFamily : 'Verdana',
										},

									} ],

									/* Tooltip for the chart*/

									tooltip : {
										shared : true,
										formatter : function() {
											var s = Highcharts.dateFormat(
													'%A, %b %e,', this.x)
													+ '\t' + year;

											$
													.each(
															this.points,
															function(i, point) {
																if (point.series.name == 'Standard Deviations') {
																	s += '<br/>'
																			+ '<span style="color:'+point.series.color+'">'
																			+ point.series.name
																			+ '</span>: $<b>'
																			+ this.point.low
																			+ ' - $'
																			+ this.point.high
																			+ '</b>';
																} else {
																	s += '<br/>'
																			+ '<span style="color:'+point.series.color+'">'
																			+ point.series.name
																			+ '</span>: $<b>'
																			+ point.y
																			+ '</b>';
																}
															});

											return s;
										},

										style : {
											fontSize : '10px',
											fontFamily : 'Verdana',
										}
									},

									plotOptions : {
										series : {
											cursor : 'pointer',
											point : {
												events : {//onclick function for day ahead chart
													click : function() {
														dayAhead(this.x, this.y);
													}
												}
											}
										},
										/* Stock bar chart designing*/
										column : {
											borderColor : 'rgba(132,132,132,0.8)',
											shadow : false,
											states : {
												hover : {
													color : {
														linearGradient : [ 0,
																0, 0, 300 ],
														stops : [
																[ 0,
																		'rgb(255,255,255)' ],
																[ 1,
																		'rgb(159,49,49)' ] ]
													}
												}
											},
											stacking : 'normal',

										},
										/*Line design*/
										line : {
											lineWidth : 4,
											states : {
												hover : {
													lineWidth : 5
												}
											},
											marker : {
												enabled : false
											}
										},

									},
									series : [//data of  individual chart 

											{
												name : 'Standard Deviations',
												data : ranges,
												type : 'arearange',
												lineWidth : 0,
												color : 'rgba(135,206,250,0.8)',

											},
											{
												type : 'column',
												name : 'Available Demand Response ',
												showInLegend : availableBoolValue,
												data : availableDemandStackBar,
												color : 'rgba(132,132,132,0.8)',
												pointWidth : 35,
												cursor : 'pointer',

											},
											{
												type : 'column',
												name : 'Scheduled Demand Response ',
												showInLegend : scheduledBoolValue,
												data : scheduledDemandStackBar,
												color : 'rgba(45,45,45,0.8)',
												pointWidth : 35,
												cursor : 'pointer',

											},
											{
												type : 'column',
												name : 'Proposed Position ',
												showInLegend : proposedBoolValue,
												data : proposedStackBar,
												color : 'rgba(134, 153, 75,0.8)',
												pointWidth : 35,
												cursor : 'pointer',
											},
											{
												type : 'column',
												name : 'Hedged Position ',
												showInLegend : hedgedBoolValue,
												data : hedgedStackBar,
												color : 'rgba(90, 102, 50,0.8)',
												pointWidth : 35,
												cursor : 'pointer',

											},

											{
												type : 'line',
												name : 'Normalized Target',
												data : averages,
												color : 'rgba(41,8,138,0.8)',
												lineWidth : 1,
												zIndex : 1,
												marker : {
													fillColor : 'white',
													lineWidth : 2,
													lineColor : Highcharts
															.getOptions().colors[0]
												},
											},
											{
												type : 'line',
												name : 'Backcast',
												data : line,
												lineWidth : 1,
												color : 'rgba(128,0,0,0.8)',

											},
											{
												name : 'Market Price',
												data : marketPrice,
												color : 'rgba(90, 102, 50,0.8)',
												lineColor : 'transperent',
												marker : {
													lineWidth : 1,
													lineColor : 'transperent',
													enabled : false,
													radius : 0,
												},
												dataLabels : {
													enabled : true,
													formatter : function(
															marketPrice) {
														return '$ ' + this.y;
													},
													style : {
														color : '#333',
														fontWeight : 'bold',
														fontSize : '10px',
														fontFamily : 'bold Verdana',
													}
												}
											} ]

								});

			});
		} else {
			alert('Something went wrong...');
		}
	}
</script>



<script>
	/*
	 * this handler function is used to retrieve the day ahead chart data from ajax resonse
	 */
	function dayAheadhandler(msg, textStatus, jqXHR) {
		var status = jqXHR.status;
		if (status == 200) {
			document.getElementById('json').value = msg;

			$(function() {
				var jsonVal = document.getElementById('json').value;
				var obj = JSON.parse(jsonVal);

				/*line data*/
				var lineObj = JSON.stringify(obj[0].lineChartData);
				var lineData = JSON.parse(lineObj);
				line = lineData;

				/*stack1 data*/
				var stack1Obj = JSON.stringify(obj[1].Position1ChartData);
				var stack1Data = JSON.parse(stack1Obj);
				Stack1 = stack1Data;

				/*stack2 data*/
				var stack2Obj = JSON.stringify(obj[2].Position2ChartData);
				var stack2Data = JSON.parse(stack2Obj);
				Stack2 = stack2Data;

				/*averages data*/
				var averagesObj = JSON.stringify(obj[3].averagesChartData);
				var averagesData = JSON.parse(averagesObj);
				averages = averagesData;

				/*ranges data*/
				var rangesObj = JSON.stringify(obj[4].rangesChartData);
				var rangesData = JSON.parse(rangesObj);
				ranges = rangesData;

				/*display date data*/
				var dayFirstHourValueObj = JSON
						.stringify(obj[5].dayFirstHourValue);
				var FirstHour = eval("(" + dayFirstHourValueObj + ")");
				var dayFirstHour = FirstHour.dayFirstHourValue;
				var date = new Date(Number(dayFirstHour));

				var displayDate = 'Position( ' + date.toString("MMM dd")
						+ ' / RealTime )';

				/*
				 * Day ahead Chart designing starts from here
				 */
				$('#container')
						.highcharts(
								{
									chart : {
										backgroundColor : {
											linearGradient : {
												x1 : 0,
												y1 : 0,
												x2 : 1,
												y2 : 1
											},
											stops : [
													[ 0, 'rgb(255, 255, 255)' ],
													[ 1, 'rgb(240, 240, 255)' ] ]
										},
										borderWidth : 2,
										plotBackgroundColor : 'rgba(255, 255, 255, .9)',
										plotShadow : true,
										plotBorderWidth : 1

									},
									title : {
										text : displayDate,
										style : {
											fontSize : '10px',
											fontFamily : 'Verdana',
											fontWeight:'bold',
										},
									},
									subtitle : {
									//text : 'Source: WorldClimate.com'
									},
									legend : {//displaying legend
										title : {
											text : 'Legend'
										},
										layout : 'vertical',
										align : 'right',
										verticalAlign : 'top',
										y : 50,
										padding : 3,
										itemMarginTop : 5,
										itemMarginBottom : 5,
										itemStyle : {
											lineHeight : '14px'
										},
										style : {
											fontSize : '10px',
											
											fontFamily : 'Verdana',
										},
									},
									xAxis : {// Primary xAxis
										gridLineWidth : 1,
										lineColor : '#000',
										tickColor : '#000',
										title : {
											text : 'Hourly Interval',
											style : {
												color : '#140718',
												fontSize : '10px',
												fontFamily : 'Verdana',
											}
										},
										type : 'datetime',
										tickInterval : 3600 * 1000

									},

									yAxis : [ { // Primary yAxis
										gridLineWidth : 1,
										minorGridLineColor : '#F0F0F0',
										minorTickInterval : 'auto',
										lineColor : '#000',
										lineWidth : 1,
										tickColor : '#000',
										labels : {
											format : '{value}',
											style : {
												color : '#140718',
												}
										},
										title : {
											text : 'Megawatts',
											style : {
												color : '#140718',
												fontSize : '10px',
												fontFamily : 'Verdana',
											}
										},
										min : 50,
										max : 450,
										tickInterval : 50
									} ],

									tooltip : {//displaying tooltip
										shared : true,
										valuePrefix : '$',
										style : {
											fontSize : '10px',
											fontFamily : 'Verdana',
										},
									},
									plotOptions : {
										column : {
											stacking : 'normal',
										},
										line : {
											lineWidth : 4,
											states : {
												hover : {
													lineWidth : 5
												}
											},
											marker : {
												enabled : false
											}
										},

									},
									series : [// data of individual chart
											{
												name : 'Standard Deviation',
												data : ranges,
												type : 'arearange',
												lineWidth : 0,
												color : 'rgba(135,206,250,0.8)',
											},
											{
												type : 'column',
												name : 'Proposed RT Position',
												data : Stack1,
												color : 'rgba(134, 153, 75,0.8)',
												pointWidth : 27,
												cursor : 'pointer',
											},
											{
												type : 'line',
												name : 'Normalized Target',
												color : 'rgba(41,8,138,0.8)',
												data : averages,
												lineWidth : 1,
												zIndex : 1,
												marker : {
													fillColor : 'white',
													lineWidth : 2,
													lineColor : Highcharts
															.getOptions().colors[0]
												}

											}, {
												type : 'line',
												name : 'Back Cast',
												data : line,
												lineWidth : 1,
												color : 'maroon',

											} ]
								});

			});
		} else {
			alert('Something went wrong...');
		}
	}
</script>

</head>
<body onload="show()">
	<%-- <jsp:include page="header.jsp" /> --%>
	<input type="hidden" id="json" />
	<script src="js/highcharts.js"></script>
	<script src="js/highcharts-more.js"></script>
	<script src="js/exporting.js"></script>
	<div id="container"
		style="min-width: 310px; height: 400px; margin: 0 auto"></div>

</body>
</html>