package com.somebody.db;



import java.util.ArrayList;
import java.util.List;

import beans.Centers;
import beans.Inbodys;
import beans.Members;
import beans.Staffs;

public interface MapperBon {
	
	//로그인 & 세션
	public String  sfLogin(Staffs sf);
	public Staffs  sfInfo(Staffs sf);
	public String  meLogin(Members me);
	public List<Members> meInfo(Members me);
	public int insertAccessHistory(Staffs sf);
	
	
	//인바디
	public int insInbody(Inbodys inbody);
	public int insInbodyDetail(Inbodys inbody);
	public List<Inbodys> getMeRecentInbody(Inbodys inbody);
	public int insTargetExcercise(Inbodys inbody);
	
	//회원
	public List<Members> meMg(Members me);
	
	
}
