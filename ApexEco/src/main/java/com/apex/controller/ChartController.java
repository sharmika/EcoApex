package com.apex.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.apex.bo.ChartBO;

/**
 * Class for taking the Inputs from jsp's and returns chart data
 * 
 * @author mahesh
 * @version 1.0
 */
@Controller
public class ChartController {

	@Autowired
	ChartBO chartBO;
	Logger logger = LoggerFactory.getLogger(ChartController.class);

	/**
	 * Method for Taking Request from jsp and returns LongTerm chart Details
	 * 
	 * @return Json String to index.jsp
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping(value = "/longterm", method = RequestMethod.POST)
	public @ResponseBody
	String chartData(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ParseException {
		String ChatDetails = null;
		String yearMonth = request.getParameter("yearMonth");
		try {
			/*
			 * passing yearMonth value and returns longTerm chart related json
			 * String
			 */
			ChatDetails = chartBO.getChartDetails(yearMonth);
		} catch (Exception e) {
			logger.info("Error occured while getting long term chart details : "
					+ e);
		}
		return ChatDetails;
	}

	/**
	 * Method for Taking Request from jsp and returns DayAhead chart Details
	 * 
	 * @return Json String to index.jsp
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping(value = "/dayahead", method = RequestMethod.POST)
	public @ResponseBody
	String dayAheadPosition(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ParseException {
		String ChatDetails = null;
		/* getting day and megawatt value from jsp based on user click */
		String dayValue = request.getParameter("x");
		String megaWattValue = request.getParameter("y");
		try {
			/*
			 * passing dayValue,megaWattValue value and returns Dayahead chart
			 * related json String
			 */
			ChatDetails = chartBO.getDayAheadChartDetails(dayValue,
					megaWattValue);

		} catch (Exception e) {
			logger.info("Error occured while getting DayAhead chart details : "
					+ e);
		}
		return ChatDetails;
	}

}
