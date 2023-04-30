package org.Stasy.SpringBootExercise1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author Hoxton
 * @version 0.1.0
 * @since 0.1.0
 **/
@Controller
public class ViewController {
    @GetMapping("/")
    public String index(){
        System.out.println("I am  Here");
        return "index";
    }
}