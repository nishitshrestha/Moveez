/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package moviecrud.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import moviecrud.model.Movie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

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

    /**
     * Get Top 5 recently uploaded movies
     *
     * @return
     */
    public List<Movie> getAllMovieDetails() {
        String sql = "SELECT * FROM movie_details ORDER BY added_date DESC LIMIT 0,5;";

        List<Movie> movieList = new ArrayList<Movie>();
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);

        for (Map map : rows) {
            Movie movie = new Movie();
            movie.setMovie_name(String.valueOf(map.get("movie_name")));
            movie.setActor(String.valueOf(map.get("stars_name")));
            movie.setDirector((String) map.get("director_name"));
            movie.setMovie_id((Integer) map.get("movie_id"));
            movie.setMovie_detail((String) map.get("movie_detail"));
            movie.setMovie_year((String) map.get("released_year"));
            movie.setMovie_img((String) map.get("movie_img"));

            movieList.add(movie);
        }

        return movieList;
    }
    /*  public Movie getMovieDetailById(String movie_id) {
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
     */

    public void insertMovieDetail(Movie movie) {
        String sql = "INSERT INTO movie_details(movie_name,stars_name,director_name,released_year,movie_detail,added_date,movie_img) values(?,?,?,?,?,NOW(),?);";
        jdbcTemplate.update(sql, movie.getMovie_name(), movie.getActor(), movie.getDirector(), movie.getMovie_year(), movie.getMovie_detail(), movie.getMovie_img());
    }
    /*
     public void deleteMovie(int movie_id) {
     String sql = "DELETE FROM movie_details WHERE movie_id=?;";
     jdbcTemplate.update(sql, movie_id);
     }
    
     public void updateMovie(Movie movie) {
     String sql = "UPDATE movie_details SET movie_name=?,actor_name=?,actress_name=?,director_name=? WHERE movie_id=?;";
     jdbcTemplate.update(sql, movie.getMovie_name(), movie.getActor(), movie.getActress(), movie.getDirector(), movie.getMovie_id());
     }    */
}
