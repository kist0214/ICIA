package beans;

import lombok.Data;

@Data
public class Lessons {
	private String lsSfCtCode;
	private String ctCode;
	private String sfCode;
	private String sfName;
	private String lsCode;
	private String lsName;
	private String lsOpen;
	private String lsProgress;

	private String lsMeCount;
	private String lsCaCode;
	private String caName;
	private int lpQty;
	//수업예약
	
	
	//수업결제
	private String caCode;
	private int lpPrice;
}
