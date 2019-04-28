/**
 * 
 */
package DTO;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author dell
 */
public class LoginDTO {
    private String userid;
    private String usertype;
    private String password;

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public void setPassword(String password) {
        this.password = password;
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
    
    
}

