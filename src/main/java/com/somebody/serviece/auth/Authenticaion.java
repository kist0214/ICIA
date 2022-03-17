package com.somebody.serviece.auth;

import java.io.UnsupportedEncodingException;
import org.springframework.ui.Model;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpSession;

import org.apache.poi.ddf.EscherColorRef.SysIndexProcedure;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.MvcNamespaceHandler;

import com.somebody.db.CommonMethod;
import com.somebody.db.MapperBon;
import com.somebody.db.MapperDong;
import com.somebody.db.MapperUone;
import com.somebody.db.MapperYoung;
import com.somebody.serviece.member.Member;

import beans.Centers;
import beans.Members;
import beans.Staffs;
import kr.co.icia.plzec.services.Encryption;
import kr.co.icia.plzec.services.ProjectUtils;

@Service
public class Authenticaion extends CommonMethod {

	@Autowired
	private MapperYoung my;
	@Autowired
	private MapperBon mb;
	@Autowired
	private MapperDong md;
	@Autowired
	private MapperUone mo;

	private ModelAndView mav;
	
	
	@Autowired
	private ProjectUtils pu;
	@Autowired
	private Encryption enc;
	@Autowired
	HttpSession session;
	@Autowired
	Member mes;


	String page = null;
	String message = null;
	boolean tran = false;

	public Authenticaion() {
		mav = new ModelAndView();
		
	}

	public ModelAndView backController(String sCode, Centers ct) {
		String gs = null;

		switch (sCode) {
		case "A05":
			sendEmailForm(ct);
			break;
		case "A06":
			modPw(ct);
			break;
		case "P04":
			getSelectCenter(ct);
			break;
		case "J02":
			goJoinPage();
			break;
		}
		return mav;

	}
	
	public ModelAndView backController(String sCode, Members me) {

		switch (sCode) {
		case "J01":
			goJoinPage();
			break;
		
		case "J03":
			meJoin(me);
			break;
		}
		return mav;
	}
	
	public ModelAndView backControllerCT(String sCode, Staffs sf) {

		switch (sCode) {
		case "A03":
			ctLogin(sf);
			break;
		case "A04":
			logOutCt(sf);
			break;
			
		}
		return this.mav;
	}

	
	
	
	public ModelAndView backControllerME(String sCode,  Model model) {
	
		switch (sCode) {
		case "A02":
			meLogin(model);
			break;
		case "A04":
			logOutMe(model);
			break;

		case "C14":
			checkMePw(model);
			break;
			
		
		}
		return this.mav;
	}
	
	
	public void backController2(String sCode, Model md) {
		switch (sCode) {
		case "C01":
			checkMeEmailNum(md);
			break;

		case "C02":
			checkCtCode(md);
			break;
		}
	}
	
	

	private void checkCtCode(Model md) {
		tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		md.addAttribute("checkCtCode",this.my.checkCtCode());
		tranend(true);
	}
	
	private void checkMeEmailNum(Model md) {
		tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		md.addAttribute("checkMeEmailNum",this.my.checkMeEmailNum());
		tranend(true);
	}


	public void checkMePw(Model model) {

	}

	private void goJoinPage() {
		tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		mav.addObject("maxMeCode", this.my.maxCode());
		mav.setViewName("join");
		tranend(true);

	}

	public ModelAndView meLogin( Model model) {

		//아이디비번제어 일치시 로그인기록 저장
		String pw = mb.meLogin((Members)model.getAttribute("send"));
		System.out.println(((Members)model.getAttribute("send")).getMePw()+"여기비번");
	
		this.tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED,false);

