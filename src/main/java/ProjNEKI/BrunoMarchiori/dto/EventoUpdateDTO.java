package ProjNEKI.BrunoMarchiori.dto;

import java.time.LocalDate;
import jakarta.validation.constraints.FutureOrPresent;

public record EventoUpdateDTO(
        @FutureOrPresent(message = "A data do evento deve ser hoje ou no futuro")
        LocalDate dataEvento,

        String localizacao
) {}
