package com.polio.playground;

import polio.model.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		/*System.out.println(dto.getP_name());
		System.out.println(dto.getP_addr());
		System.out.println(dto.getP_detail());
		System.out.println(dto.getReguser());*/
		ses.insert("place.insertPlace", dto);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(".main.member.msg");
		mv.addObject("msg", "상점등록이 완료되었습니다");
		mv.addObject("url", "place_list.play");
		return mv;
	}
	@RequestMapping("place_list.play")
	public ModelAndView getList() {
		List<HashMap<String, String>> list = ses.selectList("place.selectAll");
		ModelAndView mv = new ModelAndView();
		mv.setViewName(".main.place.list");
		mv.addObject("list", list);
		return mv;
	}
	@RequestMapping(value =  "place_del.play", method = RequestMethod.POST)
	public ModelAndView rateDel(HttpServletRequest req) {
		ses.delete("place.deletePlace", req.getParameter("p_no").toString());
		ModelAndView mv = new ModelAndView();
		mv.setViewName(".main.member.msg");
		mv.addObject("msg", "상점삭제가 완료되었습니다");
		mv.addObject("url", "place_list.play");
		return mv;
	}

}
