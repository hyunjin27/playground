package com.polio.playground;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private SqlSession ses;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		List<HashMap<String, String>> recent_place = ses.selectList("front.recentPlace");
		List<HashMap<String, String>> recent_game = ses.selectList("front.recentGame");
		ModelAndView mv = new ModelAndView();
		mv.setViewName(".main.front.home");
		mv.addObject("place", recent_place);
		mv.addObject("game", recent_game);
		logger.info("FRONT PAGE");
		return mv;
	}
	
}
