package com.cloud.vod.entity;

import java.util.Calendar;

public class Website {
	private int id;
	private String name;
	private int enable;
	private String weburl;
	private int parentid;
	private int type;
	private Calendar createtime;
	private Calendar updatetime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public String getWeburl() {
		return weburl;
	}
	public void setWeburl(String weburl) {
		this.weburl = weburl;
	}
	public int getParentid() {
		return parentid;
	}
	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Calendar getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Calendar createtime) {
		this.createtime = createtime;
	}
	public Calendar getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Calendar updatetime) {
		this.updatetime = updatetime;
	}

}
