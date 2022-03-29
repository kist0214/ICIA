package com.somebody.db;



import java.util.ArrayList;
import java.util.List;

import beans.Centers;
import beans.Inbodys;
import beans.Lessons;
import beans.Members;
import beans.Staffs;

public interface MapperBon {
	

	//로그인 & 세션
	public String  sfLogin(Staffs sf);
	public Staffs  sfInfo(Staffs sf);
	public String  meLogin(Members me);
	public List<Members> meInfo(Members me);
	public int insertAccessHistory(Staffs sf);
	public int insertAccessOutHistory(Staffs sf);
	public String ismeEmail (Staffs sf);
	public String issfEmail (Staffs sf);
	public int modPwMe(Staffs sf);
	public int modPwSf(Staffs sf);
	
	//인바디
	public int insInbody(Inbodys inbody);
	public int insInbodyDetail(Inbodys inbody);
	public List<Inbodys> getMeRecentInbody(Inbodys inbody);
	public int insTargetExcercise(Inbodys inbody);
	
	//예약레슨
	public List<Members> getRegCenterList(Members me);
	public List<Lessons> getCtAllLessonList(Members me);
	public List<Lessons> getCtcaLessonList(Members me);
	public List<Lessons> getCtdateLessonList(Members me);
	public int remainLessonCount(Lessons ls);
	

	
	

	

	
	
	
	
}
