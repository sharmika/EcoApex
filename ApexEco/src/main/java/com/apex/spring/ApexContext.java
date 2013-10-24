package com.apex.spring;

import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.web.context.ServletContextAware;
import com.apex.model.YearMonth;
import com.apex.util.ApexUtility;

/**
 * @author mahesh
 * 
 *         This class attains the servlet context and set data to application
 *         scope
 */
public class ApexContext implements ServletContextAware {

	List<YearMonth> yearMonthList = null;

	// commented below code for future purpose.
	/*
	 * public void getApexContextData() { try { String yearMonth="2013-12";
	 * yearMonthList = ApexUtility.getYearMonths(yearMonth);
	 * System.out.println(yearMonthList.size()); } catch (Exception e) {
	 * 
	 * }
	 * 
	 * }
	 */

	/*
	 * Set the data to application context immediately after server start up
	 * 
	 * @see
	 * org.springframework.web.context.ServletContextAware#setServletContext
	 * (javax.servlet.ServletContext)
	 * 
	 * This is Abstract method in ServletContextAware Interface
	 */
	@Override
	public void setServletContext(ServletContext servletContext) {

		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		String yearMonth = "" + year + "-" + month;
		/*
		 * Passing current month and year to get current month chart and returns
		 * year month list
		 */
		yearMonthList = ApexUtility.getYearMonths(yearMonth);
		servletContext.setAttribute("yearMonthList", yearMonthList);

	}

}
