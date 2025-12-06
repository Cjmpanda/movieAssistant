package com.example.movieassistant.repo;

import com.example.movieassistant.model.UserAccount;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserAccountRepository extends JpaRepository<UserAccount, String> {

    boolean existsByUsernameIgnoreCase(String username);

    UserAccount findByUsernameIgnoreCase(String username);
}
