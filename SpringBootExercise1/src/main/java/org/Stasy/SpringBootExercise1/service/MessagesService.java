package org.Stasy.SpringBootExercise1.service;

import org.Stasy.SpringBootExercise1.controller.MessagesRepository;
import org.Stasy.SpringBootExercise1.model.Messages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

/**this  is the class  where we write CRUD methods by Autowiring a repo which has all the methods of JpaRepository. i.e., CRUD **/
/**所以如果在這裡要寫CRUD方法，要點進去JpaRepository的documentation裏面看**/

@Service
public class MessagesService{  //我原本是直覺寫成implements因為我想說MessagesService就可以直接繼承所有Repository的方法了，但到Spring時是直接繼承：public class MessagesService implements MessagesRepository
    @Autowired
    private MessagesRepository msgRepo;

    //Create(C)
    public void addMessage(Messages msg){
        msgRepo.save(msg);
    }

    //Read(R)
    public Messages findMessagesById(Integer id){
        Optional<Messages> option=msgRepo.findById(id);

        if(option.isEmpty()){   //!!因為 Generics無法比較說，如果這個Generics等於null or not，所以是比記憶體位置
            return null;
        }
        return option.get();
    }

    //Update(U)
    //因為是我們自己寫的方法，所以需要把繼承的@SimpleRepository(readOnly)蓋過去
    @Transactional
    public Messages updateById(Integer id, String newText){
        Optional<Messages> option=msgRepo.findById(id);

        if(option.isPresent()){
            Messages msg=option.get();
            msg.setText(newText);
            return msg;
        }
        return null;
    }

    //D(Delete)
    public void deleteMessagesById(Integer id){
        msgRepo.deleteById(id);
    }

    //this is also a method  we  wrote by ourselves
    public Messages getLatest(){
        return msgRepo.findFirstByOrderByDateDesc();

    }

    //query page
    //a paginated list of Messages 寫成 Page<Messages>
    public Page<Messages> findMsgByPage(Integer pageNumber){
        Pageable pgb= PageRequest.of(pageNumber-1,3, Sort.Direction.ASC,"date");
        Page<Messages> pg =msgRepo.findAll(pgb);
        return pg;
    }

}
