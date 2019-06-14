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
	private String regionid;
	private String description;

	public Dramainfo() {
	}

	public Dramainfo(int id, String name, int enable, String imageurl, String cateid, String createtime, String updatetime, int type, String filepath, String duration, String director, String actors, String rdate, String regionid, String description) {
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
		this.regionid = regionid;
		this.description = description;
	}

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

	public String getImageurl() {
		return imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

	public String getCateid() {
		return cateid;
	}

	public void setCateid(String cateid) {
		this.cateid = cateid;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActors() {
		return actors;
	}

	public void setActors(String actors) {
		this.actors = actors;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getRegionid() {
		return regionid;
	}

	public void setRegionid(String regionid) {
		this.regionid = regionid;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Dramainfo{" +
				"id=" + id +
				", name='" + name + '\'' +
				", enable=" + enable +
				", imageurl='" + imageurl + '\'' +
				", cateid='" + cateid + '\'' +
				", createtime='" + createtime + '\'' +
				", updatetime='" + updatetime + '\'' +
				", type=" + type +
				", filepath='" + filepath + '\'' +
				", duration='" + duration + '\'' +
				", director='" + director + '\'' +
				", actors='" + actors + '\'' +
				", rdate='" + rdate + '\'' +
				", regionid='" + regionid + '\'' +
				", description='" + description + '\'' +
				'}';
	}
}
