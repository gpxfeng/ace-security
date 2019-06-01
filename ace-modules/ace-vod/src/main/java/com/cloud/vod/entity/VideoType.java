package com.cloud.vod.entity;

public class VideoType {
    /**
     * 种类id，主键
     */
    private int id;
    /**
     * 名称
     */
    private String name;
    /**
     * 类型
     */
    private String type;
    /**
     *
     */
    private String icon;
    /**
     * 类型
     */
    private String enable;

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable;
    }

    public VideoType(int id, String name, String type, String icon, String enable) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.icon = icon;
        this.enable = enable;
    }

    public VideoType() {
    }

    @Override
    public String toString() {
        return "VideoInfoType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", icon='" + icon + '\'' +
                ", enable='" + enable + '\'' +
                '}';
    }
}
