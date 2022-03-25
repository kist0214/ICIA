package com.somebody.serviece.member;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;

public class Scheduler {

	private static final Logger log = LoggerFactory.getLogger(Member.class);

	private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");


	@Scheduled(cron="0 0 0 * * *") 
	public void scheduleRun(){
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//System.out.println("스케줄 실행 : " + dateFormat.format(calendar.getTime()));
		log.info("스케줄 실행 : " + dateFormat.format(calendar.getTime()));
		//System.out.println("Request " + getCurrentRequest());

	}

}
