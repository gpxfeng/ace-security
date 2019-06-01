package com.cloud.vod.entity;

public class Dramainfo {
	private int id;
	private String name;
	private int enable;
	private String imageurl;
	private String cateid;
	private String createtime;
	private String updatetime;
	private int type;
	private String filepath;
	private String duration;
	private String director;
	private String actors;
	private String rdate;
	private String description;

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getEnable() {
		return this.enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	public String getImageurl() {
		return this.imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

	public String getCateid() {
		return this.cateid;
	}

	public void setCateid(String cateid) {
		this.cateid = cateid;
	}

	public String getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getUpdatetime() {
		return this.updatetime;
	}

	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}

	public int getType() {
		return this.type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getFilepath() {
		return this.filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getDuration() {
		return this.duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getDirector() {
		return this.director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActors() {
		return this.actors;
	}

	public void setActors(String actors) {
		this.actors = actors;
	}

	public String getRdate() {
		return this.rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Dramainfo [id=" + this.id + ", name=" + this.name + ", enable=" + this.enable + ", imageurl="
				+ this.imageurl + ", cateid=" + this.cateid + ", createtime=" + this.createtime + ", updatetime="
				+ this.updatetime + ", type=" + this.type + ", filepath=" + this.filepath + ", duration="
				+ this.duration + ", director=" + this.director + ", actors=" + this.actors + ", rdate=" + this.rdate
				+ ", description=" + this.description + "]";
	}

	public Dramainfo(int id, String name, int enable, String imageurl, String cateid, String createtime,
			String updatetime, int type, String filepath, String duration, String director, String actors, String rdate,
			String description) {
		this.id = id;
		this.name = name;
		this.enable = enable;
		this.imageurl = imageurl;
		this.cateid = cateid;
		this.createtime = createtime;
		this.updatetime = updatetime;
		this.type = type;
		this.filepath = filepath;
		this.duration = duration;
		this.director = director;
		this.actors = actors;
		this.rdate = rdate;
		this.description = description;
	}

	public Dramainfo() {
	}

	public Dramainfo(String name, int enable, String imageurl, String cateid, String createtime, String updatetime,
			int type, String filepath, String duration, String director, String actors, String rdate,
			String description) {
		this.name = name;
		this.enable = enable;
		this.imageurl = imageurl;
		this.cateid = cateid;
		this.createtime = createtime;
		this.updatetime = updatetime;
		this.type = type;
		this.filepath = filepath;
		this.duration = duration;
		this.director = director;
		this.actors = actors;
		this.rdate = rdate;
		this.description = description;
	}
}
