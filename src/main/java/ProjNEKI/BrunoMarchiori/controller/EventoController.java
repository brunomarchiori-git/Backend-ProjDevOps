package ProjNEKI.BrunoMarchiori.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ProjNEKI.BrunoMarchiori.dto.EventoRequestDTO;
import ProjNEKI.BrunoMarchiori.dto.EventoResponseDTO;
import ProjNEKI.BrunoMarchiori.dto.EventoUpdateDTO;
import ProjNEKI.BrunoMarchiori.service.EventoService;

import java.util.List;

@RestController
@RequestMapping("/eventos")
@SecurityRequirement(name = "bearer-key")
public class EventoController {

    @Autowired
    private EventoService service;

    @GetMapping
    @Operation(summary = "Listar todos os eventos do administrador logado")
    public ResponseEntity<List<EventoResponseDTO>> listar() {
        return ResponseEntity.ok(service.listarTodos());
    }

    @PostMapping
    @Operation(summary = "Cadastrar novo evento")
    public ResponseEntity<EventoResponseDTO> cadastrar(@RequestBody @Valid EventoRequestDTO data) {
        return ResponseEntity.ok(service.criar(data));
    }

    @PutMapping("/{id}")
    @Operation(summary = "Atualizar data ou localização de um evento")
    public ResponseEntity<EventoResponseDTO> atualizar(@PathVariable Long id, @RequestBody @Valid EventoUpdateDTO data) {
        return ResponseEntity.ok(service.atualizar(id, data));
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Excluir um evento")
    public ResponseEntity<Void> excluir(@PathVariable Long id) {
        service.excluir(id);
        return ResponseEntity.noContent().build();
    }
}
