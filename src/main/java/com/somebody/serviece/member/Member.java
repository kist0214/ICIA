package com.somebody.serviece.member;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.somebody.db.CommonMethod;
import com.somebody.db.MapperBon;
import com.somebody.db.MapperUone;
import com.somebody.db.MapperYoung;

import beans.Members;
@Service
public class Member extends CommonMethod {
	@Autowired
	private MapperBon mb;
	@Autowired
	private MapperYoung my;
	@Autowired
	private MapperUone mu;
	private ModelAndView mav;

	String page = null;
	Members me;

	Member() {

		mav = new ModelAndView();
	}

	public ModelAndView backController(String sCode, Model model, Members me) {
		switch (sCode) {
		case "M01":
			goMePage(model, me);
			break;
		case "M02":
			meMg(me, model);
			break;
		case "M03":
			clickExpiration(me, model);
			break;
		case "M04":
			cgetCaList(me, model);
			break;

		}

		return mav;
	}



	public void backController(String sCode, Model model) {

		switch (sCode) {
		// 관리자페이지 접근
		case "C09":
			searchLsMg(model);
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
			getLessonList(model, me);
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
		

		}

	}

	public ModelAndView backControllerM(String sCode, Model model) {

		switch (sCode) {

		case "C17":
			delMe(model);
			break;

		}
		return this.mav;
	}

	private void cgetCaList(Members me, Model md) {
		tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		md.addAttribute("caList", this.my.getLsCaList(me));
		tranend(true);
	}

	private void clickExpiration(Members me, Model md) {
		List<Members> meList = new ArrayList<Members>();
		boolean tran=false;
		tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		if(convertToBoolean(this.my.clickExpiration(me))) {
			tran = true;
		}

		meList = this.my.meList(me);
		for(int i=0;i<meList.size();i++) {
			int stocks=0;
			for(int j=0;j<this.my.remecode().size();j++) {
				if(meList.get(i).getMeCode().equals(this.my.remecode().get(j).getMeCode())) {
					if(meList.get(i).getCaCode().equals(this.my.remecode().get(j).getCaCode())) {
						stocks = Integer.parseInt(this.my.Count(meList.get(i)).getLpStocks());
						meList.get(i).setSfCode(this.my.remecode().get(j).getSfCode());
					}
				}
			}
			meList.get(i).setLpStocks((meList.get(i).getLpQty()-stocks)+"");
		}
		tranend(tran);
		md.addAttribute("meList", meList);

	}

	public void goMePage(Model model, Members me) {
		this.mav.addObject("ctCode", me.getCtCode());
		mav.setViewName("meMg");


	}

	public void meInbodyMg(Model model) {

	}

	public void meDtInfo(Model model) {

		model.addAttribute("list",this.mu.meDtInfo((Members)model.getAttribute("send")));
System.out.println(model.getAttribute("list").toString()+"67898789");
	}

	public void meMg(Members me, Model md) {
		List<Members> meList = new ArrayList<Members>();
		tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);

		meList =(me.getStCode()==null&&me.getCaCode()==null&&me.getMeCode()==null)? this.my.meList(me):
			(me.getStCode() != null)? this.my.searchMeList(me):
				(me.getCaCode()!=null)? this.my.searchMeList2(me):
					(me.getMeCode()!=null&&me.getMeName()!=null) ? this.my.searchMeList3(me): this.my.meList(me);

