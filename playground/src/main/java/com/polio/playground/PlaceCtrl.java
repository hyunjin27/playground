package com.polio.playground;

import polio.model.*;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PlaceCtrl {

	@Autowired
	private SqlSession ses;
	private static final Logger logger = LoggerFactory.getLogger(PlaceCtrl.class);
	
	@RequestMapping("new_place.play")
	public String insert() {
		logger.info("entered place insert");
		return ".main.place.insert";
	}
	
	@RequestMapping("search.play")
	public String search() {
		logger.info("entered search view");
		return "/place/search";
	}
	@RequestMapping("insert.play")
	public ModelAndView insertDo(placeinfoDTO dto) {
		logger.info("doing insert");
		System.out.println(dto.getP_name());
		System.out.println(dto.getP_addr());
		System.out.println(dto.getP_detail());
		System.out.println(dto.getReguser());
		ModelAndView mv = new ModelAndView();
		mv.setViewName(".main.member.msg");
		mv.addObject("msg", "상점등록이 완료되었습니다");
		mv.addObject("url", "mypage.play");
		return mv;
	}
}
