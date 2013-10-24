package com.apex.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.JSONValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.apex.model.AreaRange;
import com.apex.model.Chart;
import com.apex.model.YearMonth;

/**
 * Class provides complete Long Term Position chart details
 * 
 * @author mahesh
 * @version 1.0
 */

@Component
public class ApexUtility {
	/*
	 * creating logger object ApexUtility class
	 */
	static Logger logger = LoggerFactory.getLogger(ApexUtility.class);

	/**
	 * method for getting chart details to display longTerm position chart
	 * 
	 * @param yearMonth
	 *            Passing year and month
	 * @return JSon string
	 * @throws JSONException
	 */

	public String getChartDetailsFromJson(String yearMonth) {

		/* lineMap object for placing line chart JSON object */
		Map<String, Object> lineMap = new HashMap<String, Object>();

		/*
		 * hedged,proposed,scheduled,available StackBarMap objects for placing
		 * respective bar chart JSON objects
		 */
		Map<String, Object> hedgedStackBarMap = new HashMap<String, Object>();
		Map<String, Object> proposedStackBarMap = new HashMap<String, Object>();
		Map<String, Object> scheduledDemandStackBarMap = new HashMap<String, Object>();
		Map<String, Object> availableDemandStackBarMap = new HashMap<String, Object>();

		/*
		 * averagesMap,rangesMap objects for placing Area Range chart JSON
		 * objects
		 */
		Map<String, Object> averagesMap = new HashMap<String, Object>();
		Map<String, Object> rangesMap = new HashMap<String, Object>();

		/* marketPriceMap object for placing Market price values JSON object */
		Map<String, Object> marketPriceMap = new HashMap<String, Object>();

		Long monthFirstValue = 0l;
		Long monthLastValue = 0l;
		int daysInMonth;

		/* declaring line JSON array objects */
		JSONObject lineObj;
		JSONArray lineJson = null;

		/* declaring firstStackBar JSON objects */
		JSONObject hedgedStackBarObj;
		JSONArray hedgedStackBarJson = null;

		/* declaring proposedStackBar JSON objects */
		JSONObject proposedStackBarObj;
		JSONArray proposedStackBarJson = null;

		/* declaring scheduledDemandStackBar JSON objects */
		JSONObject scheduledDemandStackBarObj;
		JSONArray scheduledDemandStackBarJson = null;

		/* declaring availableDemandStackBar JSON objects */
		JSONObject availableDemandStackBarObj;
		JSONArray availableDemandStackBarJson = null;

		/* declaring averages JSON objects */
		JSONObject averagesObj;
		JSONArray averagesJson = null;

		/* declaring ranges JSON objects */
		JSONObject rangesObj;
		JSONArray rangesJson = null;

		/* declaring chart weekEnds and holidays JSON Object */
		JSONObject chartData = null;
		JSONObject info = null;

		/* declaring MarketPrice JSON Object */
		JSONObject marketPriceObj;
		JSONArray marketPriceJson = null;

		/* Preparing line data */
		Double[] lineArray = new Double[] { 6732.0, 6424.5, 6155.4, 6300.2,
				6458.2, 6545.5, 6323.8, 6279.1, 6709.2, 6648.8, 6745.2, 6727.3,
				6793.4, 6852.2, 6666.0, 5996.4, 5100.0, 5600.0, 6155.4, 6162.3,
				6557.7, 6650.0, 6677.8, 6749.4, 6763.5, 6762.1, 6794.2, 6860.7,
				6741.3, 6835.2, 6829.0 };
		/* Preparing hedgedStackBar data */
		Double[] hedgedStackBarArray = new Double[] { 1538.85, 1538.85,
				1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85,
				1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85,
				1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85,
				1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85,
				1538.85 };
		/* Preparing proposedStackBar data */
		Double[] proposedStackBarArray = new Double[] { 738.85, 738.85, 938.85,
				938.85, 1938.85, 1938.85, 2138.85, 2138.85, 1938.85, 1938.85,
				1538.85, 1538.85, 938.85, 938.85, 738.85, 738.85, 1538.85,
				1538.85, 1238.85, 1238.85, 1338.85, 1438.85, 1538.85, 1938.85,
				2238.85, 2238.85, 1938.85, 1838.85, 1738.85, 2038.85, 2138.85 };
		/* Preparing scheduledDemandStackBar data */
		Double[] scheduledDemandStackBarArray = new Double[] { 1538.85,
				1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85,
				1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85,
				1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85,
				1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85,
				1538.85, 1538.85 };
		/* Preparing availableDemandStackBar data */
		Double[] availableDemandStackBarArray = new Double[] { 1538.85,
				1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85,
				1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85,
				1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85,
				1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85, 1538.85,
				1538.85, 1538.85 };
		/* Preparing averages data */
		Double[] averagesArray = new Double[] { 5454.3, 5479.3, 5413.3, 5502.0,
				5535.3, 5577.6, 5520.2, 5536.6, 5665.5, 5695.7, 5723.8, 5784.7,
				5804.8, 5604.5, 5704.5, 5661.3, 5668.8, 5712.9, 5732.4, 5755.3,
				5783.3, 5814.8, 5752.3, 5742.6, 5732.5, 5750.5, 5799.4, 5767.9,
				5814.9, 5891.0, 5884.9 };
		/* Preparing area range data */
		Double[] firstAreaRange = new Double[] { 4581.7, 4579.1, 4407.1,
				4453.6, 4591.8, 4591.8, 4548.7, 4552.0, 4737.6, 4779.7, 4808.2,
				4928.4, 4928.4, 4915.9, 4805.6, 4748.0, 4701.5, 4727.7, 4796.3,
				4796.3, 4879.4, 4965.4, 4843.7, 4877.8, 4863.6, 4870.7, 4957.7,
				4957.7, 4906.1, 4986.9, 5044.8 };
		Double[] secondAreaRange = new Double[] { 6326.2, 6379.4, 6419.5,
				6550.4, 6563.4, 6563.4, 6492.5, 6521.3, 6593.6, 6611.8, 6560.8,
				6640.9, 6640.9, 6693.6, 6603.4, 6574.7, 6636.1, 6698.0, 6698.3,
				6714.3, 6687.3, 6664.3, 6661.5, 6647.4, 6615.4, 6626.5, 6641.2,
				6641.2, 6629.6, 6642.8, 6725.0 };
		/* Preparing Market Price data */
		Double[] marketPriceArray = new Double[] { 45.86, 45.86, 46.23, 46.23,
				55.25, 55.25, 57.44, 57.44, 55.25, 55.25, 50.68, 50.68, 46.23,
				46.23, 45.86, 45.86, 50.68, 50.68, 47.98, 47.98, 48.20, 48.98,
				50.68, 55.25, 58.21, 58.26, 55.25, 54.72, 52.34, 56.53, 57.47 };

		/* splitting year and month values */
		String year = yearMonth.substring(0, 4);
		String month = yearMonth.substring(4);
		int yearNum = Integer.parseInt(year);
		int monthNum = Integer.parseInt(month);

		/* To Find out Number Of Days in a month. */
		if (monthNum == 3 || monthNum == 5 || monthNum == 8 || monthNum == 10) {
			daysInMonth = 30;
		} else if (monthNum == 1) {
			daysInMonth = (yearNum % 400 == 0)
					|| ((yearNum % 100) != 0 && (yearNum % 4 == 0)) ? 29 : 28;
		} else {
			daysInMonth = 31;
		}
		/* x-axis array with Number Of Days based on month. */
		Long xArray[] = new Long[daysInMonth];

		/* Converting date into milliseconds to display on X-Axis. */
		for (int day = 1, j = 0; day <= daysInMonth; day++, j++) {

			@SuppressWarnings("deprecation")
			Long dateInMilliSeconds = Date.UTC(yearNum, monthNum, day, 0, 0, 0);
			if (day == 1) {
				monthFirstValue = dateInMilliSeconds;
			} else if (day == daysInMonth) {
				monthLastValue = dateInMilliSeconds;
			}
			xArray[j] = dateInMilliSeconds;
		}

		/*
		 * Calling getWeekDaysInAMonth()for getting weekEnds list in a month.
		 */
		List<Object> weekEndList = getWeekDaysInAMonth(yearNum, monthNum);

		/* Preparing weekEnds list and holidays in a month to display on chart */
		String chartXaxisData = "{\"chartdata\":{\"weekends\":"
				+ weekEndList.toString()
				+ ",\"holidays\":[[1,61330953600000,61331040000000]],\"monthFirstValue\":\""
				+ monthFirstValue + "\",\"monthLastValue\":\"" + monthLastValue
				+ "\",\"month\":\"" + monthNum + "\",\"year\":\"" + yearNum
				+ "\",\"No.of.days\":\"" + daysInMonth + "\"}}";

		/*
		 * calling getChartData() and that returns Line data in the form of
		 * array contains [x-array,line data]
		 */
		String lineData = ApexUtility.getChartData(xArray, lineArray,
				"lineValue");

		/*
		 * calling getChartData() and that returns hedgedStackBar data in the
		 * form of array contains [x-array,hedgedStackBardata]
		 */
		String hedgedStackBar = ApexUtility.getChartData(xArray,
				hedgedStackBarArray, "hedgedStackBar");
		/*
		 * calling getChartData() and that returns proposedStackBar data in the
		 * form of array contains [x-array,proposedStackBardata]
		 */
		String proposedStackBar = ApexUtility.getChartData(xArray,
				proposedStackBarArray, "proposedStackBar");
		/*
		 * calling getChartData() and that returns scheduledDemandStackBar data
		 * in the form of array contains [x-array,scheduledDemandStackBardata]
		 */
		String scheduledDemandStackBar = ApexUtility.getChartData(xArray,
				scheduledDemandStackBarArray, "scheduledDemandStackBar");
		/*
		 * calling getChartData() and that returns scheduledDemandStackBar data
		 * in the form of array contains [x-array,availableDemandStackBarData]
		 */
		String availableDemandStackBar = ApexUtility.getChartData(xArray,
				availableDemandStackBarArray, "availableDemandStackBar");

		/*
		 * calling getChartData() and that returns averages data in the form of
		 * array contains [x-array,averagesData]
		 */
		String averages = ApexUtility.getChartData(xArray, averagesArray,
				"averages");

		/*
		 * calling getAreaRangeChartData() and that returns ranges data in the
		 * form of array contains [x-array,rangesData]
		 */
		String ranges = ApexUtility.getAreaRangeChartData(xArray,
				firstAreaRange, secondAreaRange, "ranges");

		/*
		 * Calling getChartData() and that returns MarketPrice data in the form
		 * of array contains [x-array,marketPricedata]
		 */
		String marketPriceData = ApexUtility.getChartData(xArray,
				marketPriceArray, "marketPrice");

		/* preparing line JSON array */
		try {
			lineObj = new JSONObject(lineData);
			lineJson = lineObj.getJSONArray("lineValue");

		} catch (JSONException e) {
			logger.error("error occured while getting line json object", e);
		}
		/* preparing firstStackBar JSON array */
		try {
			hedgedStackBarObj = new JSONObject(hedgedStackBar);
			hedgedStackBarJson = hedgedStackBarObj
					.getJSONArray("hedgedStackBar");
		} catch (JSONException e) {
			logger.error(
					"error occured while getting hedgedStackBarJson stack bar json object",
					e);
		}
		/* preparing proposedStackBar JSON array */
		try {
			proposedStackBarObj = new JSONObject(proposedStackBar);
			proposedStackBarJson = proposedStackBarObj
					.getJSONArray("proposedStackBar");
		} catch (JSONException e) {
			logger.error(
					"error occured while getting proposedStackBar stack bar json object",
					e);
		}
		/* preparing scheduledDemandStackBar JSON array */
		try {
			scheduledDemandStackBarObj = new JSONObject(scheduledDemandStackBar);
			scheduledDemandStackBarJson = scheduledDemandStackBarObj
					.getJSONArray("scheduledDemandStackBar");
		} catch (JSONException e) {
			logger.error(
					"error occured while getting scheduledDemandStackBar stack bar json object",
					e);
		}
		/* preparing availableDemandStackBar JSON array */
		try {
			availableDemandStackBarObj = new JSONObject(availableDemandStackBar);
			availableDemandStackBarJson = availableDemandStackBarObj
					.getJSONArray("availableDemandStackBar");
		} catch (JSONException e) {
			logger.error(
					"error occured while getting availableDemandStackBar stack bar json object",
					e);
		}

		/* preparing averages JSON array */
		try {
			averagesObj = new JSONObject(averages);
			averagesJson = averagesObj.getJSONArray("averages");
		} catch (JSONException e) {
			logger.error("error occured while getting averages json object", e);
		}
		/* preparing ranges JSON array */
		try {
			rangesObj = new JSONObject(ranges);
			rangesJson = rangesObj.getJSONArray("ranges");

		} catch (JSONException e) {
			logger.info("error occured while getting range json object"
					+ e.getMessage());
		}
		/* preparing chart weekEnds and holidays JSON Object */
		try {
			chartData = new JSONObject(chartXaxisData);
			info = chartData.getJSONObject("chartdata");

		} catch (JSONException e) {
			logger.error("error occured while getting chartXaxisData", e);
		}
		/* Preparing MarketPrice JSON array */
		try {
			marketPriceObj = new JSONObject(marketPriceData);
			marketPriceJson = marketPriceObj.getJSONArray("marketPrice");

		} catch (JSONException e) {
			logger.info("error occured while getting marketPrice json object"
					+ e);
		}

		/*
		 * Keeping all JSON arrays into individual maps
		 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("chartdata", info);
		lineMap.put("lineChartData", lineJson);
		hedgedStackBarMap.put("hedgedStackBarData", hedgedStackBarJson);
		proposedStackBarMap.put("proposedStackBarData", proposedStackBarJson);
		scheduledDemandStackBarMap.put("scheduledDemandStackBarData",
				scheduledDemandStackBarJson);
		availableDemandStackBarMap.put("availableDemandStackBarData",
				availableDemandStackBarJson);
		averagesMap.put("averagesChartData", averagesJson);
		rangesMap.put("rangesChartData", rangesJson);
		marketPriceMap.put("marketPriceChartData", marketPriceJson);

		/*
		 * adding individual JSON arrays to one list and finally converting into
		 * JSON String
		 */
		LinkedList<Map<String, Object>> chartList = new LinkedList<Map<String, Object>>();
		chartList.add(lineMap);
		chartList.add(hedgedStackBarMap);
		chartList.add(proposedStackBarMap);
		chartList.add(scheduledDemandStackBarMap);
		chartList.add(availableDemandStackBarMap);
		chartList.add(averagesMap);
		chartList.add(rangesMap);
		chartList.add(map);
		chartList.add(marketPriceMap);

		/* preparing chart data in the form of string(JSON string format). */
		String jsonString = JSONValue.toJSONString(chartList);
		return jsonString;
	}

