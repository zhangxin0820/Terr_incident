package com.zx.model;

public class Subincident {
	private Integer sub_id;
	private Integer sub_event_id;
	private String terr_location;
	private String terr_measure;
	private Integer terr_sub_numberOfTerr;
	private Integer terr_sub_numberOfCas;

	public Integer getSub_id() {
		return sub_id;
	}

	public void setSub_id(Integer sub_id) {
		this.sub_id = sub_id;
	}

	public Integer getSub_event_id() {
		return sub_event_id;
	}

	public void setSub_event_id(Integer sub_event_id) {
		this.sub_event_id = sub_event_id;
	}

	public String getTerr_location() {
		return terr_location;
	}

	public void setTerr_location(String terr_location) {
		this.terr_location = terr_location;
	}

	public String getTerr_measure() {
		return terr_measure;
	}

	public void setTerr_measure(String terr_measure) {
		this.terr_measure = terr_measure;
	}

	public Integer getTerr_sub_numberOfTerr() {
		return terr_sub_numberOfTerr;
	}

	public void setTerr_sub_numberOfTerr(Integer terr_sub_numberOfTerr) {
		this.terr_sub_numberOfTerr = terr_sub_numberOfTerr;
	}

	public Integer getTerr_sub_numberOfCas() {
		return terr_sub_numberOfCas;
	}

	public void setTerr_sub_numberOfCas(Integer terr_sub_numberOfCas) {
		this.terr_sub_numberOfCas = terr_sub_numberOfCas;
	}

}
