package com.apex.util;

import java.util.ArrayList;
import java.util.Date;
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

/**
 * Class provides complete DayAhead Position chart details when clicking on bar
 * 
 * @author Bramhini
 * @version 1.0
 */
@Component
public class DayAheadUtility {
	Logger logger = LoggerFactory.getLogger(DayAheadUtility.class);

	/**
	 * Method for getting DayAhead Chart Data
	 * 
	 * @param dayValue
	 *            passing Day value
	 * @param megaWattValue
	 *            passing particular day megawatt value
	 * @return Json String
	 */
	public String getDayAheadChartDetailsFromJson(String dayValue,
			String megaWattValue) {
		/*
		 * firstStackBar,secondStackBar,averages and ranges objects for placing
		 * respective bar chart JSON objects
		 */
		Map<String, Object> firstStackBarMap;
		Map<String, Object> secondStackBarMap;
		Map<String, Object> averagesMap;
		Map<String, Object> rangesMap;

		/* lineMap object for placing line chart JSON object */
		Map<String, Object> lineMap = new HashMap<String, Object>();
		firstStackBarMap = new HashMap<String, Object>();
		secondStackBarMap = new HashMap<String, Object>();
		averagesMap = new HashMap<String, Object>();
		rangesMap = new HashMap<String, Object>();

		long time = Long.valueOf(dayValue);
		Date d = new Date(time);
		int hoursInDay = 24;
		/* x-Axis array containing Number Of Hours */
		Long xArray[] = new Long[hoursInDay];
		Long dayFirstHrValue = 0l;
		/* Preparing X-Axis data. */
		for (int day = 0; day < hoursInDay; day++) {
			@SuppressWarnings("deprecation")
			Long dateInMilliSeconds = Date.UTC(d.getYear(), d.getMonth(),
					d.getDate(), day, 0, 0);
			if (day == 0) {
				dayFirstHrValue = dateInMilliSeconds;
			}
			xArray[day] = dateInMilliSeconds;
		}

		String dayFirstHourValue = "{\"dayFirstHourValue\":\""
				+ dayFirstHrValue + "\"}";

		/* Preparing line data */
		Double[] lineArray = new Double[] { 255.5, 233.4, 213.7, 205.6, 195.8,
				193.1, 195.9, 191.4, 205.7, 231.3, 263.1, 289.8, 324.5, 343.5,
				353.6, 357.2, 358.0, 356.9, 351.3, 333.0, 327.7, 319.9, 300.0,
				266.2 };
		/* Preparing first stack bar data */
		Double[] firstStackBarArray = new Double[] { 200.0, 200.0, 200.0,
				200.0, 200.0, 200.0, 200.0, 284.7, 284.7, 284.7, 284.7, 284.7,
				284.7, 284.7, 284.7, 284.7, 284.7, 284.7, 284.7, 284.7, 284.7,
				284.7, 284.7, 200.0 };
		/* Preparing second stack bar data */
		Double[] secondStackBarArray = new Double[] { 200.0, 200.0, 200.0,
				200.0, 200.0, 200.0, 200.0, 284.7, 284.7, 284.7, 284.7, 284.7,
				284.7, 284.7, 284.7, 284.7, 284.7, 284.7, 284.7, 284.7, 284.7,
				284.7, 284.7, 200.0 };
		/* Preparing averages data */
		Double[] averagesArray = new Double[] { 233.0, 205.3, 194.4, 181.4,
				170.3, 159.4, 167.5, 167.5, 188.8, 207.7, 245.2, 272.6, 296.5,
				294.0, 297.7, 304.3, 317.8, 301.8, 282.6, 264.9, 264.9, 265.1,
				247.4, 213.4 };
		/* Preparing area range data */
		Double[] firstAreaRange = new Double[] { 195.8, 171.4, 162.4, 149.0,
				141.3, 138.4, 127.2, 134.6, 155.5, 173.1, 192.2, 209.4, 233.9,
				250.3, 249.4, 251.4, 261.7, 273.4, 256.7, 241.6, 222.8, 222.2,
				210.4, 181.3 };
		Double[] secondAreaRange = new Double[] { 270.1, 239.1, 226.5, 213.9,
				200.3, 194.2, 191.7, 200.3, 222.0, 242.2, 261.2, 281.1, 311.2,
				342.7, 338.6, 343.9, 346.9, 362.2, 346.9, 323.6, 306.9, 308.1,
				284.4, 245.5 };
		/*
		 * calling getChartData() and that returns Line data in the form of
		 * array contains [x-array,linedata]
		 */
		String lineData = DayAheadUtility.getChartData(xArray, lineArray,
				"lineValue");
		/*
		 * calling getChartData() and that returns firstStackBar data in the
		 * form of array contains [x-array,firstStackBarData]
		 */
		String firstStackBar = DayAheadUtility.getChartData(xArray,
				firstStackBarArray, "firstStackBar");
		/*
		 * calling getChartData() and that returns secondStackBar data in the
		 * form of array contains [x-array,secondStackBardata]
		 */
		String secondStackBar = DayAheadUtility.getChartData(xArray,
				secondStackBarArray, "secondStackBar");
		/*
		 * calling getChartData() and that returns averages data in the form of
		 * array contains [x-array,averagesData]
		 */
		String averages = DayAheadUtility.getChartData(xArray, averagesArray,
				"averages");
		/*
		 * calling getAreaRangeChartData() and that returns ranges data in the
		 * form of array contains [x-array,rangesData]
		 */
		String ranges = DayAheadUtility.getAreaRangeChartData(xArray,
				firstAreaRange, secondAreaRange, "ranges");

		/* preparing line chart json array */
		JSONObject lineObj;
		JSONArray lineJson = null;
		try {
			lineObj = new JSONObject(lineData);
			lineJson = lineObj.getJSONArray("lineValue");

		} catch (JSONException e) {
			logger.error("error occured while getting line json object", e);
		}

		/* preparing firstStackBar json array */
		JSONObject firstStackBarObj;
		JSONArray position1Json = null;
		try {
			firstStackBarObj = new JSONObject(firstStackBar);
			position1Json = firstStackBarObj.getJSONArray("firstStackBar");
		} catch (JSONException e) {
			logger.error(
					"error occured while getting first stack bar json object",
					e);
		}

		/* preparing secondStackBar json array */
		JSONObject secondStackBarObj;
		JSONArray position2Json = null;
		try {
			secondStackBarObj = new JSONObject(secondStackBar);
			position2Json = secondStackBarObj.getJSONArray("secondStackBar");
		} catch (JSONException e) {
			logger.error(
					"error occured while getting second stack bar json object",
					e);
		}

		/* preparing averages json array */
		JSONObject averagesObj;
		JSONArray averagesJson = null;
		try {
			averagesObj = new JSONObject(averages);
			averagesJson = averagesObj.getJSONArray("averages");
		} catch (JSONException e) {
			logger.error("error occured while getting averages json object", e);
		}
		/* preparing ranges json array */
		JSONObject rangesObj;
		JSONArray rangesJson = null;
		try {
			rangesObj = new JSONObject(ranges);
			rangesJson = rangesObj.getJSONArray("ranges");

		} catch (JSONException e) {
			logger.info("error occured while getting range json object" + e);
		}

		/* preparing dayFirstHourValue */
		JSONObject dayFirstHourValueObj = null;
		try {
			dayFirstHourValueObj = new JSONObject(dayFirstHourValue);

		} catch (JSONException e) {
			logger.info("error occured while getting dayFirstHourValue json object"
					+ e);
		}
		/*
		 * Keeping all Json arrays into individual maps
		 */
		lineMap.put("lineChartData", lineJson);
		firstStackBarMap.put("Position1ChartData", position1Json);
		secondStackBarMap.put("Position2ChartData", position2Json);
		averagesMap.put("averagesChartData", averagesJson);
		rangesMap.put("rangesChartData", rangesJson);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("dayFirstHourValue", dayFirstHourValueObj);

		/*
		 * adding individual json arrays to list and finally converting to
		 * string
		 */
		LinkedList<Map<String, Object>> chartList = new LinkedList<Map<String, Object>>();
		chartList.add(lineMap);
		chartList.add(firstStackBarMap);
		chartList.add(secondStackBarMap);
		chartList.add(averagesMap);
		chartList.add(rangesMap);
		chartList.add(map);
		/* preparing chart data in the form of string(json string format). */
		String jsonString = JSONValue.toJSONString(chartList);

		return jsonString;

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
		List<Object> data = new ArrayList<Object>();
		List<AreaRange> chartData = new ArrayList<AreaRange>();
		/* Keeping x and y array values in AreaRange list */
		for (int i = 0, j = 0, k = 0; i < xArray.length; i++, j++, k++) {
			AreaRange areaRange = new AreaRange();
			areaRange.setxCor(xArray[i]);
			areaRange.setyCor1(yRange1[j]);
			areaRange.setyCor2(yRange2[k]);
			chartData.add(areaRange);
		}
		/* preparing areaRange chart data in the form of array. */
		Iterator<AreaRange> itr = chartData.iterator();
		while (itr.hasNext()) {
			AreaRange range = itr.next();
			List<Object> cData = new ArrayList<Object>();
			cData.add(range.getxCor());
			cData.add(range.getyCor1());
			cData.add(range.getyCor2());
			data.add(cData);

		}

		String listValue = "{\"" + chartName + "\":" + data.toString() + "}";

		return listValue;
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
		/* keeping x and y array values in Chart list */
		for (int i = 0, j = 0; i < xArray.length; i++, j++) {
			Chart chartValues = new Chart();
			chartValues.setxCor(xArray[i]);
			chartValues.setyCor(yArray[j]);
			chartData.add(chartValues);
		}
		/* preparing chart data in the form of array. */
		Iterator<Chart> itr = chartData.iterator();
		while (itr.hasNext()) {
			Chart line = itr.next();
			List<Object> cData = new ArrayList<Object>();
			cData.add(line.getxCor());
			cData.add(line.getyCor());
			data.add(cData);
		}

		String listValue = "{\"" + chartName + "\":" + data.toString() + "}";
		return listValue;
	}
}
