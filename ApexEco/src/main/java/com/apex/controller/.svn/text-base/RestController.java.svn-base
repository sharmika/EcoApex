package com.apex.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.apex.bo.ChartBO;

/**
 * Class for Getting request from rest client and return JSON string
 * 
 * @author Mahesh
 * @version 1.0
 * 
 */
@Controller
@RequestMapping("/restClient")
public class RestController {
	@Autowired
	ChartBO chartBO;
	Logger logger = LoggerFactory.getLogger(RestController.class);

	/*
	 * Method for taking request from rest client and return JSON string(GET
	 * method)
	 * 
	 * @param yearMonth passing year and month
	 */
	@RequestMapping(value = "/{yearMonth}", method = RequestMethod.GET)
	public @ResponseBody
	String getChartData(@PathVariable String yearMonth, ModelMap model) {
		String ChatDetails = null;
		try {
			/*
			 * passing yearMonth value and returns longTerm chart related JSON
			 * String
			 */
			ChatDetails = chartBO.getChartDetails(yearMonth);
		} catch (Exception e) {
			logger.info("Error occured while getting DayAhead chart details : "
					+ e);
		}
		return ChatDetails;
	}

	/*
	 * Method for taking request from rest client and return JSON string(POST
	 * method)
	 * 
	 * @param yearMonth passing year and month
	 */
	@RequestMapping(value = "/postChart", method = RequestMethod.POST)
	public @ResponseBody
	String getChartDataByPost(@RequestBody String yearMonth, ModelMap model) {
		String ChatDetails = null;
		try {
			/*
			 * passing yearMonth value and returns longTerm chart related JSON
			 * String
			 */
			ChatDetails = chartBO.getChartDetails(yearMonth);
		} catch (Exception e) {
			logger.info("Error occured while getting longTerm chart details : "
					+ e);
		}
		return ChatDetails;
	}

}
