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
	public ModelAndView insertDo(PlaceinfoDTO dto) {
		logger.info("doing insert");
		ses.insert("place.insertPlace", dto);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(".main.member.msg");
		mv.addObject("msg", "상점등록이 완료되었습니다");
		mv.addObject("url", "place_list.play");
		return mv;
	}
	@RequestMapping(value =  "place_view.play", method = RequestMethod.GET)
	public ModelAndView placeView(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		if (req.getParameter("p_no")==null || req.getParameter("p_no").length() < 1) {
			// 그냥 진입한 경우
			mv.setViewName(".main.member.msg");
			mv.addObject("msg", "잘못된 접근입니다.");
			mv.addObject("url", ".");
			return mv;
		}else{
			String key = req.getParameter("p_no").toString();
			PlaceinfoDTO dto = ses.selectOne("place.selectOne", key);
			List<HashMap<String, String>> list = ses.selectList("gnp.placeGameList",key);
			mv.addObject("list", list);
			mv.setViewName(".main.place.content");
			mv.addObject("p_no", req.getParameter("p_no").toString());
			mv.addObject("dto", dto);
			return mv;
		}
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
	public ModelAndView placeDel(HttpServletRequest req) {
		ses.delete("place.deletePlace", req.getParameter("p_no").toString());
		ModelAndView mv = new ModelAndView();
		mv.setViewName(".main.member.msg");
		mv.addObject("msg", "상점삭제가 완료되었습니다");
		mv.addObject("url", "place_list.play");
		return mv;
	}
	@RequestMapping(value =  "place_mod.play", method = RequestMethod.GET)
	public ModelAndView placeMod(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String key = req.getParameter("p_no").toString();
		PlaceinfoDTO dto = ses.selectOne("place.selectOne", key);
		mv.setViewName(".main.place.modify");
		mv.addObject("p_no", req.getParameter("p_no").toString());
		mv.addObject("dto", dto);
		return mv;
	}
	@RequestMapping(value =  "place_mod_do.play", method = RequestMethod.POST)
	public ModelAndView placeModeDO(HttpServletRequest req) {
		HashMap <String,String>map=new HashMap<String,String>();
		map.put("p_name", req.getParameter("p_name"));
		map.put("p_addr", req.getParameter("p_addr"));
		map.put("p_area", req.getParameter("p_area"));
		map.put("p_detail", req.getParameter("p_detail"));
		map.put("reguser", req.getParameter("reguser"));
		map.put("p_no", req.getParameter("p_no"));
		ModelAndView mv = new ModelAndView();
		ses.update("place.updatePlace", map);
		mv.setViewName(".main.member.msg");
		mv.addObject("msg", "상점수정이 완료되었습니다");
		mv.addObject("url", "place_list.play");
		return mv;
	}
	
	@RequestMapping(value =  "place_on_game.play", method = RequestMethod.GET)
	public ModelAndView placeOnGame(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		if (req.getParameter("p_no")==null || req.getParameter("p_no").length() < 1) {
			// 그냥 진입한 경우
			mv.setViewName(".main.member.msg");
			mv.addObject("msg", "잘못된 접근입니다.");
			mv.addObject("url", ".");
			return mv;
		}else{
			String key = req.getParameter("p_no").toString();
			PlaceinfoDTO dto = ses.selectOne("place.selectOne", key);
			List<HashMap<String, String>> list = ses.selectList("gnp.getGame2Pos",key);
			mv.setViewName(".main.place.game");
			mv.addObject("p_no", req.getParameter("p_no").toString());
			mv.addObject("dto", dto);
			mv.addObject("list", list);
			return mv;
		}
	}
	
	@RequestMapping(value =  "add_game2pos.play", method = RequestMethod.GET)
	public ModelAndView gameToPos(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		if (req.getParameter("p_no")==null || req.getParameter("p_no").length() < 1) {
			// 그냥 진입한 경우
			mv.setViewName(".main.member.msg");
			mv.addObject("msg", "잘못된 접근입니다.");
			mv.addObject("url", ".");
			return mv;
		}else{
			String key = req.getParameter("p_no").toString();
			PlaceinfoDTO dto = ses.selectOne("place.selectOne", key);
			List<HashMap<String, String>> list = ses.selectList("game.selectAll");
			mv.setViewName(".main.place.addgame");
			mv.addObject("p_no", req.getParameter("p_no").toString());
			mv.addObject("dto", dto);
			mv.addObject("list", list);
			return mv;
		}
	}
	@RequestMapping(value =  "add_game2pos.play", method = RequestMethod.POST)
	public ModelAndView gameToPosInsert(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		HashMap <String,String>map=new HashMap<String,String>();
		map.put("p_no", req.getParameter("p_no"));
		map.put("g_no", req.getParameter("g_no"));
		map.put("gnp_price", req.getParameter("gnp_price"));
		map.put("gnp_credit", req.getParameter("gnp_credit"));
		map.put("gnp_detail", req.getParameter("gnp_detail"));
		ses.insert("gnp.gnpInsert", map);
		mv.setViewName(".main.member.msg");
		mv.addObject("msg", "게임추가가 완료되었습니다");
		mv.addObject("url", "place_on_game.play?p_no="+ map.get("p_no"));
		return mv;
	}
	@RequestMapping(value =  "gnp_del.play", method = RequestMethod.POST)
	public ModelAndView gnpDel(HttpServletRequest req) {
		ses.delete("gnp.gnpDelete", req.getParameter("gnp_no").toString());
		ModelAndView mv = new ModelAndView();
		mv.setViewName(".main.member.msg");
		mv.addObject("msg", "상점에서 게임삭제가 완료되었습니다");
		mv.addObject("url", "place_on_game.play?p_no="+ req.getParameter("p_no"));
		return mv;
	}
	@RequestMapping(value =  "gnp_mod.play", method = RequestMethod.GET)
	public ModelAndView gnpMod(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		if (req.getParameter("gnp_no")==null || req.getParameter("gnp_no").length() < 1) {
			// 그냥 진입한 경우
			mv.setViewName(".main.member.msg");
			mv.addObject("msg", "잘못된 접근입니다.");
			mv.addObject("url", ".");
			return mv;
		}else{
			HashMap <String,String>map=new HashMap<String,String>();
			List<HashMap<String, String>> list = ses.selectList("game.selectAll");
			String key = req.getParameter("gnp_no").toString();
			map = ses.selectOne("gnp.selectOne", key);
			mv.setViewName(".main.place.modgame");
			mv.addObject("p_no", req.getParameter("p_no").toString());
			mv.addObject("list", list);
			mv.addObject("map", map);
			return mv;
		}
	}
	@RequestMapping(value =  "gnp_mod.play", method = RequestMethod.POST)
	public ModelAndView gnpModDO(HttpServletRequest req) {
		HashMap <String,String>map=new HashMap<String,String>();
		map.put("gnp_no", req.getParameter("gnp_no"));
		map.put("p_no", req.getParameter("p_no"));
		map.put("g_no", req.getParameter("g_no"));
		map.put("gnp_price", req.getParameter("gnp_price"));
		map.put("gnp_credit", req.getParameter("gnp_credit"));
		map.put("gnp_detail", req.getParameter("gnp_detail"));
		ModelAndView mv = new ModelAndView();
		ses.update("gnp.gnpUpdate", map);
		mv.setViewName(".main.member.msg");
		mv.addObject("msg", "상점에서 게임내용수정이 완료되었습니다");
		mv.addObject("url", "place_on_game.play?p_no="+ map.get("p_no"));
		return mv;
	}
}