		try {
			if ((String)this.pu.getAttribute("meInfo") == null) {
				System.out.println(11);
				if (pw != null) {
					System.out.println(22);
				if (enc.matches(((Members)model.getAttribute("send")).getMePw(), pw)) {
					System.out.println(33);
					//로그인 기록은 센터만
					
					System.out.println(this.mb.meInfo((Members)model.getAttribute("send")));
				
					this.mav.addObject("meInfo", this.mb.meInfo((Members)model.getAttribute("send")));
					tran = true;
					this.tranend(tran);
					pu.setAttribute("meInfo", this.mb.meInfo((Members)model.getAttribute("send")));
					session.setMaxInactiveInterval(30*30) ;
					
					
					
					
					this.mav.setViewName("infoLine");
				

				}else {
					this.message = "비밀번호가 일치하지 않습니다.";
					this.mav.addObject(this.message);
				}
			}
		}} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return this.mav;
	}
		


	public ModelAndView ctLogin(Staffs sf) {
				String pw = this.mb.sfLogin(sf);
			
			System.out.println(sf.getSfPw()+"%%");
			

				this.tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED,false);

				try {
					if ((String)this.pu.getAttribute("sfInfo") == null) {
						System.out.println(11);
						if (pw != null && sf.getSfPw()!=null) {
							System.out.println(22);
						if (enc.matches(sf.getSfPw(),pw)) {
							System.out.println(33);
							//로그인 기록은 센터만 하기로 함 
							this.mav.setViewName("sfMg");
						
							sf.setAhType("A1");
							if(this.convertToBoolean(this.mb.insertAccessHistory(sf))) {
								System.out.println(this.mav.getViewName());
								sf = this.mb.sfInfo(sf);
								System.out.println(66);
								this.mav.addObject("sfInfo",sf);
								System.out.println(77);
								tran = true;
								this.tranend(tran);
								pu.setAttribute("sfInfo", sf);
								
								//session.setMaxInactiveInterval(30*30) ;
								
							}else {
								System.out.println("실패");
								
							}

						}
						else {
							this.message = "비밀번호가 일치하지 않습니다.";
							this.mav.addObject(this.message);
							this.mav.setViewName("home");
						}
					}
					
				}} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(mav.getViewName()+"****");
				return this.mav;

	}

	public ModelAndView logOutMe(Model model) {
		
		
		
		try {
			this.mav.getModel().clear(); // 모델엔뷰 객체 지우기
			pu.removeAttribute("meInfo");
		} catch (Exception e) {
			
			e.printStackTrace();
		}

		mav.setViewName("home");
		return this.mav;

	}

	
	public void logOutCt(Staffs sf) {
		System.out.println(1231231);
		page = "redirect:/";// 기본페이지로 이동
		this.mav.getModel().clear(); // 모델엔뷰 객체 지우기
		try {

			sf.setAhType("A2");
			if (this.convertToBoolean(this.mb.insertAccessHistory(sf))) {
			} else {
			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			try {
				pu.removeAttribute("sfInfo");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		this.mav.setViewName(page);

	}
		

	

	public void sendEmailForm(Centers ct) {

	}

	public void modPw(Centers ct) {

	}

	public void joinForm(Model model) {
		

	}

	public void ctJoin(Centers ct) {
		page= "join";
		String msg= "가입실패~!";
		this.tranconfig(TransactionDefinition.PROPAGATION_REQUIRED,TransactionDefinition.ISOLATION_READ_COMMITTED,false);
		ct.setSfPw(this.enc.encode(ct.getSfPw()));
		if(convertToBoolean(this.my.ctJoin(ct))) {
			if(convertToBoolean(this.my.firstSfJoin(ct))) {
				page = "login";
				tran = true;
				msg = "가입성공~!";
			}
		}
		this.tranend(tran);
		mav.addObject("msg", msg);
		mav.setViewName(page);
	}

	public void meJoin(Members me) {
		page= "join";
		String msg= "가입실패~!";
		this.tranconfig(TransactionDefinition.PROPAGATION_REQUIRED,TransactionDefinition.ISOLATION_READ_COMMITTED,false);
		me.setMePw(this.enc.encode(me.getMePw()));
		if(convertToBoolean(this.my.meJoin(me))) {
			page = "login";
			tran = true;
			msg = "가입성공~!";
		}
		this.tranend(tran);
		mav.addObject("msg", msg);
		mav.setViewName(page);
	}

	
	

	public void psJoin(Centers ct) {

	}

	public void getSelectCenter(Centers ct) {

	}

}