	/**
	 * Method for Preparing Chart data(Other than area chart) in the form of
	 * array.
	 * 
	 * @param xArray
	 *            passing chart xArray values
	 * @param yArray
	 *            yArray passing chart yAxis values
	 * @param chartName
	 *            chartName for displaying chart
	 * @return
	 */

	private static String getChartData(Long[] xArray, Double[] yArray,
			String chartName) {
		List<Chart> chartData = new ArrayList<Chart>();
		List<Object> data = new ArrayList<Object>();
		/*
		 * keeping x and y array values in chart list and xInc variable for
		 * xAxis increment value and yInc for yAxis increment value.
		 */
		for (int xInc = 0, yInc = 0; xInc < xArray.length; xInc++, yInc++) {
			Chart chartValues = new Chart();
			chartValues.setxCor(xArray[xInc]);
			chartValues.setyCor(yArray[yInc]);
			chartData.add(chartValues);
		}
		/* preparing chart data in the form of array. */
		Iterator<Chart> itr = chartData.iterator();
		while (itr.hasNext()) {
			Chart line = itr.next();
			List<Object> cData = new ArrayList<Object>();
			cData.add(line.getxCor().toString());
			cData.add(line.getyCor());
			data.add(cData);
		}
		/* preparing chart data in the form of string(JSON string format). */
		String listValue = "{\"" + chartName + "\":" + data.toString() + "}";
		return listValue;
	}

