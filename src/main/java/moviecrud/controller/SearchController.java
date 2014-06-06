package moviecrud.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moviecrud.common.*;
import moviecrud.dao.SearchDao;
import moviecrud.model.Movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {

	@Autowired
	SearchDao searchDao;

	@RequestMapping(value = "/search.view", method = RequestMethod.GET)
	public String searchMovieName(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "name", required = true) String movie_name,
			ModelMap model) {
		SearchUtil searchUtil = new SearchUtil();
		String[] searchTokens = movie_name.split("\\s");
		List<String> filteredQuery = searchUtil
				.removeIgnoreWordsFromSearchQuery(searchTokens);

		List<Movie> movieList = searchDao.getSearchByMovieName(filteredQuery);

		model.put("searchList", movieList);

		return "search";

	}

}
