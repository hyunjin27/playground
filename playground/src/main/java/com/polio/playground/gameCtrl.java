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
		if(num==null) {//�۾���
			num="0"; ref="1"; re_step="0"; re_level="0";//�۹�ȣ, ��� �׷�, ��� ����, ����
		}
	HashMap<String,String> map = new HashMap<String,String>();
	
	map.put("pageNum", pageNum);//������ ��ȣ
	map.put("num", num);//�۹�ȣ
	map.put("ref", ref);//��� �׷�
	map.put("re_step", re_step);//�� ����
	map.put("re_level", re_level);//�� ����
	
	return new ModelAndView(".main.game.insertForm","map",map); 
}//insertForm()----
		
	//��ǰ���Proc
	@RequestMapping(value="/insertPro.do",method=RequestMethod.POST)
	public String insertFormPro(@ModelAttribute("MemberDto") gameDto gameDto, HttpServletRequest request) throws NamingException, IOException {
	int maxNum=0;//�ִ�۹�ȣ
	if(sqlSession.selectOne("game.maxNumber")!=null) {//�ִ� �۹�ȣ
		maxNum=sqlSession.selectOne("game.maxNumber");
	}
	if(maxNum!=0) {//�ִ� �۹�ȣ�� 0�� �ƴϸ�
		maxNum=maxNum+1;//�ִ� �۹�ȣ +1�� ���ۼ�
	}else {//�ִ� �۹�ȣ�� 0�̸�
		maxNum=1;//�۹�ȣ 1���� �ۼ�
	}	
	if(gameDto.getNum()!=0) {//�亯���̸�
		//��� ������� ��ġ Ȯ��
		sqlSession.insert("game.reStep",gameDto);
		gameDto.setRe_step(gameDto.getRe_step()+1);//�ۼ���+1
		gameDto.setRe_level(gameDto.getRe_level()+1);//�� ����+1
	}else {//����
		gameDto.setRef(new Integer(maxNum));//�� �׷��ȣ, ���� �۹�ȣ
		gameDto.setRe_step(new Integer(0));//�ۼ��� 0
		gameDto.setRe_level(new Integer(0));//�۱��� 0
	}
	sqlSession.insert("game.insertGame",gameDto);
	return "redirect:gamelist.play";
	}//insertFormPro end----------
	@RequestMapping("/gamelist.play")
	public String gamelist(Model model, String pageNum) throws NamingException, IOException{
		if(pageNum==null) {
			pageNum="1";
		}
		int pageSize=10;//�� �������� �� ����
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		int count=0;
		int number=0;
		int pageBlock=10;
		
		count=sqlSession.selectOne("game.selectCount");//�� ���� ���
		number=count-(currentPage-1)*pageSize;//
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
	
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("start", startRow-1);//���� ��ġ
		map.put("cnt", pageSize);//�� ����
	
		List<gameDto> list=sqlSession.selectList("game.selectAll", map);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("pageCount",pageCount);
		
		model.addAttribute("count",count);
		model.addAttribute("currentPage",currentPage);
		
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);
		
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("number",number);
		model.addAttribute("list",list);//����Ʈ�� �ֱ�
		
		return ".main.game.gamelist";
	}
	//��ȸ�� ����, �۳��뺸��
@RequestMapping("content.do")
public ModelAndView getOneGame(int num,String pageNum,Model model) {
	//��ȸ�� ����
	sqlSession.update("game.readcountGame", new Integer(num)); //��ȸ��
	//�۳��� ����
	gameDto gameDto=(gameDto)sqlSession.selectOne("game.selectOne",num);
	model.addAttribute("pageNum",pageNum);
	
	return new ModelAndView(".main.game.content","gameDto",gameDto); //content.jsp
}//���뺸��end---------------

	//�ۼ�����
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

//�ۻ�����
@RequestMapping(value="/gameDelete.do", method=RequestMethod.GET)
public ModelAndView deletegame(int num,String pageNum,Model model) {
	gameDto gameDto=(gameDto)sqlSession.selectOne("game.selectOne",num);
	model.addAttribute("pageNum",pageNum);
	
	return new ModelAndView(".main.game.delete","gameDto",gameDto);//edit.jsp
}//userEdit

//�ۻ��� delete
@RequestMapping(value="/gameDelete.play", method=RequestMethod.POST)
public String deletegame(@ModelAttribute("gameDto")gameDto gameDto) throws NamingException, IOException{
	sqlSession.delete("game.deletegame",gameDto);
	return "redirect:list.play";
}//updateBoard


}//controller end-------------