	/**
	 * Method for Preparing AreaRange Chart data in the form of array.
	 * 
	 * @param xArray
	 *            passing chart xArray values
	 * @param yRange1
	 *            passing chart yAxis range values
	 * @param yRange2
	 *            passing chart yAxis range values
	 * @param chartName
	 *            chartName for displaying chart.
	 * @return chart data in the form of string.
	 */
	private static String getAreaRangeChartData(Long[] xArray,
			Double[] yRange1, Double[] yRange2, String chartName) {
		List<Object> areaRangeChartData = new ArrayList<Object>();
		List<AreaRange> chartData = new ArrayList<AreaRange>();
		/*
		 * Keeping x and y array values in AreaRange list and xInc variable for
		 * x-axis increment and yFirstRangeInc,ySecRangeInc for yAxis range
		 * values
		 */
		for (int xInc = 0, yFirstRangeInc = 0, ySecRangeInc = 0; xInc < xArray.length; xInc++, yFirstRangeInc++, ySecRangeInc++) {
			AreaRange areaRange = new AreaRange();
			areaRange.setxCor(xArray[xInc]);
			areaRange.setyCor1(yRange1[yFirstRangeInc]);
			areaRange.setyCor2(yRange2[ySecRangeInc]);
			chartData.add(areaRange);
		}
		/* preparing areaRange chart data in the form of array. */
		Iterator<AreaRange> itr = chartData.iterator();
		while (itr.hasNext()) {
			AreaRange range = itr.next();
			List<Object> cData = new ArrayList<Object>();
			cData.add(range.getxCor().toString());
			cData.add(range.getyCor1());
			cData.add(range.getyCor2());
			areaRangeChartData.add(cData);
		}
		/* preparing chart data in the form of string(JSON string format). */
		String listValue = "{\"" + chartName + "\":"
				+ areaRangeChartData.toString() + "}";
		return listValue;
	}

