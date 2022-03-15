package com.somebody.db;



import java.util.ArrayList;

import beans.Centers;
import beans.Inbodys;
import beans.Members;
import beans.Staffs;

public interface MapperBon {
	
	//로그인
	public String  sfLogin(Staffs sf);
	public Staffs  sfInfo(Staffs sf);
	public String  meLogin(Members me);
	public Members meInfo(Members me);
	public int insertAccessHistory(Staffs sf);
	
	
	//인바디
	public int insInbody(Inbodys inbody);
	public int insInbodyDetail(Inbodys inbody);
	public Inbodys getMeInbody(Inbodys inbody);
	
	
	
	
}
