package moviecrud.dao;

import java.util.*;

import javax.sql.DataSource;

import moviecrud.model.Movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class SearchDao {

	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<Movie> getSearchByMovieName(List<String> filteredSearchTokens) {

		List<Movie> movieList = new ArrayList<Movie>();
		String sql = "SELECT * FROM movie_details WHERE MATCH(`movie_name`) AGAINST (? IN BOOLEAN MODE);";

		String searchParam = filteredSearchTokens.get(0);
		for (int i = 1; i < filteredSearchTokens.size(); i++) {
			String s = filteredSearchTokens.get(i);
			searchParam += "\\s" + s;
		}

		List<Map<String, Object>> movieMap = jdbcTemplate.queryForList(sql,
				searchParam);

		for (Map map : movieMap) {
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

}
