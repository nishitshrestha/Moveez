/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package moviecrud.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import moviecrud.model.Movie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

/**
 *
 * @author nishit
 */
public class moviedao {
    
    private DataSource dataSource;
    private JdbcTemplate jdbcTemplate;
    
    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    public List<Movie> getAllMovieDetails() {
        String sql = "SELECT * FROM movie_details;";
        
        List<Movie> movieList = new ArrayList<Movie>();
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
        
        for (Map map : rows) {
            Movie movie = new Movie();
            movie.setMovie_name(String.valueOf(map.get("movie_name")));
            movie.setActor(String.valueOf(map.get("actor_name")));
            movie.setActress(String.valueOf(map.get("actress_name")));
            movie.setDirector((String) map.get("director_name"));
            movie.setMovie_id((Integer) map.get("movie_id"));
            
            movieList.add(movie);
        }
        
        return movieList;
    }
    
    public Movie getMovieDetailById(String movie_id) {
        String sql = "SELECT * FROM movie_details where movie_id=?";
        
        return jdbcTemplate.queryForObject(sql, new ParameterizedRowMapper<Movie>() {
            public Movie mapRow(ResultSet rs, int i) throws SQLException {
                Movie movie = new Movie();
                movie.setMovie_id(rs.getInt("movie_id"));
                movie.setMovie_name(rs.getString("movie_name"));
                movie.setActor(rs.getString("actor_name"));
                movie.setActress(rs.getString("actress_name"));
                movie.setDirector(rs.getString("director_name"));
                
                return movie;
            }
        }, Integer.parseInt(movie_id));
    }
    
    public void insertMovieDetail(Movie movie) {
        String sql = "INSERT INTO movie_details(movie_name,actor_name,actress_name,director_name) values(?,?,?,?);";
        jdbcTemplate.update(sql, movie.getMovie_name(), movie.getActor(), movie.getActress(), movie.getDirector());
    }
    
    public void deleteMovie(int movie_id) {
        String sql = "DELETE FROM movie_details WHERE movie_id=?;";
        jdbcTemplate.update(sql, movie_id);
    }
    
    public void updateMovie(Movie movie) {
        String sql = "UPDATE movie_details SET movie_name=?,actor_name=?,actress_name=?,director_name=? WHERE movie_id=?;";
        jdbcTemplate.update(sql, movie.getMovie_name(), movie.getActor(), movie.getActress(), movie.getDirector(), movie.getMovie_id());
    }
}
