package com.somebody.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import com.somebody.serviece.auth.Authenticaion;
import com.somebody.serviece.equimpment.Equipment;
import com.somebody.serviece.lesson.Lesson;
import com.somebody.serviece.member.Member;
import com.somebody.serviece.pay.Pay;
import com.somebody.serviece.staff.Staff;

import beans.Centers;
import beans.Equipments;
import beans.Lessons;
import beans.Members;
import beans.Pays;


@RestController
@RequestMapping(value ="/ajax",produces = "application/json;charset=UTF-8")
public class AjaxController {
	private static final int Members = 0;
	@Autowired
	Authenticaion auth;
	@Autowired
	Member me;
	@Autowired
	Staff sf;
	@Autowired
	Lesson ls;
	@Autowired
	Equipment eq;
	@Autowired
	Pay pa;
	
	public AjaxController(){}
	//Bon
	@RequestMapping(value = "/modPw", method = RequestMethod.POST)
	public void modPw(Model model, @RequestBody Centers ct) {
		this.auth.backController("A06", ct);
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/meMg", method = RequestMethod.POST)
	public List<Members> meMg(Model model, @RequestBody Members[] me) {
		System.out.println(me[0].getCtCode());
		this.me.backController("M02",model.addAttribute("sendmelist",me[0]));
		
		
		return (List<Members>)model.getAttribute("getmelist");
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/searchMeMg", method = RequestMethod.POST)
	public List<Members> searchMeMg(Model model, @RequestBody Members[] me) {
		System.out.println(me[0].getCtCode());
		this.me.backController("M03",model.addAttribute("sendmelist",me[0]));
		return (List<Members>)model.getAttribute("getmelist");
	}

	@RequestMapping(value = "/meDetail", method = RequestMethod.POST)
	public void meDetail(Model model, @RequestBody Members me) {
		this.me.backController("M04",model);
	}

	@RequestMapping(value = "/getCaList", method = RequestMethod.POST)
	public void getCaList(Model model, @RequestBody Members me) {
		this.me.backController("M05", model);
	}

	@RequestMapping(value = "/addMember", method = RequestMethod.POST)
	public void addMember(Model model, @RequestBody Members me) {
		this.me.backController("M06",model);
	}	

	@RequestMapping(value = "/modMe", method = RequestMethod.POST)
	public void modMe(Model model, @RequestBody Members me) {
		this.me.backController("M07", model);
		
	}

	
	
	

	
}
