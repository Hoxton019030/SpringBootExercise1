package org.Stasy.SpringBootExercise1.model;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;

@Entity
@Table(name="messages")
public class Messages{

    //attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;

    @Column(name="text",columnDefinition = "nvarchar(200)",nullable = true)
    private String text;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss EEEE")
    @Temporal(TemporalType.TIMESTAMP) //TIMESTAMP="Time"(Hour, Minutes, Second) + "Date", 3 choices: "Time","Date","TimeStamp"
    @DateTimeFormat(pattern="yyyy/MM/dd HH:mm:ss")
    @Column(name="date_added",columnDefinition = "datetime")
    private Date date;

    //getters and setters
    //getters
    public Integer getId(){
        return id;
    }

    public String getText(){
        return text;
    }

    public Date getDate(){
        return date;
    }

    //setters
    public void setId(Integer id){
        this.id=id;
    }

    public void setText(String text){
        this.text=text;
    }

    public void setDate(Date date){
        this.date=date;
    }

    //constructor
    public Messages(){}

    //method to check if Date is null
    @PrePersist
    public void checkDate(){
        if(date==null){
            date=new Date();
        }
    }
}