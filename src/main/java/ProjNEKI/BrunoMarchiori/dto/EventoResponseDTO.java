package ProjNEKI.BrunoMarchiori.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.time.LocalDate;
import ProjNEKI.BrunoMarchiori.entity.Evento;

public record EventoResponseDTO(
        Long id,
        String titulo,
        @JsonFormat(pattern = "dd/MM/yyyy", shape = JsonFormat.Shape.STRING)
        LocalDate dataEvento,
        String localizacao,
        String imagemUrl
) {
    public EventoResponseDTO(Evento evento) {
        this(evento.getId(), evento.getTitulo(), evento.getDataEvento(), evento.getLocalizacao(), evento.getImagemUrl());
    }
}
