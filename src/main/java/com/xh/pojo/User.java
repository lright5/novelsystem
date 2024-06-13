package com.xh.pojo;

/**
 * @author:Teacher黄
 * @date:Created at 2019/07/03
 */

public class User {

    private Integer id;

    private String userName;

    private String userAge;


    public User() {
    }



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserAge() {
        return userAge;
    }

    public void setUserAge(String userAge) {
        this.userAge = userAge;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", userAge='" + userAge + '\'' +
                '}';
    }
}
