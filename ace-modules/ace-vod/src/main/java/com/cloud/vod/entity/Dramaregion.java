package com.cloud.vod.entity;

public class Dramaregion {
    /**
     * 种类id，主键
     */
    private int id;
    /**
     * 名称
     */
    private String name;
    /**
     * 有效
     */
    private int enable;
    /**
     * 排序序号
     */
    private int sequence;
    /**
     * 类型
     */
    private int type;

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

    public int getSequence() {
        return sequence;
    }

    public void setSequence(int sequence) {
        this.sequence = sequence;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Dramaregion() {
    }

    public Dramaregion(int id, String name, int enable, int sequence, int type) {
        this.id = id;
        this.name = name;
        this.enable = enable;
        this.sequence = sequence;
        this.type = type;
    }

    @Override
    public String toString() {
        return "Dramaregion{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", enable=" + enable +
                ", sequence=" + sequence +
                ", type=" + type +
                '}';
    }
}
