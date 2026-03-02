package ProjNEKI.BrunoMarchiori.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import ProjNEKI.BrunoMarchiori.dto.EventoRequestDTO;
import ProjNEKI.BrunoMarchiori.dto.EventoResponseDTO;
import ProjNEKI.BrunoMarchiori.dto.EventoUpdateDTO;
import ProjNEKI.BrunoMarchiori.entity.Administrador;
import ProjNEKI.BrunoMarchiori.entity.Evento;
import ProjNEKI.BrunoMarchiori.repository.EventoRepository;
import ProjNEKI.BrunoMarchiori.repository.AdministradorRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class EventoService {

    @Autowired
    private EventoRepository repository;
    
    @Autowired
    private AdministradorRepository administradorRepository;

    public EventoResponseDTO criar(EventoRequestDTO data) {
        Administrador admin = getAdministradorAutenticado();
        
        Evento evento = new Evento();
        evento.setTitulo(data.titulo());
        evento.setDataEvento(data.dataEvento());
        evento.setLocalizacao(data.localizacao());
        evento.setImagemUrl(data.imagemUrl());
        evento.setAdministrador(admin);

        repository.save(evento);
        return new EventoResponseDTO(evento);
    }

    public List<EventoResponseDTO> listarTodos() {
        Administrador admin = getAdministradorAutenticado();
        return repository.findAllByAdministradorId(admin.getId()).stream()
                .map(EventoResponseDTO::new)
                .collect(Collectors.toList());
    }

    public EventoResponseDTO atualizar(Long id, EventoUpdateDTO data) {
        Evento evento = validarDonoEvento(id);

        if (data.dataEvento() != null) {
            evento.setDataEvento(data.dataEvento());
        }
        if (data.localizacao() != null && !data.localizacao().isBlank()) {
            evento.setLocalizacao(data.localizacao());
        }
        
        repository.save(evento);
        return new EventoResponseDTO(evento);
    }

    public void excluir(Long id) {
        Evento evento = validarDonoEvento(id);
        repository.delete(evento);
    }

    private Administrador getAdministradorAutenticado() {
        Administrador principal = (Administrador) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return principal; 
    }

    private Evento validarDonoEvento(Long id) {
        Administrador admin = getAdministradorAutenticado();
        Evento evento = repository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Evento não encontrado"));

        if (!evento.getAdministrador().getId().equals(admin.getId())) {
            throw new SecurityException("Você não tem permissão para alterar este evento");
        }
        return evento;
    }
}
