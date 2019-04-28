/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author dell
 */
public class TeamDetailDTO {
    private String userid;
    private String course;
    private String collage;
    private String name;
    private String branch;
    private String eno;
    private String semester;
    private String year;

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public void setCollage(String collage) {
        this.collage = collage;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public void setEno(String eno) {
        this.eno = eno;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getUserid() {
        return userid;
    }

    public String getCourse() {
        return course;
    }

    public String getCollage() {
        return collage;
    }

    public String getName() {
        return name;
    }

    public String getBranch() {
        return branch;
    }

    public String getEno() {
        return eno;
    }

    public String getSemester() {
        return semester;
    }

    public String getYear() {
        return year;
    }
}
