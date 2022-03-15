package com.somebody.serviece.member;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import com.somebody.db.CommonMethod;
import com.somebody.db.MapperBon;
import com.somebody.db.MapperDong;
import com.somebody.db.MapperUone;
import com.somebody.db.MapperYoung;

import beans.Inbodys;
import beans.Members;

@Service
public class Inbody extends CommonMethod {
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

	public void backController(String sCode, ArrayList<ArrayList<String>> list) {
		String gs = null;
		String senddata = null;

		switch (sCode) {

		case "M10":
			insInbody(list);
			break;
		}
	}

	public void insInbody(ArrayList<ArrayList<String>> filters) {
		Inbodys inbody = new Inbodys();

		System.out.println(filters.size() + "사이즈");
		for (int i = 0; i < filters.size()-25; i++) { // 행
			inbody.setCtCode(filters.get(i).get(0));
			inbody.setMeCode(filters.get(i).get(1));
			System.out.println(inbody.getCtCode());
			System.out.println(inbody.getMeCode());
			if (convertToBoolean(this.mb.insInbody(inbody))) {

				System.out.println("인바디 T 등록 성공");

			} else {
				System.out.println("등록 실패");
			};

			if(i == filters.size()-26 ) { //1
				insInbodyDetail(filters);
			}

		}
	}

	public void insInbodyDetail(ArrayList<ArrayList<String>> filters) {
		Inbodys inbody = new Inbodys();

		for (int i = 0; i < filters.size()-25; i++) {
			inbody.setMeCode(filters.get(i).get(1));

			System.out.println(inbody.getMeCode()+"kk");
			// 인바디 DT (회원코드+기록일자, datacode, 값 카운트에 기록)
			inbody.setIbDaCode("10000");// 신장(10000)
			inbody.setIdCount(filters.get(i).get(2));

			if (convertToBoolean(this.mb.insInbodyDetail(inbody))) {
				System.out.println("신장 등록 성공");

			} else {
				System.out.println("신장 등록 실패");
			}
			;

			inbody.setIbDaCode("10001");// 체중(10001)
			inbody.setIdCount(filters.get(i).get(3));
			if (convertToBoolean(this.mb.insInbodyDetail(inbody))) {
				System.out.println("체중 등록 성공");

			} else {
				System.out.println("체중 등록 실패");
			}
			;

			// 골격근량(10002)
			inbody.setIbDaCode("10002");
			inbody.setIdCount(filters.get(i).get(4));
			if (convertToBoolean(this.mb.insInbodyDetail(inbody))) {
				System.out.println("골격근량 등록 성공");

			} else {
				System.out.println("골격근량 등록 실패");
			}
			;
			// 체지방량(10003)
			inbody.setIbDaCode("10003");
			inbody.setIdCount(filters.get(i).get(5));
			if (convertToBoolean(this.mb.insInbodyDetail(inbody))) {
				System.out.println("체지방량 등록 성공");

			} else {
				System.out.println("체지방량 등록 실패");
			}
			;
			// 체수분함유량(10004)
			inbody.setIbDaCode("10004");
			inbody.setIdCount(filters.get(i).get(6));
			if (convertToBoolean(this.mb.insInbodyDetail(inbody))) {
				System.out.println("체수분함유량 등록 성공");

			} else {
				System.out.println("체수분함유량 등록 실패");
			}
			;
			// 단백질(10005)
			inbody.setIbDaCode("10005");
			inbody.setIdCount(filters.get(i).get(7));

			if (convertToBoolean(this.mb.insInbodyDetail(inbody))) {
				System.out.println("단백질 등록 성공");

			} else {
				System.out.println("단백질 등록 실패");
			}
			;
			// 무기질(10006)
			inbody.setIbDaCode("10006");
			inbody.setIdCount(filters.get(i).get(8));
			if (convertToBoolean(this.mb.insInbodyDetail(inbody))) {
				System.out.println("무기질 등록 성공");

			} else {
				System.out.println("무기질 등록 실패");
			}
			;
			// BMI(10007)
			inbody.setIbDaCode("10007");
			inbody.setIdCount(filters.get(i).get(9));
			if (convertToBoolean(this.mb.insInbodyDetail(inbody))) {
				System.out.println("BMI 등록 성공");

			} else {
				System.out.println("BMI 등록 실패");

			}
			;
			// 내장지방률(10008)
			inbody.setIbDaCode("10008");
			inbody.setIdCount(filters.get(i).get(10));
			if (convertToBoolean(this.mb.insInbodyDetail(inbody))) {
				System.out.println("내장지방률 등록 성공");

			} else {
				System.out.println("내장지방률 등록 실패");
			}
			;
			// 복부지방률(10009)
			inbody.setIbDaCode("10009");
			inbody.setIdCount(filters.get(i).get(11));
			if (convertToBoolean(this.mb.insInbodyDetail(inbody))) {
				System.out.println("복부지방률 등록 성공");

			} else {
				System.out.println("복부지방률 등록 실패");
			}
			;
			// 기초대사량(10010)
			inbody.setIbDaCode("10010");
			inbody.setIdCount(filters.get(i).get(12));
			System.out.println(inbody.getMetabolism()+"메타");
			if (convertToBoolean(this.mb.insInbodyDetail(inbody))) {
				System.out.println("기초대사량 등록 성공");

			} else {
				System.out.println("기초대사량 등록 실패");
			}
		};
		autoTargetExcercise();
	}
	public void autoTargetExcercise() {
		//인바디 결과에 따라 회원에게 자동으로 운동을 추천해줌
		
		Inbodys inbody = new Inbodys();
		System.out.println(inbody.getIbDate());
		 //String data = mb.getMeInbody(inbody);
		
		

	}


}


