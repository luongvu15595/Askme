package com.luong.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Luong-PC on 4/24/2017.
 */
@Entity
@Table(name = "followed")
public class Followed{
    @Id
    @Column(name = "id_followed")
    @GeneratedValue()
    private int id_followed;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false, foreignKey = @ForeignKey(name = "followed_ibfk_1"))
    private User user_following;

    @ManyToOne
    @JoinColumn(name = "followed_id", nullable = false, foreignKey = @ForeignKey(name = "followed_ibfk_1"))
    private User user_followed;

    public Followed(){super();}
    public Followed(int id_followed,User user_followed,User user_following){
        super();
        this.id_followed = id_followed;
        this.user_followed = user_followed;
        this.user_following = user_following;
    }

    public int getId_followed() {
        return id_followed;
    }

    public void setId_followed(int id_followed) {
        this.id_followed = id_followed;
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
