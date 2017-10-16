package Shared;

public class User {

private int id;
private String username;
private Character password;
private int studentNumber;
private int type;


    public User(String username, Character password, int studentNumber) {
    this.username = username;
    this.password = password;
    this.studentNumber = studentNumber;

}
    public User(int id) {
        this.id = id;
    }
    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public Character getPassword() {
        return password;
    }

    public int getStudentNumber() {
        return studentNumber;
    }

    public int getType() {
        return type;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(Character password) {
        this.password = password;
    }

    public void setStudentNumber(int studentNumber) {
        this.studentNumber = studentNumber;
    }

    public void setType(int type) {
        this.type = type;
    }


}



