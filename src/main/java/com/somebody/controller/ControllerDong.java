package com.somebody.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.somebody.serviece.lesson.Lesson;
import com.somebody.serviece.staff.Staff;

import beans.Lessons;
import beans.Staffs;



@Controller 
public class ControllerDong {
	ModelAndView mav;
	@Autowired
	Staff sfs;
	@Autowired
	Lesson lss;
	
	
	@RequestMapping("/goSfPage")
	public ModelAndView goSfPage(Model model, @ModelAttribute Staffs sf) {
		
		return this.sfs.backController("S00",sf, model);

	}
	@RequestMapping("/goLessonPage")
	public ModelAndView goLessonPage(Model model, @ModelAttribute Lessons ls) {

		return this.lss.backController("L00", ls, model);


	}
}

