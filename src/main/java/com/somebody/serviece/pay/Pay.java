package com.somebody.serviece.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.somebody.db.CommonMethod;
import com.somebody.db.MapperBon;
import com.somebody.db.MapperDong;
import com.somebody.db.MapperUone;
import com.somebody.db.MapperYoung;

import beans.Pays;
import kr.co.icia.plzec.services.Encryption;
import kr.co.icia.plzec.services.ProjectUtils;

@Service
public class Pay extends CommonMethod{

	@Autowired
	private MapperYoung my;


	private ModelAndView mav;
	@Autowired
	private ProjectUtils pu;
	@Autowired
	private Encryption enc;
	@Autowired
	private DataSourceTransactionManager tx;

	private TransactionStatus txStatus;

	private DefaultTransactionDefinition txdef;


	public Pay() {
		mav = new ModelAndView();
	}

	String page = null;

	public ModelAndView backController(String sCode, Pays pa) {

		switch (sCode) {
		case "P01":
			payMg(pa);
			break;
		}
		return mav;
	}

	public void backController(String sCode, Pays pa, Model md) {

		switch (sCode) {
		case "P02":
			onLoadPay(pa, md);
			break;
		case "P03":
			searchPay(pa, md);
			break;
		}
	}

	public void payMg(Pays pa) {
		System.out.println(pa.getCtCode());
		System.out.println(this.my.payGraph(pa));
		this.mav.addObject("paGraph", this.my.payGraph(pa));
		this.mav.addObject("ctCode", pa.getCtCode());
		mav.setViewName("payMg");
	}

	public void onLoadPay(Pays pa, Model md) {
		tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		md.addAttribute("payList",this.my.payList(pa));
		tranend(true);
	}

	public void searchPay(Pays pa, Model md) {
		String a1="";
		tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		for(int i=0; i< pa.getPaDate().split("-").length;i++) {
			a1 += pa.getPaDate().split("-")[i];
		}
		pa.setPaDate(a1);
		md.addAttribute("payList",this.my.searchPay(pa));
		tranend(true);
	}

}