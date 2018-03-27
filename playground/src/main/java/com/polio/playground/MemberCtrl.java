package com.polio.playground;
import com.polio.playground.Encrypt;
import java.io.IOException;
import java.util.HashMap;

import javax.naming.NamingException;
import javax.servlet.http.*;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import polio.model.*;

@Controller
public class MemberCtrl {
	@Autowired
	private SqlSession ses;
	private static final Logger logger = LoggerFactory.getLogger(MemberCtrl.class);
	
	// form display
	@RequestMapping("join.play")
	public String join() {
		logger.info("entered join form");
		return ".main.member.join";
	}
	
	@RequestMapping("login.play")
	public String login() {
		logger.info("entered login form");
		return ".main.member.login";
	}
	
	@RequestMapping("mypage.play")
	public String mypage() {
		logger.info("entered mypage form");
		return ".main.member.mypage";
	}
	
	@RequestMapping("useredit.play")
	public ModelAndView useredit(String userid) {
		ModelAndView mv = new ModelAndView();
		memberDTO memberDto=ses.selectOne("member.selectOne", userid);
		mv.setViewName(".main.member.modify");
		mv.addObject("flag", "edit");
		mv.addObject("dto" , memberDto);
		return mv;
	}
	
	@RequestMapping("logout.play")
	public ModelAndView logout(HttpSession ss) {
		ModelAndView mv = new ModelAndView();
		logger.info("entered logout form");
		mv.setViewName(".main.member.msg");
		mv.addObject("msg", "�α׾ƿ��� �Ϸ�Ǿ����ϴ�");
		mv.addObject("url", "login.play");
		ss.invalidate();
		return mv;
	}
	
