package com.metime.dao;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "feedback")
public class Feedback {
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
	
    @ManyToOne
    @JoinColumn(name = "username")
    private User user;

    private int ratings;
    private String reviews;
    
    @JsonFormat(pattern = "dd-MM-yyyy")
    private LocalDateTime timestamp;

    // Getters and setters
    

    @PrePersist
    protected void onCreate() {
        timestamp = LocalDateTime.now();
    }

	@Override
	public String toString() {
		return "Feedback [id=" + id + ", user=" + user + ", ratings=" + ratings + ", reviews=" + reviews
				+ ", timestamp=" + timestamp + "]";
	}
    
}

