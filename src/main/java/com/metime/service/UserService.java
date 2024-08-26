package com.metime.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.metime.dao.User;
import com.metime.repository.UserRepo;

@Service
public class UserService {

    @Autowired
    private UserRepo urepo;
    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);

    public User getUser(User user) {
        if (isUserNameDuplicate(user.getUsername())) {
            throw new DataIntegrityViolationException("Duplicate username detected");
        }
        
        user.setPassword(encoder.encode(user.getPassword()));
        System.out.println("Encrypted Password --- " + user.getPassword());
        return urepo.save(user);
    }

    public boolean isUserNameDuplicate(String username) {
        return urepo.findByUsername(username) != null;
    }
}