	@RequestMapping("quit.play")
	public ModelAndView quit() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName(".main.member.modify");
		mv.addObject("flag", "quit");
		return mv;
	}
	@RequestMapping("pwdchg.play")
	public ModelAndView pwdchg() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName(".main.member.modify");
		mv.addObject("flag", "pwd");
		return mv;
	}
	// form process
	
	// insert form
	@RequestMapping(value="joindo.play", method=RequestMethod.POST)
	public ModelAndView joinDo(@ModelAttribute("memberDTO") memberDTO dto) {
		logger.info("submitted join form");
		ModelAndView mv = new ModelAndView();
		// �н����� ��ȣȭ
		String pwd = dto.getPwd();
		Encrypt en = new Encrypt();
		pwd = en.toMD5(pwd);
		dto.setPwd(pwd);
		
		if (dto.getBirth()=="") {
			logger.info("null birth"); 
			dto.setBirth(null);
			}
		ses.insert("member.insertMember", dto);
		mv.setViewName(".main.member.msg");
		mv.addObject("msg", dto.getName() + " �� ������ ���ϵ帳�ϴ�.");
		mv.addObject("url", "login.play");
		return mv;
	}
	
	@RequestMapping(value="id_check.play", method=RequestMethod.POST)
	public ModelAndView idCheck(String userid) {
		logger.info("id checking..." + userid);
		int check=-1;
		int reguser=ses.selectOne("member.usercount", userid);
		logger.info("id checking in progress..." + reguser);
		if(reguser!=1){
			check=1;//��� ������ id
		}
		return new ModelAndView("member/id_check","id",check);
	}
	@RequestMapping(value="useredit.play", method=RequestMethod.POST)
	public ModelAndView userEditDo(HttpServletRequest req, HttpSession ss) {
		logger.info("edit user init");
		ModelAndView mv = new ModelAndView();
		HashMap<String,String> map = new HashMap<String,String>();
		// �н����� ��ȣȭ
		map.put("userid", req.getParameter("userid"));
		map.put("name", req.getParameter("name"));
		map.put("email", req.getParameter("email"));
		if (req.getParameter("birth")=="" ||req.getParameter("birth").length()<2) {
			map.put("birth",null);
		}else {
			map.put("birth",req.getParameter("birth"));
		}
		ses.update("member.updateMember", map);
		mv.setViewName(".main.member.msg");
		mv.addObject("msg", "������ �Ϸ�Ǿ����ϴ�. �ٽ� �α����Ͻʽÿ�.");
		mv.addObject("url", "login.play");
		ss.invalidate();
		return mv;
	}

	// login form
	
	@RequestMapping(value="login.play", method=RequestMethod.POST)
	public ModelAndView logindo (String userid, String pwd) throws NamingException,IOException {
		logger.info("login in progress..." + userid + "\t" + pwd);
		ModelAndView mv = new ModelAndView();
		// �н����� ��ȣȭ
		Encrypt en = new Encrypt();
		pwd = en.toMD5(pwd);
		memberDTO memberDto=ses.selectOne("member.selectOne", userid);
				
		if(memberDto == null){
			// ���̵� ����
			mv.addObject("result", "fail");
			logger.info("ID NOT FOUND!");
		}else if (memberDto.getPwd().equals(pwd)) {
			// ���̵� ������, ��й�ȣ�� ��ġ
			mv.addObject("result", "ok");
			mv.addObject("userid", userid);
			mv.addObject("name", memberDto.getName());
			logger.info("FOUND (" + memberDto.getUserid() + ")");
		}else {
			// ���̵� ������ ��й�ȣ�� �ٸ�
			mv.addObject("result", "fail"); //brute-force ���������� �����Ͽ� ���ġ �ƴ���.
			logger.info("FOUND ID (" + memberDto.getUserid() + "), BUT WRONG PASSWORD!");
		}
		mv.setViewName(".main.member.login");
		return mv;
	}
	@RequestMapping(value="quit.play", method=RequestMethod.POST)
	public ModelAndView userDelete(String userid) throws NamingException,IOException {
		ModelAndView mv = new ModelAndView();
		ses.delete("member.userDelete", userid);
		mv.setViewName(".main.member.msg");
		mv.addObject("msg", "Ż�� �Ϸ�Ǿ����ϴ�. �̿����ּż� �����մϴ�.");
		mv.addObject("url", "logout.play");
		
		return mv;
	}
	
	@RequestMapping(value="pwdchg.play", method=RequestMethod.POST)
	public ModelAndView pwdchgdo(HttpServletRequest req) throws NamingException,IOException {
		logger.info("starting password change");
		ModelAndView mv = new ModelAndView();
		Encrypt en = new Encrypt();
		String oldpwd = en.toMD5(req.getParameter("oldpwd").toString());
		logger.info("old password : " + oldpwd);
		String pwd = en.toMD5(req.getParameter("pwd").toString());
		logger.info("new password : " + pwd);
		memberDTO dto=ses.selectOne("member.selectOne", req.getParameter("userid").toString());
		if (oldpwd.equals(dto.getPwd())) {
			//���� ��ȣ�� �����Ѱ��
			logger.info("old password ok");
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("userid", req.getParameter("userid").toString());
			map.put("pwd", pwd);
			if (oldpwd.equals(pwd)) {
				//��ȣ�� ������ ���°��
				logger.info("same password error");
				mv.addObject("msg", "������ȣ�� �� ��ȣ�� �����մϴ�. �ٸ� ��ȣ�� ���� �ٶ��ϴ�.");
				mv.addObject("url", "pwdchg.play");
			}else {
			logger.info("ok. change db.");
			ses.update("member.pwdchg", map);
			mv.addObject("msg", "��ȣ�� ����Ǿ����ϴ�. ���ο� ���̵�� �ٽ� �α��� �ٶ��ϴ�.");
			mv.addObject("url", "logout.play");
			}
		}else {
			// ���� ��ȣ�� �ٸ� ���
			logger.info("old password no");
			mv.addObject("msg", "���� ��ȣ�� �ٸ��ϴ�. Ȯ�� �� ��ȣ ���� �ٶ��ϴ�.");
			mv.addObject("url", "pwdchg.play");
		}
		
		mv.setViewName(".main.member.msg");
				
		return mv;
	}
}
