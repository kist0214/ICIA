package com.somebody.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.somebody.serviece.auth.Authenticaion;
import com.somebody.serviece.member.Member;

import beans.Centers;
import beans.Members;
import beans.Staffs;

@Controller
public class ControllerBon {
	@Autowired
	Authenticaion auth;
	@Autowired
	Member me;
	ModelAndView mav;

	@Autowired
	HttpSession session;
	

	private static final Logger logger = LoggerFactory.getLogger(ControllerBon.class);

	//bon
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Model model) {
		//System.out.println((session.getId()));
		
		return this.auth.backControllerME("A01",model);
		
	}

	@RequestMapping(value = "/meLogin", method = RequestMethod.POST)
	public ModelAndView meLogin(Model model, @ModelAttribute Members me) {

		return this.auth.backControllerME("A02", model.addAttribute("send", me));
	}

	@RequestMapping(value = "/ctLogin", method = RequestMethod.POST)
	public ModelAndView ctLogin(Model model, @ModelAttribute Staffs sf) {
		return this.auth.backControllerCT("A03", sf);
	}

	@RequestMapping(value = "/logOut", method = RequestMethod.POST)
	public String logOut(Model model, @ModelAttribute Staffs sf) {
		if (sf.getSfId() != null) {
			this.auth.backControllerCT("A04", sf);
		} else {
			Members me = new Members();
			this.auth.backControllerME("A04", model.addAttribute("send", me));
		}
		return "home";
	}

	@RequestMapping(value = "/sendEmailForm", method = RequestMethod.GET)
	public String sendEmailForm(Model model, @ModelAttribute Centers ct, @ModelAttribute Members me) {
	
		return "sendEmailForm";
	}
	@RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
	public  ModelAndView sendEmail(Model model, @ModelAttribute Staffs sf )  {
		return this.auth.backControllerCT("A05",sf);
	}
	@RequestMapping(value = "/modPwPage", method = RequestMethod.GET)
	public String modPwPage()  {
		return "modPw";
	}
	@RequestMapping(value = "/modPw", method = RequestMethod.POST)
	public ModelAndView modPw(Model model, @ModelAttribute Staffs sf )  {
		return this.auth.backControllerCT("A06", sf);
	}




	@RequestMapping(value = "/ctJoin", method = RequestMethod.GET)
	public void ctJoin(Model model, @ModelAttribute Centers ct) {
		this.auth.backController("J02", ct);

	}


	@RequestMapping(value = "/goMePage", method = RequestMethod.POST)
	public ModelAndView goMePage(Model model, @ModelAttribute Members me) {
		return this.me.backController("M01", model, me);
	}


}
