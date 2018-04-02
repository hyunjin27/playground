package com.polio.playground;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import polio.model.GameinfoDTO;

@Controller
public class GameCtrl {
	@Autowired
	private SqlSession ses;
	private static final Logger logger = LoggerFactory.getLogger(GameCtrl.class);
	
	// form display
	@RequestMapping("new_game.play")
	public ModelAndView gameInsert() {
		logger.info("entered game insert form");
		ModelAndView mv = new ModelAndView();
		mv.setViewName(".main.game.insert");
		try {
			TreeMap<String,String> genre_map = new TreeMap<String,String>(getGenre());
			genre_map.remove(genre_map.lastKey());
			mv.addObject("g_map", genre_map);
		}catch(IOException ex){
			System.out.println("exception!! on genre load : " + ex);
		}
		
		return mv;
	}
	@RequestMapping("game_insert.play")
	public ModelAndView insertDo(GameinfoDTO dto) {
		logger.info("doing insert");
		ses.insert("game.insertGame", dto);
		ModelAndView mv = new ModelAndView();
		mv.setViewName(".main.member.msg");
		mv.addObject("msg", "게임등록이 완료되었습니다");
		mv.addObject("url", "game_list.play");
		return mv;
	}
	@RequestMapping(value =  "game_view.play", method = RequestMethod.GET)
	public ModelAndView GameView(HttpServletRequest req) throws IOException {
		ModelAndView mv = new ModelAndView();
		if (req.getParameter("g_no")==null || req.getParameter("g_no").length() < 1) {
			// 그냥 진입한 경우
			mv.setViewName(".main.member.msg");
			mv.addObject("msg", "잘못된 접근입니다.");
			mv.addObject("url", ".");
			return mv;
		}else{
			String key = req.getParameter("g_no").toString();
			String genre_name = null;
			GameinfoDTO dto = ses.selectOne("game.selectOne", key);
			HashMap<String,String> map = getGenre();
			genre_name = map.get(dto.getG_genre());
			mv.setViewName(".main.game.content");
			mv.addObject("g_no", req.getParameter("g_no").toString());
			mv.addObject("genre_name", genre_name);
			mv.addObject("dto", dto);
			return mv;
		}
	}
	@RequestMapping("game_list.play")
	public ModelAndView getList() {
		List<HashMap<String, String>> list = ses.selectList("game.selectAll");
		ModelAndView mv = new ModelAndView();
		mv.setViewName(".main.game.list");
		mv.addObject("list", list);
		return mv;
	}
	@RequestMapping(value =  "game_del.play", method = RequestMethod.POST)
	public ModelAndView GameDel(HttpServletRequest req) {
		ses.delete("game.deleteGame", req.getParameter("g_no").toString());
		ModelAndView mv = new ModelAndView();
		mv.setViewName(".main.member.msg");
		mv.addObject("msg", "게임삭제가 완료되었습니다");
		mv.addObject("url", "game_list.play");
		return mv;
	}
	@RequestMapping(value =  "game_mod.play", method = RequestMethod.GET)
	public ModelAndView GameMod(HttpServletRequest req) throws IOException{
		ModelAndView mv = new ModelAndView();
		String key = req.getParameter("g_no").toString();
		GameinfoDTO dto = ses.selectOne("game.selectOne", key);
		TreeMap<String,String> genre_map = new TreeMap<String,String>(getGenre());
		genre_map.remove(genre_map.lastKey());
		mv.addObject("g_map", genre_map);
		mv.setViewName(".main.game.modify");
		mv.addObject("g_no", req.getParameter("g_no").toString());
		mv.addObject("dto", dto);
		return mv;
	}
	@RequestMapping(value =  "game_mod_do.play", method = RequestMethod.POST)
	public ModelAndView GameModeDO(HttpServletRequest req) {
		HashMap <String,String>map=new HashMap<String,String>();
		map.put("g_name", req.getParameter("g_name"));
		map.put("g_genre", req.getParameter("g_genre"));
		map.put("g_company", req.getParameter("g_company"));
		map.put("g_photo", req.getParameter("g_photo"));
		map.put("g_release", req.getParameter("g_release"));
		map.put("g_detail", req.getParameter("g_detail"));
		map.put("reguser", req.getParameter("reguser"));
		map.put("g_no", req.getParameter("g_no"));
		ModelAndView mv = new ModelAndView();
		ses.update("game.updateGame", map);
		mv.setViewName(".main.member.msg");
		mv.addObject("msg", "게임수정이 완료되었습니다");
		mv.addObject("url", "game_list.play");
		return mv;
	}
	
	public HashMap<String, String> getGenre() throws IOException{
			ClassLoader classLoader = Thread.currentThread().getContextClassLoader(); 
			InputStream is = classLoader.getResourceAsStream("g_genre.txt");
			
			HashMap<String, String> map = new HashMap<String, String>();

		    String line;
		    BufferedReader reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
		    
		    while ((line = reader.readLine()) != null)
		    {
		        String[] parts = line.split(":", 2);
		        if (parts.length >= 2)
		        {
		            String key = parts[0];
		            String value = parts[1];
		            map.put(key, value);
		        } else {
		            System.out.println("ignoring line: " + line);
		        }
		    }
		    
		    /*
		    for (String key : map.keySet())
		    {
		    	System.out.println(key + ":" + map.get(key));
		    	}
		    }
		    */
		    reader.close();

		    return map;
	}
}
