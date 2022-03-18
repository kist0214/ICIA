package beans;

import lombok.Data;

@Data
public class Pays extends Lessons{
	private String ctCode;
	private String caCode;
	private String lpcaCode;
	private int lpQty;
	private int lpStocks;
	private String meCode;
	private String meName;
	private String paDate;
	private String paCaCode;
	private String paTotal;
}
