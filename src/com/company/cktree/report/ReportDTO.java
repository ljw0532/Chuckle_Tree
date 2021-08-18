package com.company.cktree.report;

import java.util.Date;

public class ReportDTO {
	private int report_no;
	private String report_content;
	private Date report_date;
	private int m_no;
	private String m_name;
	private String reporter_name;
	private int reporter_no;
	
	
	
	public String getReporter_name() {
		return reporter_name;
	}
	public void setReporter_name(String reporter_name) {
		this.reporter_name = reporter_name;
	}
	public int getReporter_no() {
		return reporter_no;
	}
	public void setReporter_no(int reporter_no) {
		this.reporter_no = reporter_no;
	}
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
	
}
