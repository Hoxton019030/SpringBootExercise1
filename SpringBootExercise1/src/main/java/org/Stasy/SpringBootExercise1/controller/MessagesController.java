package org.Stasy.SpringBootExercise1.controller;

import org.Stasy.SpringBootExercise1.model.Messages;
import org.Stasy.SpringBootExercise1.service.MessagesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**use mapping to map the string with uri**/
/** prefix + mapping_String + suffix === uri **/
@Controller
public class MessagesController {

    /**attribute **/
    @Autowired
    private MessagesService msgService;

    /**uri mappings with HTTPRequests**/
    @GetMapping("/message/addMessages")
    public String addMessages(Model model){

        Messages latest=msgService.getLatest();
        model.addAttribute("latest",latest);
        model.addAttribute("msg",new Messages());

        return "message/addMessages";
    }

    /**"model" is an interface in Spring MVC **/
        /**
         *     //Create(C)
         *     public void addMessage(Messages msg){
         *         msgRepo.save(msg);
         *     }
         *
         */


    @PostMapping("/message/postMessages")
    public String postMessages(@ModelAttribute("formMessages") Messages formMessages, @ModelAttribute("emptyMessages") Messages emptyMessages, Model model) {

        //formMessages 是已經存在的，從前端傳來後端的。直接save就可以了。formMessages已經不需要再經過Model運行在前後端了。
        msgService.addMessage(formMessages);

        //emptyMessages是我們需要自己new的，讓使用者可以看到被清空的空白的text input area，要再傳回前端。
        emptyMessages = new Messages();
        model.addAttribute("emptyMessages", emptyMessages);

        // 使用者最latest submitted的訊息會被取得，之後再呈現在jsp頁面上。因為還要之後再呈現在前端，所以需要透過Model卸貨了。
        Messages latest = msgService.getLatest();
        model.addAttribute("latest", latest);

        return "message/addMessages";
    }

    @GetMapping("/message/showMessages")
    public String showMessages(@RequestParam(name="page",defaultValue="1") Integer pageNumber, Model model){
        Page<Messages>page=msgService.findMsgByPage(pageNumber);
        model.addAttribute("page",page);
        return "/message/showMessages";
    }

    @GetMapping("/message/editMessages")  //前端傳進來的參數叫做name="id", 後端（也就是這裡）處理傳進來的參數時，這個參數叫做Integer id
    public String editMessagesById(@RequestParam(name="id") Integer id, Model model){
        Messages msg=msgService.findMessagesById(id);
        model.addAttribute("msg",msg);
        return "/message/editMessages";
    }

    @PutMapping("/message/editMessages")
    public String putEditedMessages(@ModelAttribute("messages") Messages msg){
        msgService.updateById(msg.getId(),msg.getText());
        return "redirect:/message/showMessages";
    }

    @DeleteMapping("/message/deleteMessages")
    public String deleteMessages(@RequestParam Integer id) {
        msgService.deleteMessagesById(id);
        return "redirect:/message/showMessages";
    }

    @GetMapping("/message/ajaxMessages")
    public String ajaxPage(){
        return "message/ajaxMessages";
    }

    //RESTful
    @ResponseBody
    @PostMapping("/api/message/post")
    public Page<Messages> postMessageApi(@RequestBody Messages msg) {
        msgService.addMessage(msg);
        Page<Messages> page = msgService.findMsgByPage(1);
        return page;
    }

}
