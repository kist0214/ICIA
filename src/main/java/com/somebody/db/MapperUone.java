package com.somebody.db;

import java.util.List;

import beans.Members;

public interface MapperUone {
	
	public List<Members> meDtInfo();
	public int delMe(Members me);
	public int modMeMg(Members me);

}
