package com.company.cktree.notifications;

import java.util.Date;

public class NotifyDTO {
	private int n_no;
	private int n_index;
	private int m_no;
	private int gen_m_no;
	private String gen_m_name;
	private int b_no;
	private String n_content;
	private Date regdate;
	private Date readdate;
	
	
	
	public String getGen_m_name() {
		return gen_m_name;
	}
	public void setGen_m_name(String gen_m_name) {
		this.gen_m_name = gen_m_name;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public int getN_index() {
		return n_index;
	}
	public void setN_index(int n_index) {
		this.n_index = n_index;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getGen_m_no() {
		return gen_m_no;
	}
	public void setGen_m_no(int gen_m_no) {
		this.gen_m_no = gen_m_no;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getReaddate() {
		return readdate;
	}
	public void setReaddate(Date readdate) {
		this.readdate = readdate;
	}
	
	
}
