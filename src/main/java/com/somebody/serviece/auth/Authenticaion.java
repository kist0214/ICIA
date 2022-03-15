package com.somebody.serviece.auth;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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

	Members mme;

	String page = null;
	String message = null;
	boolean tran = false;

	public Authenticaion() {
		mav = new ModelAndView();
		
	}

	public void backController(String sCode, Centers ct) {
		String gs = null;

		switch (sCode) {
		case "A05":
			sendEmailForm(ct);
			break;
		case "A06":
			modPw(ct);
			break;
		
		case "J02":
			ctJoin(ct);
			break;
		case "P05":
			psJoin(ct);
			break;
		case "P04":
			getSelectCenter(ct);
			break;
		}

	}

	public void backController2(String sCode, Model model) {

		String gs = null;
		List<Members> senddata = null;

		switch (sCode) {
		
		case "J03":
			goMeJoinPage(model);
			break;
		case "C14":
			checkMePw(model);
			break;
		case "J01":
			joinForm(model);
			break;
		}

	}
	
	
	
	
	
	public ModelAndView backControllerME(String sCode, Members me) {
		String gs = null;
		List<Members> senddata = null;
		switch (sCode) {
		case "A02":
			meLogin(me);
			break;
		case "A04":
			logOutMe(me);
			break;
		
		}
		return this.mav;
	}
	
	public ModelAndView backControllerCT(String sCode, Staffs sf) {
		String gs = null;
		List<Members> senddata = null;
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
	
	


	public void checkMePw(Model model) {

	}

	private void goMeJoinPage(Model model) {

	}

	public ModelAndView meLogin(Members mme) {

		//아이디비번제어 일치시 로그인기록 저장
		String pw = this.enc.encode(mme.getMePw());
	
		System.out.println(mme.getMePw()+"여기비번");
		System.out.println(pw);
		

		this.tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED,false);

		try {
			if ((String)this.pu.getAttribute("meInfo") == null) {
				if (pw != null) {
				
				if (enc.matches(this.mb.meLogin(mme),pw)) {
					System.out.println(11);
					//로그인 기록은 센터만 하기로 함 
					this.mav.addObject("meInfo", this.mb.meInfo(mme));
					tran = true;
					this.tranend(tran);
					pu.setAttribute("meInfo", mme);
					session.setMaxInactiveInterval(30*30) ;
					this.mav.setViewName("meMg");

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
			

				this.tranconfig(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED,false);

				try {
					if ((String)this.pu.getAttribute("sfInfo") == null) {
						if (pw != null && sf.getSfPw()!=null) {
						if (enc.matches(sf.getSfPw(),pw)) {
							//로그인 기록은 센터만 하기로 함 
						
							sf.setAhType("A1");
							if(this.convertToBoolean(this.mb.insertAccessHistory(sf))) {
								sf = this.mb.sfInfo(sf);
								this.mav.addObject("sfInfo",sf);
								tran = true;
								this.tranend(tran);
								pu.setAttribute("sfInfo", sf);
								session.setMaxInactiveInterval(30*30) ;
								this.mav.setViewName("sfMg");
							};

						}else {
							this.message = "비밀번호가 일치하지 않습니다.";
							this.mav.addObject(this.message);
						}
					}
						this.message = "아이피가 없습니다.";
						this.mav.addObject(this.message);
				}} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return this.mav;

	}

	public void logOutMe(Members me) {
		page = "redirect:/";// 기본페이지로 이동
		this.mav.getModel().clear(); // 모델엔뷰 객체 지우기
		
		try {
			pu.removeAttribute("meInfo");
		} catch (Exception e) {
			
			e.printStackTrace();
		}

		
		this.mav.setViewName(page);

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

	}

	public void psJoin(Centers ct) {

	}

	public void getSelectCenter(Centers ct) {

	}

}
