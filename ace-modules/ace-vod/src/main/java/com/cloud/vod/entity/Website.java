package com.cloud.vod.entity;

import lombok.Data;

import java.util.Calendar;

@Data
public class Website {
	private int id;
	private String name;
	private int enable;
	private String weburl;
	private int parentid;
	private int type;
	private Calendar createtime;
	private Calendar updatetime;

}
