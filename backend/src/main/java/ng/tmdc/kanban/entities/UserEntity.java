package ng.tmdc.kanban.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class UserEntity {
    private @Id

    @GeneratedValue Long id;

    private String name;

    private String email;

    private String password;

    protected UserEntity() {}

    public UserEntity(String name, String email, String password) {
        this.id = null;
        this.name = name;
        this.email = email;
        this.password = password;
    }
}
