package com.cloud.vod.entity;

public class Videoinfo {
	private int id;
	private String name;
	private String videourl;
	private String pageurl;
	private String imageurl;
	private String filepath;
	private String subtitle;
	private int enable;
	private String createtime;
	private String updatetime;
	private int cateid;
	private int dramaid;
	private int type;
	private int num;
	private int temp;
	private String p2purl;
	private String language;
	private String quality;

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

	public String getVideourl() {
		return this.videourl;
	}

	public void setVideourl(String videourl) {
		this.videourl = videourl;
	}

	public String getPageurl() {
		return this.pageurl;
	}

	public void setPageurl(String pageurl) {
		this.pageurl = pageurl;
	}

	public String getImageurl() {
		return this.imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

	public String getFilepath() {
		return this.filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getSubtitle() {
		return this.subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public int getEnable() {
		return this.enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
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

	public int getCateid() {
		return this.cateid;
	}

	public void setCateid(int cateid) {
		this.cateid = cateid;
	}

	public int getDramaid() {
		return this.dramaid;
	}

	public void setDramaid(int dramaid) {
		this.dramaid = dramaid;
	}

	public int getType() {
		return this.type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getNum() {
		return this.num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getTemp() {
		return this.temp;
	}

	public void setTemp(int temp) {
		this.temp = temp;
	}

	public String getP2purl() {
		return this.p2purl;
	}

	public void setP2purl(String p2purl) {
		this.p2purl = p2purl;
	}

	public String getLanguage() {
		return this.language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getQuality() {
		return this.quality;
	}

	public void setQuality(String quality) {
		this.quality = quality;
	}

	@Override
	public String toString() {
		return "Videoinfo [id=" + this.id + ", name=" + this.name + ", videourl=" + this.videourl + ", pageurl="
				+ this.pageurl + ", imageurl=" + this.imageurl + ", filepath=" + this.filepath + ", subtitle="
				+ this.subtitle + ", enable=" + this.enable + ", createtime=" + this.createtime + ", updatetime="
				+ this.updatetime + ", cateid=" + this.cateid + ", dramaid=" + this.dramaid + ", type=" + this.type
				+ ", num=" + this.num + ", temp=" + this.temp + ", p2purl=" + this.p2purl + ", language="
				+ this.language + ", quality=" + this.quality + "]";
	}

	public Videoinfo(String name, String imageurl, String filepath, String subtitle, int enable, String createtime,
			String updatetime, int cateid, int dramaid, int type, int num, int temp, String language, String quality) {
		this.name = name;
		this.imageurl = imageurl;
		this.filepath = filepath;
		this.subtitle = subtitle;
		this.enable = enable;
		this.createtime = createtime;
		this.updatetime = updatetime;
		this.cateid = cateid;
		this.dramaid = dramaid;
		this.type = type;
		this.num = num;
		this.temp = temp;
		this.language = language;
		this.quality = quality;
	}

	public Videoinfo(int id, String name, String videourl, String pageurl, String imageurl, String filepath,
			String subtitle, int enable, String createtime, String updatetime, int cateid, int dramaid, int type,
			int num, int temp, String p2purl, String language, String quality) {
		this.id = id;
		this.name = name;
		this.videourl = videourl;
		this.pageurl = pageurl;
		this.imageurl = imageurl;
		this.filepath = filepath;
		this.subtitle = subtitle;
		this.enable = enable;
		this.createtime = createtime;
		this.updatetime = updatetime;
		this.cateid = cateid;
		this.dramaid = dramaid;
		this.type = type;
		this.num = num;
		this.temp = temp;
		this.p2purl = p2purl;
		this.language = language;
		this.quality = quality;
	}

	public Videoinfo() {
	}
}
