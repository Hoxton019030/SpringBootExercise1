package org.Stasy.SpringBootExercise1.controller;

import org.Stasy.SpringBootExercise1.model.Messages;
import org.springframework.data.jpa.repository.JpaRepository;

//by extending JpaRepository, you have the JpaRepository function for CRUD
public interface MessagesRepository extends JpaRepository<Messages,Integer> {
    Messages findFirstByOrderByDateDesc();
}
