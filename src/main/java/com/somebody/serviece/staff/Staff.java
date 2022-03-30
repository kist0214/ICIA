package com.somebody.serviece.staff;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import com.somebody.db.CommonMethod;
import com.somebody.db.MapperDong;
import com.somebody.db.MapperYoung;
import beans.Staffs;
import kr.co.icia.plzec.services.Encryption;

@Service
public class Staff extends CommonMethod {
	@Autowired
	private MapperDong md;
	@Autowired
	private MapperYoung my;
	private ModelAndView mav;
	@Autowired
	private Encryption enc;
	String page = null;

	Staff() {
		mav = new ModelAndView();
	}

	public ModelAndView backController(String sCode, Staffs sf, Model model) {

		switch (sCode) {
		case "S00":
			goSfPage(model, sf);
			break;
		case "S01":
			sfMg(sf, model);
			break;
		case "S02":
			searchSfMg(sf, model);
			break;
		case "S03":
			getMaxSf(model);
			break;
		case "S04":
			insSf(sf, model);
			break;
		case "S07":
			modSf(sf, model);
			break;
		case "S08":
			modSf2(sf, model);
			break;
		case "S09":
			getMeMg(model);
			break;
		}
		return mav;
	}

	private void goSfPage(Model model, Staffs sf) {

		mav.addObject("sfCtCode", sf.getCtCode());
		mav.setViewName("sfMg");

	}

	public void sfMg(Staffs sf, Model model) {

		tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		model.addAttribute("sfList", this.md.sfList(sf));
		tranend(true);
	}

	public void searchSfMg(Staffs sf, Model model) {
		tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED,false);
			model.addAttribute("sfList", this.md.searchSfMg(sf));
			tranend(true);
		
	}

	public void getMaxSf(Model model) {

	}

	public void insSf(Staffs sf, Model model) {

		boolean tran = false;
		tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		if (convertToBoolean(this.md.insSf(sf))) {
			model.addAttribute("sfList", this.md.sfList(sf));
			tran = true;

		}
		tranend(tran);
	}

	public void modSf(Staffs sf, Model model) {
		boolean tran = false;
		tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);

System.out.println("2::"+sf.getSfPw());
		sf.setSfPw(this.enc.encode(sf.getSfPw()));
		if (convertToBoolean(this.my.modSf(sf))) {

System.out.println("4::"+sf.getSfPw());
			model.addAttribute("modSf", this.md.sfList(sf));
			tran = true;
		}

System.out.println("3::"+sf.getSfPw());
		tranend(tran);

	}
	public void modSf2(Staffs sf, Model model) {
		boolean tran = false;
		tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		if (convertToBoolean(this.my.modSf2(sf))) {
			model.addAttribute("modSf", this.md.sfList(sf));
			tran = true;
		}
		tranend(tran);

	}

	public void getMeMg(Model model) {

	}

}