	/**
	 * Method for getting month weekDays list
	 * 
	 * @param year
	 *            passing year
	 * @param month
	 *            passing month based on selection from chart.
	 * @return month weekDays list
	 */
	@SuppressWarnings("deprecation")
	private List<Object> getWeekDaysInAMonth(Integer year, Integer month) {
		Calendar cal = new GregorianCalendar(year, month, 1);
		int increamentValue = 0;
		int daysCountInMonth = 0;
		int beforeDay = 0;
		long dateInMilliSeconds = 0l;
		List<Object> weekEndList = new ArrayList<Object>();
		List<Object> weekEnd = new ArrayList<Object>();
		do {
			daysCountInMonth++;
			/* get the day of the week for the current day */
			int day = cal.get(Calendar.DAY_OF_WEEK);
			/* check if it is a Saturday or Sunday */
			if (day == Calendar.SATURDAY || day == Calendar.SUNDAY) {
				increamentValue++;
				/*
				 * Assigning daysCount to beforeday for generating date in
				 * milliseconds
				 */
				beforeDay = daysCountInMonth;
				/* if month starts Sunday(i.e. first day) */
				if (daysCountInMonth == 1 && increamentValue == 1) {
					if (day != 7) {
						/* month starts with other than Saturday */
						dateInMilliSeconds = Date.UTC(year, month, 1, 0, 0, 0);
						weekEnd.add(dateInMilliSeconds);
						dateInMilliSeconds = Date.UTC(year, month, 2, 0, 0, 0);
						weekEnd.add(dateInMilliSeconds);
						weekEndList.add(weekEnd);
						increamentValue = 0;
						weekEnd = new ArrayList<Object>();
					} else {
						/* if month starts with Saturday */
						dateInMilliSeconds = Date.UTC(year, month, 0, 0, 0, 0);
						weekEnd.add(dateInMilliSeconds);
					}
				} else {
					/*
					 * converting week days values in milliseconds and storing
					 * into list.
					 */
					if (increamentValue == 1) {
						dateInMilliSeconds = Date.UTC(year, month, --beforeDay,
								0, 0, 0);
					} else {
						dateInMilliSeconds = Date.UTC(year, month,
								daysCountInMonth, 0, 0, 0);
					}
					weekEnd.add(dateInMilliSeconds);
					if (increamentValue == 2) {
						/* preparing week days list. */
						weekEndList.add(weekEnd);
						increamentValue = 0;
						weekEnd = new ArrayList<Object>();
					} else if (increamentValue == 1 && (daysCountInMonth == 31)) {
						/* If Month ends with 31 days. */
						dateInMilliSeconds = Date.UTC(year, month,
								daysCountInMonth, 0, 0, 0);
						weekEnd.add(dateInMilliSeconds);
						weekEndList.add(weekEnd);
					} else if (increamentValue == 1 && (daysCountInMonth == 30)
							&& weekEnd != null && weekEnd.size() == 1) {
						/* If Month ends with 30 days. */
						dateInMilliSeconds = Date.UTC(year, month,
								++daysCountInMonth, 0, 0, 0);
						weekEnd.add(dateInMilliSeconds);
						weekEndList.add(weekEnd);
						break;
					}
				}
			}
			/* advance to the next day */
			cal.add(Calendar.DAY_OF_YEAR, 1);
		} while (cal.get(Calendar.MONTH) == month);
		/* stop when we reach the start of the next month */
		return weekEndList;
	}

