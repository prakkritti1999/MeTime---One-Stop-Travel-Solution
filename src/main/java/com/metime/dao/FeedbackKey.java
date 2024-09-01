package com.metime.dao;

import java.io.Serializable;

import jakarta.persistence.Embeddable;
import lombok.Getter;
import lombok.Setter;

@SuppressWarnings("serial")
@Setter
@Getter
@Embeddable
public class FeedbackKey implements Serializable {
    private Long tripId;
    private String username;

    // Default constructor
    public FeedbackKey() {}

    // Parameterized constructor
    public FeedbackKey(Long tripId, String username) {
        this.tripId = tripId;
        this.username = username;
    }

    
    // Getters, setters, equals, and hashCode methods
}

