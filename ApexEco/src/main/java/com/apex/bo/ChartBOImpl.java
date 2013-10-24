package com.apex.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.apex.dao.ChartDAO;
import com.apex.model.User;
import com.apex.util.ApexUtility;
import com.apex.util.DayAheadUtility;

/**
 * Class for calling dao layer methods and utility class methods
 * 
 * @author mahesh
 * @version 1.0
 */
@Component
public class ChartBOImpl implements ChartBO {

	@Autowired
	ChartDAO chartDAO;

	/*
	 * class for getting LongTermPostion chart data
	 */
	@Autowired
	ApexUtility utility;
	/*
	 * class for getting DayAheadPosition chart data
	 */
	@Autowired
	DayAheadUtility dayUtility;

	/*
	 * method for getting user details
	 * 
	 * @see com.apex.bo.LoginBO#getUserDetails(java.lang.Long)
	 * 
	 * @param userId passing user unique id
	 * 
	 * @throws Exception
	 * 
	 * @returns User data
	 */
	@Override
	public User getUserDetails(Long userId) throws Exception {
		/*
		 * calling method to check the user authentication and getting user
		 * details.
		 */
		// Temporarily passing static value.
		User userData = chartDAO.getUserDetails(777);
		return userData;
	}

	/*
	 * Method for getting LongTermPostion chart details
	 * 
	 * @see com.apex.bo.LoginBO#getChartDetails(java.lang.String)
	 * 
	 * @param yearMonth passing year and month
	 * 
	 * @returns JSON String object
	 */
	@Override
	public String getChartDetails(String yearMonth) {
		/* calling utility methods for getting chart data */
		String chartDetails = utility.getChartDetailsFromJson(yearMonth);
		/*
		 * For GET String content = ""; try { URL url = new URL(
		 * "http://localhost:8080/Ecotronyx/restClient/2013-6"); BufferedReader
		 * in = new BufferedReader(new InputStreamReader( url.openStream()));
		 * String inputLine;
		 * 
		 * while ((inputLine = in.readLine()) != null) { content += inputLine; }
		 * System.out.println(content); } catch (Exception e) {
		 * 
		 * }
		 */
		/*
		 * For Post URL url = new URL(
		 * "http://localhost:8080/Ecotronyx/restClient/postChart/2013-06");
		 * HttpURLConnection httpCon = (HttpURLConnection) url
		 * .openConnection(); httpCon.setDoOutput(true);
		 * httpCon.setRequestMethod("POST");
		 * httpCon.setRequestProperty("yearMonth", "2013-06");
		 * OutputStreamWriter out = new OutputStreamWriter(
		 * httpCon.getOutputStream());
		 * System.out.println(httpCon.getResponseCode());
		 * System.out.println(httpCon.getResponseMessage()); out.close();
		 */

		return chartDetails;
	}

	/*
	 * Method for getting DayAheadPosition chart details
	 * 
	 * @see
	 * com.apex.bo.LoginBO#getDayAheadChartDetails(java.lang.String,java.lang
	 * .String)
	 * 
	 * @param dayValue passing particular day value
	 * 
	 * @param megaWattValue passing megaWattValue on that day
	 * 
	 * @returns JSON String object
	 */
	public String getDayAheadChartDetails(String dayValue, String megaWattValue) {
		/* calling utility methods for getting DayAheadPosition chart data */
		String chartDetails = dayUtility.getDayAheadChartDetailsFromJson(
				dayValue, megaWattValue);

		return chartDetails;

	}

}
