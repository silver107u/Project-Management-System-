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
public class SingUpDTO {
        private String userid;
        private String usertype;
        private String password;
        private String emailid;

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
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

    public String getPassword() {
        return password;
    }

    public String getEmailid() {
        return emailid;
    }
}
