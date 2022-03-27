package com.somebody.serviece.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.somebody.db.CommonMethod;
import com.somebody.db.MapperYoung;

public class Scheduler extends CommonMethod {
	@Autowired
	private MapperYoung my;
	@Scheduled(cron="0 0 0 * * *") 
	public void scheduleRun(){
		if(convertToBoolean(this.my.sc())){
			System.out.println("스케쥴실행");
		}
	}

}
