package ProjNEKI.BrunoMarchiori.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ProjNEKI.BrunoMarchiori.repository.AdministradorRepository;

@Service
public class AuthorizationService implements UserDetailsService {

    @Autowired
    AdministradorRepository repository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return repository.findByEmail(username)
                .orElseThrow(() -> new UsernameNotFoundException("Administrador não encontrado"));
    }
}
