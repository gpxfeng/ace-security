package com.cloud.vod.entity;

public class Category {
    /**
     * 种类id，主键
     */
    private int id;
    /**
     * 名称
     */
    private String name;
    /**
     * 图片地址
     */
    private String imageurl;
    /**
     * 文件路径
     */
    private String filepath;
    /**
     * 有效
     */
    private int enable;
    /**
     * 创建时间
     */
    private String createtime;
    /**
     * 修改时间
     */
    private String updatetime;
    /**
     * 1:vod,2:美剧,3:18+
     */
    private int type;
    /**
     * 例子
     */
    private int pushstate;
    /**
     * 媒体地址
     */
    private String mediaurl;
    /**
     * p2p地址
     */
    private String p2purl;
    /**
     * 端口
     */
    private int port;

    private int pasepage;
    /**
     * 图片路径
     */
    private String imgpath;

    private String subtitlepath;

    private String passwd;

    private int sequence;


    /**
	 * @return the sequence
	 */
	public int getSequence() {
		return sequence;
	}
	/**
	 * @param sequence the sequence to set
	 */
	public void setSequence(int sequence) {
		this.sequence = sequence;
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
    public String getImageurl() {
        return imageurl;
    }
    public void setImageurl(String imageurl) {
        this.imageurl = imageurl;
    }
    public String getFilepath() {
        return filepath;
    }
    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }
    public int getEnable() {
        return enable;
    }
    public void setEnable(int enable) {
        this.enable = enable;
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
    public int getPushstate() {
        return pushstate;
    }
    public void setPushstate(int pushstate) {
        this.pushstate = pushstate;
    }
    public String getMediaurl() {
        return mediaurl;
    }
    public void setMediaurl(String mediaurl) {
        this.mediaurl = mediaurl;
    }
    public String getP2purl() {
        return p2purl;
    }
    public void setP2purl(String p2purl) {
        this.p2purl = p2purl;
    }
    public int getPort() {
        return port;
    }
    public void setPort(int port) {
        this.port = port;
    }
    public int getPasepage() {
        return pasepage;
    }
    public void setPasepage(int pasepage) {
        this.pasepage = pasepage;
    }
    public String getImgpath() {
        return imgpath;
    }
    public void setImgpath(String imgpath) {
        this.imgpath = imgpath;
    }
    public String getSubtitlepath() {
        return subtitlepath;
    }
    public void setSubtitlepath(String subtitlepath) {
        this.subtitlepath = subtitlepath;
    }
    public String getPasswd() {
        return passwd;
    }
    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

	/**
	* @see Object#toString()
	* @Function: Category.java
	* @Description: 该函数的功能描述
	*
	* @param:描述1描述
	* @return：返回结果描述
	* @throws：异常描述
	*
	* @version: v1.0.0
	* @author: yuxianfeng
	* @date: 2018年12月7日 下午4:39:20
	*
	* Modification History:
	* Date         Author          Version            Description
	*---------------------------------------------------------*
	* 2018年12月7日     Administrator           v1.0.0               修改原因
	*/
	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", imageurl=" + imageurl + ", filepath=" + filepath
				+ ", enable=" + enable + ", createtime=" + createtime + ", updatetime=" + updatetime + ", type=" + type
				+ ", pushstate=" + pushstate + ", mediaurl=" + mediaurl + ", p2purl=" + p2purl + ", port=" + port
				+ ", pasepage=" + pasepage + ", imgpath=" + imgpath + ", subtitlepath=" + subtitlepath + ", passwd="
				+ passwd + ", sequence=" + sequence + "]";
	}
	/**
	* @Function: Category.java
	* @Description: 该函数的功能描述
	*
	* @param:参数描述
	* @version: v1.0.0
	* @author: yuxianfeng
	* @date: 2018年12月7日 下午4:39:11
	*/
	public Category(int id, String name, String imageurl, String filepath, int enable, String createtime,
			String updatetime, int type, int pushstate, String mediaurl, String p2purl, int port, int pasepage,
			String imgpath, String subtitlepath, String passwd, int sequence) {
		super();
		this.id = id;
		this.name = name;
		this.imageurl = imageurl;
		this.filepath = filepath;
		this.enable = enable;
		this.createtime = createtime;
		this.updatetime = updatetime;
		this.type = type;
		this.pushstate = pushstate;
		this.mediaurl = mediaurl;
		this.p2purl = p2purl;
		this.port = port;
		this.pasepage = pasepage;
		this.imgpath = imgpath;
		this.subtitlepath = subtitlepath;
		this.passwd = passwd;
		this.sequence = sequence;
	}
	public Category() {
		super();
	}

}
