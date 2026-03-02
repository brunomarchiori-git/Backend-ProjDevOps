package ProjNEKI.BrunoMarchiori.dto;

import java.time.LocalDate;

import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record EventoRequestDTO(
        @NotBlank(message = "Título é obrigatório")
        @Size(min = 3, max = 150, message = "Título deve ter entre 3 e 150 caracteres")
        String titulo,

        @NotNull(message = "Data do evento é obrigatória")
        @FutureOrPresent(message = "A data do evento deve ser hoje ou no futuro")
        LocalDate dataEvento,

        @NotBlank(message = "Localização é obrigatória")
        String localizacao,

        String imagemUrl
) {}
