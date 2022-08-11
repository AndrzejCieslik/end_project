package andrzej.cieslik.ac.end_project.service;

import andrzej.cieslik.ac.end_project.user.UserRepository;

public class AdminService {

    private final UserRepository userRepository;

    public AdminService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
}
