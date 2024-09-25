package com.metime.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.metime.dao.Bookings;
import com.metime.dao.BookingsKey;

public interface BookingRepository extends JpaRepository<Bookings, BookingsKey> {
	Bookings findByBkey(BookingsKey bkey);
}

