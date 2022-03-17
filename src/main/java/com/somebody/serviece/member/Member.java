package com.somebody.serviece.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.somebody.db.CommonMethod;
import com.somebody.db.MapperBon;
import com.somebody.db.MapperDong;
import com.somebody.db.MapperUone;
import com.somebody.db.MapperYoung;

import beans.Members;
import kr.co.icia.plzec.services.Encryption;
import kr.co.icia.plzec.services.ProjectUtils;

@Service
public class Member extends CommonMethod{
	@Autowired
	private MapperBon mb;
	@Autowired
	private MapperDong md;
	@Autowired
	private MapperYoung my;
	@Autowired
	private MapperUone mu;
	private ModelAndView mav;

	private DataSourceTransactionManager tx;

	private TransactionStatus txStatus;

	private DefaultTransactionDefinition txdef;

	String page = null;
	Members me;
	Member(){
		mav = new ModelAndView();
	}

	public void backController(String sCode, Model model) {

		switch (sCode) {
		//관리자페이지 접근
		case "M01":
			goMePage(model);
			break;
		case "M02":
			meMg(model);
			break;
		case "M03":
			searchMeMg(model);
			break;
		case "M04":
			 meDetail(model);
			 break;
		case "M05":
			getCaList(model);
			break;
		case "M06":
			addMember(model);
			break;
		case "M07":
			modMe(model);
			break;

			
			//회원페이지 접근
		case "C01":
			infoLine(model);
			break;
		case "C02":
			meDtInfo(model);
			break;
		case "C03":
			meInbodyMg(model);
			break;
		case "C04":
			insTaState(model);
			break;
		case "C05":
			meHealthMg(model);
			break;
		case "C06":
			meFoodMg(model);
			break;
		case "C07":
			meLessonMg(model);
			break;
		case "C08":
			getLessonList(model);
			break;
		case "C09":
			searchLsMg(model);
			break;
		case "C10":
			insMeLesson(model);
			break;
		case "C11":
			delMeLesson(model);
			break;
		case "C12":
			meConfig(model);
			break;
		
		case "C15":
			modMeMg(model);
			break;
		case "C17":
			delMe(model);
			break;

		}
		
		
		
	}
	
	
	public ModelAndView backControllerM(String sCode, Model model) {
		String gs = null;
		String senddata = null;

		switch (sCode) {
	
		case "C17":
			delMe(model);
			break;

		}
		return this.mav;
		
		
		
	}

	public void goMePage(Model model) {
		this.mav.addObject("ctCode", me.getCtCode());
		mav.setViewName("meMg");
	
		
	}

	public void meInbodyMg(Model model) {

	}

	public void meDtInfo(Model model) {
		
		model.addAttribute("list",this.mu.meDtInfo());
		System.out.println(model.getAttribute("list"));

	}

	public void meMg(Model model) {
		
	model.addAttribute("getmemlist",this.mb.meMg((Members)model.getAttribute("sendmelist")));
	System.out.println(66);
	System.out.println(model.getAttribute("getmelist"));
	

	}

	public void searchMeMg(Model model) {
		model.addAttribute("getmemlist",this.mb.searchMeMg((Members)model.getAttribute("sendmelist")));
		System.out.println(66);
		System.out.println(model.getAttribute("getmelist"));

	}

	public void meDetail(Model model) {

	}

	public void getCaList(Model model) {

	}

	public void addMember(Model model) {

	}

	public void modMe(Model model) {

	}


	public void insTaState(Model model) {

	}

	public void meHealthMg(Model model) {

	}

	public void meFoodMg(Model model) {

	}

	public void meLessonMg(Model model) {
		String page = "/meLessonMg";
		this.mav.setViewName(page);

	}

	public void getLessonList(Model model) {

	}

	public void searchLsMg(Model model) {

	}

	public void insMeLesson(Model model) {

	}

	public void delMeLesson(Model model) {

	}

	public void meConfig(Model model) {
		this.mav.setViewName("meConfig");
		

	}

	

	public ModelAndView modMeMg(Model model) {
		me = new Members();
		me = (Members) model.getAttribute("Member");
		System.out.println(me);
		System.out.println(((Members) model.getAttribute("Member")).getMeBirth()+":"+me.getMeBirth());
		mu.modMeMg(me);
		return mav;
	}

	public ModelAndView  delMe(Model model) {
		mu.delMe(me) ;
		String page = "/infoLine";
		this.mav.setViewName(page);
		return mav;

	}

	public void infoLine(Model model) {
		String page = "/infoLine";
		 this.mav.setViewName(page);

	}

	
	
}
