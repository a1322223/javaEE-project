package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.MultipartFilter;

import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("upload")
public class UploadController extends BaseController {
    public static final String PHOTO_PATH = "/assets/photos";

    @RequestMapping("test")
    private String test(@RequestParam MultipartFile[] photos) throws IOException {
        String photoPath = application.getRealPath(PHOTO_PATH);
        for (MultipartFile photo : photos) {
            photo.transferTo(new File(photoPath, System.nanoTime() + ".png"));
        }
        return "redirect:/upload-test.jsp";
    }
}
