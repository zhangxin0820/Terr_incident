package com.zx.model;

import java.sql.Date;

public class Terrcriminal {
	private Integer terr_id;
	private Integer event_id;
	private String terr_name;
	private String terr_gender;
	private Date terr_birthday;
	private String terr_job;

	public Integer getTerr_id() {
		return terr_id;
	}

	public void setTerr_id(Integer terr_id) {
		this.terr_id = terr_id;
	}

	public Integer getEvent_id() {
		return event_id;
	}

	public void setEvent_id(Integer event_id) {
		this.event_id = event_id;
	}

	public String getTerr_name() {
		return terr_name;
	}

	public void setTerr_name(String terr_name) {
		this.terr_name = terr_name;
	}

	public String getTerr_gender() {
		return terr_gender;
	}

	public void setTerr_gender(String terr_gender) {
		this.terr_gender = terr_gender;
	}

	public Date getTerr_birthday() {
		return terr_birthday;
	}

	public void setTerr_birthday(Date terr_birthday) {
		this.terr_birthday = terr_birthday;
	}

	public String getTerr_job() {
		return terr_job;
	}

	public void setTerr_job(String terr_job) {
		this.terr_job = terr_job;
	}

}
