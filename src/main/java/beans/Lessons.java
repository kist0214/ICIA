package beans;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Lessons {
	
	private String meCode;
	private String ctCode;
	private String ctName;
	private String sfCode;
	private String sfName;
	private String lsCode;
	private String lsName;
	private String lsOpen;
	private String lsProgress;

	private String lsMeCount;
	private String lsMeRemain;
	private String caCode;
	private String caName;
	
	//수업예약
	
	
	//수업결제
	private String lpCaCode;
	private String lpPrice;
	
	
}
