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
	@RequestMapping(value = "/meMg", method = RequestMethod.POST)
	public void meMg(Model model, @RequestBody Members me) {
		this.me.backController("M01",me);
	}

	@RequestMapping(value = "/searchMeMg", method = RequestMethod.POST)
	public void searchMeMg(Model model, @RequestBody Members me) {
		this.me.backController("M02",me);
	}

	@RequestMapping(value = "/meDetail", method = RequestMethod.POST)
	public void meDetail(Model model, @RequestBody Members me) {
		this.me.backController("M03",me);
	}

	@RequestMapping(value = "/getCaList", method = RequestMethod.POST)
	public void getCaList(Model model, @RequestBody Members me) {
		this.me.backController("M04", me);
	}

	@RequestMapping(value = "/addMember", method = RequestMethod.POST)
	public void addMember(Model model, @RequestBody Members me) {
		this.me.backController("M06",me);
	}	

	@RequestMapping(value = "/modMe", method = RequestMethod.POST)
	public void modMe(Model model, @RequestBody Members me) {
		this.me.backController("M07", me);
		
	}

	@RequestMapping(value = "/insInbody", method = RequestMethod.POST)
	public void insInbody(Model model, @RequestBody Members me) {
		this.me.backController("M09", me);
	}
	
	

	
}
