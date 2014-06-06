/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package moviecrud.common;

import java.io.File;
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Administrator
 */
public class Util {

    private static String imgDir = "img";

    public static boolean validateImageType(MultipartFile image) {
        if (!image.getContentType().equals("image/jpeg")) {
            return false;
        } else {
            return true;
        }
    }

    public static void saveImage(String webRoot, MultipartFile image, String fileName) {
        try {
            File file = new File(webRoot + imgDir + "/" + fileName + ".jpg");
            FileUtils.writeByteArrayToFile(file, image.getBytes());
        } catch (Exception ex) {
            throw new RuntimeException("Something wrong while");
        }
    }

    /**
     * Generates image file name from movie name. For eg if the movie name is
     * Dark Knight, the file name would be Dark_Knight
     *
     * @param movie_name
     * @return
     */
    public static String generateImageName(String movie_name) {

        String image_name = movie_name.replaceAll("\\s", "_");
        return image_name;
    }

    public static void main(String[] args) {
        System.out.println("" + Util.generateImageName("The Dark Knight Rises"));
    }
}
