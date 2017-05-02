package com.luong.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Luong-PC on 4/24/2017.
 */
@Entity
@Table(name = "following")
public class Following {
    @Id
    @Column(name = "id_following")
    @GeneratedValue()
    private int id_following;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false, foreignKey = @ForeignKey(name = "following_ibfk_1"))
    private User user_followed;

    @ManyToOne
    @JoinColumn(name = "following_id", nullable = false, foreignKey = @ForeignKey(name = "following_ibfk_2"))
    private User user_following;

    public Following(){super();}
    public Following(int id_following,User user_followed,User user_following){
        super();
        this.id_following = id_following;
        this.user_followed = user_followed;
        this.user_following = user_following;
    }

    public int getId_following() {
        return id_following;
    }

    public void setId_following(int id_following) {
        this.id_following = id_following;
    }

    public User getUser_followed() {
        return user_followed;
    }

    public void setUser_followed(User user_followed) {
        this.user_followed = user_followed;
    }

    public User getUser_following() {
        return user_following;
    }

    public void setUser_following(User user_following) {
        this.user_following = user_following;
    }
}
