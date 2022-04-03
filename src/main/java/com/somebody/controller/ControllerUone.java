package com.somebody.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.somebody.serviece.member.Member;

import beans.Inbodys;
import beans.Members;

@Controller 
public class ControllerUone {
	@Autowired
	Member me;
	
	
	
	@RequestMapping(value = "/infoLine", method = RequestMethod.GET)
	public void infoLine(Model model, @ModelAttribute Members me) {
		this.me.backController("C01", model);
	}
	@RequestMapping(value = "/meLessonMg", method = RequestMethod.POST)
	public void meLessonMg(Model model, @ModelAttribute Members me) {
		this.me.backController("C07", model);
	}
	@RequestMapping(value = "/meConfig", method = RequestMethod.POST)
	public void meConfig(Model model, @ModelAttribute Members me) {
		this.me.backController("C12", model);
	}
	@RequestMapping(value = "/delMe", method = RequestMethod.POST)
	public void delMe(Model model, @RequestBody Members me[]) {
		model.addAttribute("del", me[0]);
		this.me.backControllerM("C17", model);
	}
	
}
