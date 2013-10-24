package com.apex.bo;

import com.apex.model.User;

/**
 * Interface has the following methods.
 * 
 * @author Mahesh
 * @version 1.0
 */
public interface ChartBO {
	/*
	 * calling method to check the user authentication and getting user details.
	 */
	public User getUserDetails(Long userId) throws Exception;

	/*
	 * passing yearMonth value and returns longTerm chart related JSON String
	 */
	public String getChartDetails(String yearMonth);

	/*
	 * passing dayValue,megaWattValue value and returns DayAhead chart related
	 * JSON String
	 */
	public String getDayAheadChartDetails(String dayValue, String megaWattValue);

}
