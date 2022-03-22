package com.somebody.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.somebody.db.MapperUone;
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
import beans.Staffs;


@RestController
@RequestMapping(value ="/ajax",produces = "application/json;charset=UTF-8")
public class AjaxController {
	private static final int Members = 0;
	@Autowired
	Authenticaion auth;
	@Autowired
	Member me;
	@Autowired
	Staff sfs;
	@Autowired
	Lesson lss;
	@Autowired
	Equipment eq;
	@Autowired
	Pay pa;
	@Autowired
	private MapperUone mu;

	public AjaxController(){}
	//Bon
	@RequestMapping(value = "/modPw", method = RequestMethod.POST)
	public void modPw(Model model, @RequestBody Centers ct) {
		this.auth.backController("A06", ct);
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/meMg", method = RequestMethod.POST)
	public List<Members> meMg(Model model, @RequestBody Members[] me) {
		this.me.backController("M02",model,me[0]);
		return (List<Members>)model.getAttribute("meList");
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/searchMeMg", method = RequestMethod.POST)
	public List<Members> searchMeMg(Model model, @RequestBody Members[] me) {
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

	//Dong
	@SuppressWarnings("unchecked")
	@RequestMapping("/sfMg")
	public List<Staffs> sfMg(Model model, @RequestBody Staffs[] sf) {
		sfs.backController("S01",sf[0], model);
		return (List<Staffs>)model.getAttribute("sfList");


	}
	@SuppressWarnings("unchecked")
	@RequestMapping("/searchSfMg")
	public List<Staffs> searchSfMg(Model model, @RequestBody Staffs[] sf) {

		this.sfs.backController("S02", sf[0], model.addAttribute("sf",sf[0]));
		return (List<Staffs>)model.getAttribute("sfList");
	}
	@RequestMapping(value = "/getMaxSf", method = RequestMethod.POST)
	public void getMaxSf(Model model, @RequestBody Staffs[] sf) {
		this.sfs.backController("S03", sf[0], model);
	}
	@SuppressWarnings("unchecked")
	@RequestMapping("/insSf")
	public List<Staffs> insSf(Model model, @RequestBody Staffs[] sf) {

		this.sfs.backController("S04", sf[0], model);

		return (List<Staffs>)model.getAttribute("sfList");
	}
	@SuppressWarnings("unchecked")
	@RequestMapping("/modSf")
	public List<Staffs> modSf(Model model, @RequestBody Staffs[] sf) {

		this.sfs.backController("S07",sf[0], model);

		return (List<Staffs>)model.getAttribute("modSf");
	}
	@RequestMapping(value = "/getMeMg", method = RequestMethod.POST)
	public void getMeMg(Model model, @RequestBody Staffs[] sf) {
		this.sfs.backController("S09", sf[0], model);
	}
	@SuppressWarnings("unchecked")
	@RequestMapping("/lessonMg")
	public List<Lessons> lessonMg(Model model, @RequestBody Lessons[] ls) {
		lss.backController("L01",ls[0], model.addAttribute("ls", ls[0]));
		return (List<Lessons>)model.getAttribute("lsList");

	}
	@SuppressWarnings("unchecked")
	@RequestMapping("/searchLesson")
	public List<Lessons> searchLesson(Model model, @RequestBody Lessons[] ls) {
		this.lss.backController("L02",ls[0],model.addAttribute("ls", ls[0]));
		return (List<Lessons>)model.getAttribute("searchLesson");
	}
	@RequestMapping(value = "/getLsCaList", method = RequestMethod.POST)
	public void getLsCaList(Model model, @RequestBody Lessons[] ls) {
		this.lss.backController("L03",ls[0],model);
	}
	@RequestMapping(value = "/insLsPay", method = RequestMethod.POST)
	public void insLsPay(Model model, @RequestBody Lessons[] ls) {
		this.lss.backController("L04",ls[0],model);
	}
	@RequestMapping(value = "/getMaxLesson", method = RequestMethod.POST)
	public void getMaxLesson(Model model, @RequestBody Lessons[] ls) {
		this.lss.backController("L05",ls[0],model);
	}
	@RequestMapping(value = "/insLesson", method = RequestMethod.POST)
	public void insLesson(Model model, @RequestBody Lessons[] ls) {
		this.lss.backController("L06",ls[0],model);
	}




	//Yong
	@RequestMapping(value = "/modLesson", method = RequestMethod.POST)
	public void modLesson(Model model, @ModelAttribute Lessons[] ls) {
		this.lss.backController("L09",ls[0], model);
	}
	@RequestMapping(value = "/lsMemDetail", method = RequestMethod.POST)
	public void lsMemDetail(Model model, @ModelAttribute Lessons[] ls) {
		this.lss.backController("L10",ls[0],model);
	}

	@RequestMapping(value = "/modLsSuccess", method = RequestMethod.POST)
	public void modLsSuccess(Model model, @ModelAttribute Lessons[] ls) {
		this.lss.backController("L11",ls[0],model);
	}
	@RequestMapping(value = "/delLesson", method = RequestMethod.POST)
	public void delLesson(Model model, @ModelAttribute Lessons[] ls) {
		this.lss.backController("L12",ls[0],model);
	}
	@RequestMapping(value = "/goodsMg", method = RequestMethod.POST)
	public List<Equipments> goodsMg(Model model, @RequestBody Equipments[] eq) {
		this.eq.backController("G02",eq[0], model);
		return (List<Equipments>) model.getAttribute("goodsList");
	}

	@RequestMapping(value = "/searchGoods", method = RequestMethod.POST)
	public List<Equipments> searchGoods(Model model, @RequestBody Equipments[] eq) {
		this.eq.backController("G03",eq[0], model);
		return (List<Equipments>) model.getAttribute("searchGoods");
	}
	@RequestMapping(value = "/getGoCaList", method = RequestMethod.POST)
	public List<Equipments> getGoCaList(Model model, @RequestBody Equipments[] eq) {
		this.eq.backController("G06", eq[0],model);
		return (List<Equipments>) model.getAttribute("getGoCaList");
	}
	@RequestMapping(value = "/getGoodsCode", method = RequestMethod.POST)
	public List<Equipments> getGoodsCode(Model model, @RequestBody Equipments[] eq) {
		this.eq.backController("G04", eq[0], model);
		return (List<Equipments>) model.getAttribute("getEqCode");
	}
	@RequestMapping(value = "/insGoods", method = RequestMethod.POST)
	public List<Equipments> insGoods(Model model, @RequestBody Equipments[] eq) {
		this.eq.backController("G05", eq[0], model);
		return (List<Equipments>) model.getAttribute("goodsList");
	}
	@RequestMapping(value = "/modGoods", method = RequestMethod.POST)
	public List<Equipments> modGoods(Model model, @RequestBody Equipments[] eq) {
		System.out.println("01. "+eq[0].getCtCode());
		this.eq.backController("G07", eq[0], model);
		return (List<Equipments>) model.getAttribute("modGoods");
	}

	@RequestMapping(value = "/onLoadPay", method = RequestMethod.POST)
	public List<Pays> onLoadPay(Model model, @RequestBody Pays[] pa) {
		this.pa.backController("P02", pa[0], model);
		return (List<Pays>) model.getAttribute("payList");
	}

	@RequestMapping(value = "/meEmailNum", method = RequestMethod.POST)
	public List<Members> checkMeEmailNum(Model model) {
		this.auth.backController2("C01", model);
		return (List<Members>) model.getAttribute("checkMeEmailNum");
	}
	@RequestMapping(value = "/checkCtCode", method = RequestMethod.POST)
	public List<Centers> checkCtCode(Model model) {
		this.auth.backController2("C02", model);
		return (List<Centers>) model.getAttribute("checkCtCode");
	}
	@RequestMapping(value = "/clickExpiration", method = RequestMethod.POST)
	public List<Members> clickExpiration(Model model, @RequestBody Members[] me) {
		this.me.backController("M03", model, me[0]);
		return (List<Members>) model.getAttribute("meList");
	}
	





	//UONE

	@RequestMapping(value = "/meDtInfo", method = RequestMethod.POST)
	public List<Members> meDtInfo(Model model,@ModelAttribute Members me) {
		this.me.backController("C02",model.addAttribute("me",me));

		return (List<Members>)model.getAttribute("list");
	}
	@RequestMapping(value = "/meInbodyMg", method = RequestMethod.POST)
	public void meInbodyMg(Model model, @ModelAttribute Members me) {
		this.me.backController("C03",  model);
	}
	@RequestMapping(value = "/insTaState", method = RequestMethod.POST)
	public void insTaState(Model model, @ModelAttribute Members me) {
		this.me.backController("C04", model);
	}
	@RequestMapping(value = "/meHealthMg", method = RequestMethod.POST)
	public void meHealthMg(Model model, @ModelAttribute Members me) {
		this.me.backController("C05", model);
	}
	@RequestMapping(value = "/meFoodMg", method = RequestMethod.POST)
	public void meFoodMg(Model model, @ModelAttribute Members me) {
		this.me.backController("C06", model);
	}
	@RequestMapping(value = "/getLessonList", method = RequestMethod.POST)
	public void getLessonList(Model model, @ModelAttribute Members me) {
		this.me.backController("C08", model);
	}
	@RequestMapping(value = "/searchLsMg", method = RequestMethod.POST)
	public void searchLsMg(Model model, @ModelAttribute Members me) {
		this.me.backController("C09", model);
	}
	@RequestMapping(value = "/insMeLesson", method = RequestMethod.POST)
	public void insMeLesson(Model model, @ModelAttribute Members me) {
		this.me.backController("C10", model);
	}
	@RequestMapping(value = "/delMeLesson", method = RequestMethod.POST)
	public void delMeLesson(Model model, @ModelAttribute Members me) {
		this.me.backController("C11", model);
	}
	@RequestMapping(value = "/checkMePw", method = RequestMethod.POST)
	public void checkMePw(Model model, @ModelAttribute Members me) {
		this.auth.backControllerME("C14",model);
	}
	@RequestMapping(value = "/modMeMg", method = RequestMethod.POST)
	public void modMeMg(Model model, @RequestBody Members[] me) {
		model.addAttribute("Member", me[0]);
		this.me.backController("C15", model);
	}






}
