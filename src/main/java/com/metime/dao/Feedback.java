package com.metime.dao;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "feedback")
public class Feedback {
	
	@EmbeddedId
    private FeedbackKey id;

    @ManyToOne
    @MapsId("tripId")
    @JoinColumn(name = "trip_id")
    private Trips trip;
    
    
    @ManyToOne
    @MapsId("username")
    @JoinColumn(name = "username")
    private User user;

    private int ratings;
    private String reviews;
    private LocalDateTime timestamp;

    // Getters and setters
    
}

