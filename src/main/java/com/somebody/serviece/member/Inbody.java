package com.somebody.serviece.member;

import java.util.ArrayList;
import java.util.List;

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
	String msg = null;

	public Inbody() {
		this.mav = new ModelAndView();
	}

	public ModelAndView backController(String sCode, ArrayList<ArrayList<String>> list,Model model) {

		switch (sCode) {

		case "M09":
			insInbody(list,model);
			break;

		}
		return this.mav;
	
	}

	public void insInbody(ArrayList<ArrayList<String>> filters,Model model ) {
		Inbodys inbody = new Inbodys();

		System.out.println(filters.size() + "사이즈");
		for (int i = 0; i < filters.size() - 25; i++) { // 행
			inbody.setCtCode(filters.get(i).get(0));
			inbody.setMeCode(filters.get(i).get(1));
			System.out.println(inbody.getCtCode());
			System.out.println(inbody.getMeCode());
			if (convertToBoolean(this.mb.insInbody(inbody))) {

				msg = "인바디 T 등록 성공";

			} else {
				msg = "인바디 테이블 등록 실패";
			}
			;

			System.out.println(filters.size() - 26 + "%%%");

		}

		insInbodyDetail(filters,model);
	}

	public void insInbodyDetail(ArrayList<ArrayList<String>> filters, Model model ) {
		Inbodys inbody = new Inbodys();

		for (int i = 0; i < filters.size() - 25; i++) {
			inbody.setMeCode(filters.get(i).get(1));

			System.out.println(inbody.getMeCode() + "kk");
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

			if (convertToBoolean(this.mb.insInbodyDetail(inbody))) {
				System.out.println("기초대사량 등록 성공");

			} else {
				System.out.println("기초대사량 등록 실패");
			}
		}
		;
		autoTargetExcercise(inbody,model);

	}

	public void autoTargetExcercise(Inbodys in, Model model) {
		// 회원코드 보내서 최신 인바디 결과에 따라 자동으로 목표 운동을 새로 고쳐줌
		int height = 0;
		int muscle = 0;
		int weight = 0;
		in.setMeCode("10002"); // 세션값 저장해야 함

		List<Inbodys> recentInbody = mb.getMeRecentInbody(in);

		System.out.println(recentInbody + "*");
		System.out.println(recentInbody.size() + "*");

		for (int i = 0; i < recentInbody.size(); i++) {
			System.out.println(recentInbody.get(i).getIbCode() + "^");

			System.out.println(recentInbody.get(i).getIbDaCode() + "^");
			System.out.println(recentInbody.get(i).getIdCount() + "^");

			if (recentInbody.get(i).getIbDaCode().equals("10000")) {
				height = Integer.parseInt(recentInbody.get(i).getIdCount());

			} else if (recentInbody.get(i).getIbDaCode().equals("10002")) {

				muscle = Integer.parseInt(recentInbody.get(i).getIdCount());
			} else if (recentInbody.get(i).getIbDaCode().equals("10003")) {
				weight = Integer.parseInt(recentInbody.get(i).getIdCount()); // 웨이트 왜 저장안돼

			} else {
				msg = "인바디코드가 달라요";
			}
			model.addAttribute("result", msg);

		}

		/*
		 * 운동코드, 이름 10001 스쿼트 10002 플랭크 10003 윗몸일으키기 10004 팔굽혀펴기 20001 실내자전거 30001 덤벨
		 * 20002 풀업 20004 벤치프레스 20005 레그프레스 20006 사이드레터럴레이즈 20007 스미스머신 20008 러닝머신 20009
		 * 숄더프레스 10005 런지 10006 마운틴클라이머
		 */

		System.out.println(height + "[");
		System.out.println(muscle + "[");
		System.out.println(weight + "[");
		if (height <= 160 && muscle <= 20 && weight >= 60) {
			System.out.println(11);

			// 160이 몸무게 많을 때(스쿼트, 윗몸일으키기)
			in.setIbDaCode("10002");
			in.setIbCode(recentInbody.get(0).getIbCode());
			in.setExCode("10001");
			mb.insTargetExcercise(in);
			in.setIbDaCode("10003");
			in.setExCode("10003");
			mb.insTargetExcercise(in);
			in.setMsg("인바디 등록에 성공하셨습니다.");
			model.addAttribute("msg",in);

		} else if (height <= 160 && muscle <= 20 && weight <= 60) {
			System.out.println(22);
			// 몸무게도 근육도 없을 때(스쿼트, 팔굽혀펴기)
			in.setIbCode(recentInbody.get(0).getIbCode());
			in.setIbDaCode("10002");
			in.setExCode("10001");
			mb.insTargetExcercise(in);
			in.setIbDaCode("10003");
			in.setExCode("10003");
			mb.insTargetExcercise(in);
			in.setMsg("인바디 등록에 성공하셨습니다.");
			model.addAttribute("msg",in);

		} else if (height <= 160 && muscle > 20 && weight >= 60) {
			System.out.println(33);
			// 몸무게도 근육도 많을 때(플랭크, 풀업)
			in.setIbCode(recentInbody.get(0).getIbCode());
			in.setIbDaCode("10002");
			in.setExCode("10002");
			mb.insTargetExcercise(in);
			in.setIbDaCode("10003");
			in.setExCode("20002");
			mb.insTargetExcercise(in);
			in.setMsg("인바디 등록에 성공하셨습니다.");
			model.addAttribute("msg",in);

		} else {
			System.out.println("160아님");

		}

		if (height > 160 && height <= 170 && muscle <= 25 && weight >= 70) {
			System.out.println(44);
			in.setIbCode(recentInbody.get(0).getIbCode());
			in.setIbDaCode("10002");
			in.setExCode("10001");
			mb.insTargetExcercise(in);
			in.setIbDaCode("10003");
			in.setExCode("10003");
			mb.insTargetExcercise(in);
			in.setMsg("인바디 등록에 성공하셨습니다.");
			model.addAttribute("msg",in);

		} else if (height > 160 && height <= 170 && muscle <= 25 && weight <= 70) {
			System.out.println(55);
			in.setIbCode(recentInbody.get(0).getIbCode());
			in.setIbDaCode("10002");
			in.setExCode("10001");

			mb.insTargetExcercise(in);
			in.setIbDaCode("10003");
			in.setExCode("10003");
			mb.insTargetExcercise(in);
			in.setMsg("인바디 등록에 성공하셨습니다.");
			model.addAttribute("msg",in);

		} else if (height > 160 && height <= 170 && muscle > 25 && weight >= 70) {
			System.out.println(66);
			in.setIbCode(recentInbody.get(0).getIbCode());
			in.setExCode("10002");
			in.setIbDaCode("10002");
			mb.insTargetExcercise(in);
			in.setIbDaCode("10003");
			in.setExCode("20002");
			mb.insTargetExcercise(in);
			in.setMsg("인바디 등록에 성공하셨습니다.");
			model.addAttribute("msg",in);

		} else {
			System.out.println("170아님");
		}

		if (height > 170 && muscle <= 30 && weight >= 80) {
			System.out.println(77);
			in.setIbCode(recentInbody.get(0).getIbCode());
			in.setIbDaCode("10002");
			in.setExCode("10001");
			mb.insTargetExcercise(in);
			in.setIbDaCode("10003");
			in.setExCode("10003");
			mb.insTargetExcercise(in);
			in.setMsg("인바디 등록에 성공하셨습니다.");
			model.addAttribute("msg",in);
			
			System.out.println(model.getAttribute(msg)+"ddd");

		} else if (height > 170 && muscle > 30 && muscle <= 35 && weight <= 80) {
			System.out.println(88);
			in.setIbCode(recentInbody.get(0).getIbCode());
			in.setIbDaCode("10002");
			in.setExCode("10001");
			mb.insTargetExcercise(in);
			in.setIbDaCode("10003");
			in.setExCode("10003");
			mb.insTargetExcercise(in);
			in.setMsg("인바디 등록에 성공하셨습니다.");
			model.addAttribute("msg",in);

		} else if (height > 170 && muscle > 35 && weight >= 80) {
			System.out.println(99);
			in.setIbCode(recentInbody.get(0).getIbCode());
			in.setIbDaCode("10002");
			in.setExCode("10002");
			mb.insTargetExcercise(in);
			in.setIbDaCode("10003");
			in.setExCode("20002");
			mb.insTargetExcercise(in);
			in.setMsg("인바디 등록에 성공하셨습니다.");
			model.addAttribute("msg",in);
			
		} else {
			in.setMsg("인바디 수치가 잘못되었습니다. 셀 값을 확인해주십시오.");
			model.addAttribute("msg",in);

		}
	
	System.out.println(model.getAttribute("msg")+"&&&");
		
	

	}
}
