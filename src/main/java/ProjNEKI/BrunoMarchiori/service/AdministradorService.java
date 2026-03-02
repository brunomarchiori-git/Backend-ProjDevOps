package ProjNEKI.BrunoMarchiori.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ProjNEKI.BrunoMarchiori.dto.AdministradorCadastroDTO;
import ProjNEKI.BrunoMarchiori.entity.Administrador;
import ProjNEKI.BrunoMarchiori.repository.AdministradorRepository;

@Service
public class AdministradorService {

    @Autowired
    private AdministradorRepository repository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public void cadastrar(AdministradorCadastroDTO data) {
        if (repository.existsByEmail(data.email())) {
            throw new IllegalArgumentException("Email já cadastrado");
        }

        Administrador admin = new Administrador();
        admin.setNome(data.nome());
        admin.setEmail(data.email());
        admin.setSenha(passwordEncoder.encode(data.senha()));

        repository.save(admin);
    }
}
