package com.apex;

import org.apache.log4j.Logger;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.apex.dao.ChartDAO;

@ContextConfiguration(locations = "classpath:spring-config.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class ChartTest {

	@Autowired
	ChartDAO chartDAO;

	Logger logger = Logger.getLogger(ChartTest.class);

	/* method is for getting user details(using test case) */
	@org.junit.Test
	public void getChartDetails() {

		try {
			chartDAO.getUserDetails(777);
		} catch (Exception e) {
			logger.error("error occured while getting chart details", e);
		}

	}
}
