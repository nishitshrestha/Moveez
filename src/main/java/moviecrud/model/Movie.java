/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package moviecrud.model;

import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author nishit
 */
public class Movie {

    private int movie_id;
    @NotEmpty(message="Movie name cannot be empty")
    private String movie_name;
    @NotEmpty(message="Actor name cannot be empty")
    private String actor;
    @NotEmpty(message="Actress name cannot be empty")
    private String actress;
    @NotEmpty(message="Director name cannot be empty")
    private String director;

    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    public String getMovie_name() {
        return movie_name;
    }

    public void setMovie_name(String movie_name) {
        this.movie_name = movie_name;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getActress() {
        return actress;
    }

    public void setActress(String actress) {
        this.actress = actress;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }
}
