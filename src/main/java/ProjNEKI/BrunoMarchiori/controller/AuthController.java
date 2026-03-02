package ProjNEKI.BrunoMarchiori.controller;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ProjNEKI.BrunoMarchiori.dto.AdministradorCadastroDTO;
import ProjNEKI.BrunoMarchiori.dto.AdministradorLoginDTO;
import ProjNEKI.BrunoMarchiori.entity.Administrador;
import ProjNEKI.BrunoMarchiori.service.AdministradorService;
import ProjNEKI.BrunoMarchiori.service.TokenService;

import java.util.Map;

@RestController
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private AdministradorService administradorService;

    @Autowired
    private TokenService tokenService;

    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> login(@RequestBody @Valid AdministradorLoginDTO data) {
        var usernamePassword = new UsernamePasswordAuthenticationToken(data.email(), data.senha());
        var auth = authenticationManager.authenticate(usernamePassword);

        var token = tokenService.generateToken((Administrador) auth.getPrincipal());
        var admin = (Administrador) auth.getPrincipal();

        return ResponseEntity.ok(Map.of(
            "token", token,
            "id", admin.getId(),
            "nome", admin.getNome(),
            "email", admin.getEmail()
        ));
    }

    @PostMapping("/cadastro")
    public ResponseEntity<Void> cadastro(@RequestBody @Valid AdministradorCadastroDTO data) {
        administradorService.cadastrar(data);
        return ResponseEntity.ok().build();
    }
}
