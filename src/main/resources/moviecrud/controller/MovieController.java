/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package moviecrud.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import moviecrud.dao.moviedao;
import moviecrud.model.Movie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author nishit
 */
@Controller
public class MovieController {

    @Autowired
    private moviedao mdao;

    @RequestMapping(value = "/moviedetail.view")
    public String homePage(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

        List<Movie> allMovieDetails = mdao.getAllMovieDetails();
        model.put("movieList", allMovieDetails);
        return "moviedetail";
    }

    @RequestMapping(value = "/details.view")
    public String getMovieFullDetail(@RequestParam("id") String movie_id, ModelMap model, @RequestParam(value = "msg", required = false) String msg) {
        System.out.println("In movie full detail");
        Movie movie = mdao.getMovieDetailById(movie_id);
        model.put("movie", movie);
        model.put("msg", msg);
        return "details";
    }

    @RequestMapping(value = "/newmovie.view")
    public String insertNewMovie(@ModelAttribute("newMovie") Movie movie, ModelMap model) {
        model.put(BindingResult.MODEL_KEY_PREFIX + "newMovie",
                model.get("errors"));
        return "newmovie";
    }

    @RequestMapping(value = "/insertMovie.do", method = RequestMethod.POST)
    public String addNewMovie(@Valid @ModelAttribute("newMovie") Movie movie, BindingResult result, ModelMap model, RedirectAttributes redirectAttr) {
        if (result.hasErrors()) {
            redirectAttr.addFlashAttribute("errors", result);
            redirectAttr.addFlashAttribute("newMovie", movie);
            return "redirect:newmovie.view";
        }
        mdao.insertMovieDetail(movie);
        redirectAttr.addFlashAttribute("msg", "Your Data has been successfully entered");
        return "redirect:newmovie.view";
    }

    @RequestMapping(value = "/delete.do")
    public String deleteMovie(@RequestParam(value = "id") String id, RedirectAttributes attr) {
        mdao.deleteMovie(Integer.parseInt(id));
        String msg = "Record Deleted Successfully";
        attr.addFlashAttribute("msg", msg);
        return "redirect:moviedetail.view";
    }

    @RequestMapping(value = "/editmovie.view")
    public String editMovie(@RequestParam("id") String id, ModelMap model, @ModelAttribute("movie") Movie movie) {
        model.put(BindingResult.MODEL_KEY_PREFIX + "movie", model.get("errors"));
        Movie moviedb = mdao.getMovieDetailById(id);
        movie.setMovie_id(moviedb.getMovie_id());
        movie.setMovie_name(moviedb.getMovie_name());
        movie.setActor(moviedb.getActor());
        movie.setActress(moviedb.getActress());
        movie.setDirector(moviedb.getDirector());
        return "editmovie";

    }

    @RequestMapping(value = "/editmovie.do")
    public String editMovieDo(@Valid @ModelAttribute("movie") Movie movie, BindingResult result, ModelMap model , RedirectAttributes redirectAttr ) {
        if (result.hasErrors()) {
            redirectAttr.addFlashAttribute("errors", result);
            redirectAttr.addFlashAttribute("movie", movie);
            return "redirect:editmovie.view?id=" + movie.getMovie_id();
        }
        mdao.updateMovie(movie);
        String msg = "Record Updated Successfully";
        model.put("msg", msg);
        return "redirect:details.view?id=" + movie.getMovie_id();
    }
}