	/**
	 * Method for getting Year-Month list
	 * 
	 * @param yearMonth
	 *            passing yearMonth
	 * 
	 * @return Year-Month list
	 */
	public static List<YearMonth> getYearMonths(String yearMonth) {
		String year = yearMonth.substring(0, 4);
		int yearNum = Integer.parseInt(year);
		List<YearMonth> yearMonthList = new ArrayList<YearMonth>();
		Calendar cal = Calendar.getInstance();
		int presentMonth = cal.get(Calendar.MONTH);
		try {
			/* Displaying 10 years and their months (i.e,2013-jan...2000-jan) */
			for (int yearIncreament = 0; yearIncreament < 10; yearIncreament++) {
				/* Displaying present month on top */
				if (yearIncreament == 0) {
					for (int monthInc = presentMonth; monthInc >= 1; monthInc--) {
						YearMonth ym = new YearMonth();
						String monthCode = getMonthCode(monthInc);
						ym.setYearMonth(yearNum + "-" + monthCode);
						ym.setYear(yearNum + "" + monthInc);
						yearMonthList.add(ym);
					}
				} else {/* else for displaying other than first year */
					for (int monthIncreament = 11; monthIncreament >= 0; monthIncreament--) {
						YearMonth ym = new YearMonth();
						String monthCode = getMonthCode(monthIncreament);
						ym.setYearMonth(yearNum + "-" + monthCode);
						ym.setYear(yearNum + "" + monthIncreament);
						yearMonthList.add(ym);
					}
				}
				yearNum--;
			}
		} catch (Exception e) {
			logger.error("error occured while getting year month list", e);
		}
		return yearMonthList;
	}

	/**
	 * Method for getting month code based on month number
	 * 
	 * @param month
	 *            passing month value
	 * @return month code
	 */
	private static String getMonthCode(int month) {
		String monthString;
		switch (month) {
		case 0:
			monthString = "Jan";
			break;
		case 1:
			monthString = "Feb";
			break;
		case 2:
			monthString = "Mar";
			break;
		case 3:
			monthString = "Apr";
			break;
		case 4:
			monthString = "May";
			break;
		case 5:
			monthString = "Jun";
			break;
		case 6:
			monthString = "Jul";
			break;
		case 7:
			monthString = "Aug";
			break;
		case 8:
			monthString = "Sep";
			break;
		case 9:
			monthString = "Oct";
			break;
		case 10:
			monthString = "Nov";
			break;
		case 11:
			monthString = "Dec";
			break;
		default:
			monthString = "Invalid month";
			break;
		}
		return monthString;
	}

}
