package com.somebody.db;


import java.util.List;

import com.somebody.serviece.staff.Staff;

import beans.Lessons;
import beans.Staffs;
public interface MapperDong {
	/* Staffs */
	public List<Staffs> goSfPage();
	public List<Staffs> searchSfMg(Staffs sf);
	public int insSf(Staffs sf);
	public int modSf(Staffs sf);
	public List<Staffs> sfList(Staffs sf);
	/* Lessons */
	public List<Lessons> goLessonPage();
	public List<Lessons> lsList(Lessons ls);
	public List<Lessons> insLsForm(Lessons ls);
	public List<Lessons> searchLesson(Lessons ls);
	public List<Lessons> lessonMg(Lessons ls);
}
