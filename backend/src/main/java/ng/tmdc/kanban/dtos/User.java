package ng.tmdc.kanban.dtos;

public class User {
    // Default Constructor
    public User() {
    }

    // Parameterized Constructor
    public User(long userId, String name, String email) {
        this.userId = userId;
        this.name = name;
        this.email = email;
    }

    private long userId;
    private String name;
    private String email;

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getId() {
        return userId;
    }

    public void setId(long userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
