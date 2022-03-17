package beans;

import lombok.Data;

@Data
public class Centers extends Staffs{
	
	private String ctCode;
	private String ctName;
	private String ctAddress;
	private String ctCeo;
	private String ctNumber;
	
	private String sfCode;
	private String sfPw;
	private String ahTime;
	private String ahIp;
	private String ahType;
	private String Locker;
	
}
