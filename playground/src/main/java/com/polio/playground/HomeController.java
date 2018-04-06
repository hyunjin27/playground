package com.polio.playground;

import java.util.ArrayList;
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

import com.polio.playground.OpenLocationCode.CodeArea;

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
	
	@RequestMapping(value = "/here.play", method = RequestMethod.GET)
	public ModelAndView here() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName(".main.front.here");
		List<HashMap<String, String>> place = ses.selectList("place.selectAll");
		List<HashMap<String, String>> place_out = new ArrayList<HashMap<String,String>>();
		for (int i=0; i<place.size(); i++) {
			HashMap<String, String> map = place.get(i);
			String code = map.get("p_addr");
			OpenLocationCode olc = new OpenLocationCode(code);
			CodeArea decode = olc.decode();
			String lat = decode.getCenterLatitude()+"";
			String lng = decode.getCenterLongitude()+"";
			map.put("lat", lat);
			map.put("lng", lng);
			map.put("num", i+"");
			place_out.add(map);
		}	
		mv.addObject("place", place_out);
		return mv;
	}
	
}
