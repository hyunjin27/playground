package com.polio.playground;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class placeCtrl {

	@Autowired
	private SqlSession ses;
	private static final Logger logger = LoggerFactory.getLogger(MemberCtrl.class);
	
	@RequestMapping("new_place.play")
	public String insert() {
		logger.info("entered place insert");
		return ".main.place.insert";
	}
	
	@RequestMapping("search.play")
	public String search() {
		logger.info("entered place insert");
		return "/place/search";
	}
}