		for(int i=0;i<meList.size();i++) {
			int stocks=0;
			for(int j=0;j<this.my.remecode().size();j++) {
				if(meList.get(i).getMeCode().equals(this.my.remecode().get(j).getMeCode())) {
					if(meList.get(i).getCaCode().equals(this.my.remecode().get(j).getCaCode())) {
						stocks = Integer.parseInt(this.my.Count(meList.get(i)).getLpStocks());
						meList.get(i).setSfCode(this.my.remecode().get(j).getSfCode());
					}
				}
			}

			meList.get(i).setLpStocks((meList.get(i).getLpQty()-stocks)+"");

		}
		md.addAttribute("meList", meList);
		tranend(true);
	}
	public void payCriteria(Members me) {
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formatedNow = now.format(formatter);
		System.out.println(formatedNow);

	}

	public void searchMeMg(Model model) {
		//model.addAttribute("getmemlist",this.mb.searchMeMg((Members)model.getAttribute("sendmelist")));

	}


	public void meDetail(Model model) {

	}

	public void getCaList(Model model) {

	}

	public void addMember(Model md) {
		List<Members> ml = new ArrayList<Members>();
		ml = (List<Members>) md.getAttribute("dataList");
		boolean tran = false;
		tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		if(this.convertToBoolean((ml.get(0).getCaCode()=="L0")?this.my.insMgL0(ml.get(0)):
			this.my.insMg(ml.get(0)))){
			for(Members ml2:ml) {
				if(tran=this.convertToBoolean(this.my.insPa(ml2))) {
				}
			}
		}
		if(tran) {
			ml = this.my.meList(ml.get(0));
			for(int i=0;i<ml.size();i++) {
				int stocks=0;
				for(int j=0;j<this.my.remecode().size();j++) {
					if(ml.get(i).getMeCode().equals(this.my.remecode().get(j).getMeCode())) {
						if(ml.get(i).getCaCode().equals(this.my.remecode().get(j).getCaCode())) {
							stocks = Integer.parseInt(this.my.Count(ml.get(i)).getLpStocks());
							ml.get(i).setSfCode(this.my.remecode().get(j).getSfCode());
						}
					}
				}
				ml.get(i).setLpStocks((ml.get(i).getLpQty()-stocks)+"");
			}
			tranend(tran);
			md.addAttribute("ml", ml);
		}
		tranend(tran);
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

	@SuppressWarnings("unchecked")
	public void getLessonList(Model model, Members me) {
		tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);

		if (mb.getRegCenterList((Members) model.getAttribute("melist")) != null) {

			model.addAttribute("mectlist", mb.getRegCenterList((Members) model.getAttribute("melist")));

			tranend(true);
		} else {
			System.out.println(222);
			me.setCaCode("가입된 매장이 없습니다.");
			model.addAttribute("mectlist", me.getCaCode());
		}

	}

	public void searchLsMg(Model model) {

		System.out.println(((Members)model.getAttribute("mectlist")).getCtCode() + "****");
		System.out.println(((Members)model.getAttribute("mectlist")).getMeCode() + "*9**");
		
		
		((Members)model.getAttribute("mectlist")).getMeCode().split("-");
		System.out.println(((Members)model.getAttribute("mectlist")).getMeCode() + "*8*");
		
		
		
		// 날짜없으면 텍스트
		 if(((Members)model.getAttribute("mectlist")) != null) {
		model.addAttribute("mectlslist",((Members)model.getAttribute("mectlist")).getMeCode() == null?
				mb.getCtcaLessonList((Members)model.addAttribute("mectlist")) 
				: mb.getCtdateLessonList((Members)model.addAttribute("mectlist")));
		} else {
			me.setCaCode("현재 매장에 수업이 없습니다.");
			model.addAttribute("mectlslist", me.getCaCode());
		}

	}

	public void insMeLesson(Model model) {

	}

	public void delMeLesson(Model model) {

	}

	public void meConfig(Model model) {
		this.mav.setViewName("meConfig");
	}


	public ModelAndView modMeMg(Model model) {
		Members me = new Members();
		me = (Members) model.getAttribute("Member");
		System.out.println(((Members) model.getAttribute("Member")).getMeBirth() + ":" + me.getMeBirth());
		mu.modMeMg(me);
		return mav;
	}

	public ModelAndView  delMe(Model model) {
		System.out.println(23);
		System.out.println((Members)model.getAttribute("send"));
		mu.delMe((Members)model.getAttribute("send")) ;
		String page = "/infoLine";
		this.mav.setViewName(page);
		return mav;

	}

	public void infoLine(Model model) {
		String page = "/infoLine";
		this.mav.setViewName(page);

	}


}