/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package moviecrud.validator;

import moviecrud.model.Movie;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author Administrator
 */
public class AddMovieValidator implements Validator{
    
    @Override
    public boolean supports(Class clazz) {
        //just validate the Customer instances
        return Movie.class.isAssignableFrom(clazz);
    }
    
    @Override
    public void validate(Object target,Errors errors )
    {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"movie_name","required.movie_name");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"actor","required.actor");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"director","required.director");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"movie_detail","required.movie_detail");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"movie_year","required.movie_year");
    }
}
