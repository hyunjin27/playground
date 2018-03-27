package com.polio.playground;
import com.polio.playground.Encrypt;



import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import javax.naming.NamingException;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import polio.model.*;

@Controller
public class gameCtrl {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("insertForm.play")
	public ModelAndView insertForm(String num, String ref, String re_step, String re_level, String pageNum) {
		if(num==null) {//글쓰기
			num="0"; ref="1"; re_step="0"; re_level="0";//글번호, 답글 그룹, 답글 순서, 깊이
		}
	HashMap<String,String> map = new HashMap<String,String>();
	
	map.put("pageNum", pageNum);//페이지 번호
	map.put("num", num);//글번호
	map.put("ref", ref);//답글 그룹
	map.put("re_step", re_step);//글 순서
	map.put("re_level", re_level);//글 깊이
	
	return new ModelAndView(".main.game.insertForm","map",map); 
}//insertForm()----
		
	//상품등록Proc
	@RequestMapping(value="/insertPro.do",method=RequestMethod.POST)
	public String insertFormPro(@ModelAttribute("MemberDto") gameDto gameDto, HttpServletRequest request) throws NamingException, IOException {
	int maxNum=0;//최대글번호
	if(sqlSession.selectOne("game.maxNumber")!=null) {//최대 글번호
		maxNum=sqlSession.selectOne("game.maxNumber");
	}
	if(maxNum!=0) {//최대 글번호가 0이 아니면
		maxNum=maxNum+1;//최대 글번호 +1로 글작성
	}else {//최대 글번호가 0이면
		maxNum=1;//글번호 1부터 작성
	}	
	if(gameDto.getNum()!=0) {//답변글이면
		//답글 끼어넣을 위치 확보
		sqlSession.insert("game.reStep",gameDto);
		gameDto.setRe_step(gameDto.getRe_step()+1);//글순서+1
		gameDto.setRe_level(gameDto.getRe_level()+1);//글 깊이+1
	}else {//원글
		gameDto.setRef(new Integer(maxNum));//글 그룹번호, 현재 글번호
		gameDto.setRe_step(new Integer(0));//글순서 0
		gameDto.setRe_level(new Integer(0));//글깊이 0
	}
	sqlSession.insert("game.insertGame",gameDto);
	return "redirect:gamelist.play";
	}//insertFormPro end----------
	@RequestMapping("/gamelist.play")
	public String gamelist(Model model, String pageNum) throws NamingException, IOException{
		if(pageNum==null) {
			pageNum="1";
		}
		int pageSize=10;//한 페이지의 글 개수
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		int count=0;
		int number=0;
		int pageBlock=10;
		
		count=sqlSession.selectOne("game.selectCount");//글 개수 출력
		number=count-(currentPage-1)*pageSize;//
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
	
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("start", startRow-1);//시작 위치
		map.put("cnt", pageSize);//글 개수
	
		List<gameDto> list=sqlSession.selectList("game.selectAll", map);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("pageCount",pageCount);
		
		model.addAttribute("count",count);
		model.addAttribute("currentPage",currentPage);
		
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);
		
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("number",number);
		model.addAttribute("list",list);//리스트에 넣기
		
		return ".main.game.gamelist";
	}
	//조회수 증가, 글내용보기
@RequestMapping("content.do")
public ModelAndView getOneGame(int num,String pageNum,Model model) {
	//조회수 증가
	sqlSession.update("game.readcountGame", new Integer(num)); //조회수
	//글내용 보기
	gameDto gameDto=(gameDto)sqlSession.selectOne("game.selectOne",num);
	model.addAttribute("pageNum",pageNum);
	
	return new ModelAndView(".main.game.content","gameDto",gameDto); //content.jsp
}//내용보기end---------------

	//글수정폼
@RequestMapping(value="/gameedit.do", method=RequestMethod.GET)
public ModelAndView gameEdit(int num,String pageNum,Model model) {
	gameDto gameDto=(gameDto)sqlSession.selectOne("game.selectOne",num);
	model.addAttribute("pageNum",pageNum);
	
	return new ModelAndView(".main.game.gameedit","gameDto",gameDto);//edit.jsp
}//userEdit
@RequestMapping(value="/gameedit.do", method=RequestMethod.POST)
public String updategame(@ModelAttribute("gameDto")gameDto gameDto) throws NamingException, IOException{
	sqlSession.update("game.updategame",gameDto);
	return "redirect:gamelist.play";
}//updateBoard

//글삭제폼
@RequestMapping(value="/gameDelete.do", method=RequestMethod.GET)
public ModelAndView deletegame(int num,String pageNum,Model model) {
	gameDto gameDto=(gameDto)sqlSession.selectOne("game.selectOne",num);
	model.addAttribute("pageNum",pageNum);
	
	return new ModelAndView(".main.game.delete","gameDto",gameDto);//edit.jsp
}//userEdit

//글삭제 delete
@RequestMapping(value="/gameDelete.play", method=RequestMethod.POST)
public String deletegame(@ModelAttribute("gameDto")gameDto gameDto) throws NamingException, IOException{
	sqlSession.delete("game.deletegame",gameDto);
	return "redirect:list.play";
}//updateBoard


}//controller end-------------

