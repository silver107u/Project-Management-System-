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
public class AddmentorDTO {
    private String userid;
    private String usertype;
    private String name;
    private String expert;
    private String designation;
    private String password;
    private String emailid;

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setExpert(String expert) {
        this.expert = expert;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public String getUserid() {
        return userid;
    }

    public String getUsertype() {
        return usertype;
    }

    public String getName() {
        return name;
    }

    public String getExpert() {
        return expert;
    }

    public String getDesignation() {
        return designation;
    }

    public String getPassword() {
        return password;
    }

    public String getEmailid() {
        return emailid;
    }
}
