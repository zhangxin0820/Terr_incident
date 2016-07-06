package com.zx.model;

import java.sql.Date;

public class Terrincident {
	private Integer id;
	private Date terr_date;
	private String terr_state;
	private String terr_organization;
	private Integer terr_numberOfTerr;
	private Integer terr_numberOfCas;
	private String terr_crimeForm;
	private String terr_influence;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getTerr_date() {
		return terr_date;
	}

	public void setTerr_date(Date terr_date) {
		this.terr_date = terr_date;
	}

	public String getTerr_state() {
		return terr_state;
	}

	public void setTerr_state(String terr_state) {
		this.terr_state = terr_state;
	}


	public String getTerr_organization() {
		return terr_organization;
	}

	public void setTerr_organization(String terr_organization) {
		this.terr_organization = terr_organization;
	}


	public Integer getTerr_numberOfTerr() {
		return terr_numberOfTerr;
	}

	public void setTerr_numberOfTerr(Integer terr_numberOfTerr) {
		this.terr_numberOfTerr = terr_numberOfTerr;
	}


	public Integer getTerr_numberOfCas() {
		return terr_numberOfCas;
	}

	public void setTerr_numberOfCas(Integer terr_numberOfCas) {
		this.terr_numberOfCas = terr_numberOfCas;
	}

	public String getTerr_crimeForm() {
		return terr_crimeForm;
	}

	public void setTerr_crimeForm(String terr_crimeForm) {
		this.terr_crimeForm = terr_crimeForm;
	}

	public String getTerr_influence() {
		return terr_influence;
	}

	public void setTerr_influence(String terr_influence) {
		this.terr_influence = terr_influence;
	}

}
