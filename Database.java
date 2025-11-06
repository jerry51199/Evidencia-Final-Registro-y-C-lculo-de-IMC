package com.example.bmi.util;

import com.example.bmi.model.User;
import java.util.ArrayList;
import java.util.List;

public class Database {
    private static List<User> users = new ArrayList<>();

    public static void addUser(User user) {
        users.add(user);
    }

    public static boolean validateUser(String username, String password) {
        return users.stream().anyMatch(u -> u.getUsername().equals(username) && u.getPassword().equals(password));
    }

    public static User findUserByUsername(String username) {
        return users.stream().filter(u -> u.getUsername().equals(username)).findFirst().orElse(null);
    }
}
