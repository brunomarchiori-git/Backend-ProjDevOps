package ProjNEKI.BrunoMarchiori.entity;

import java.time.LocalDate;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

@Entity
@Table(name = "evento")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Evento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 150)
    @NotBlank(message = "O titulo do evento nao pode ser nulo.")
    @Size(min = 3, max = 150, message = "O titulo deve ter entre 3 e 150 caracteres.")
    private String titulo;

    @Column(name = "data_evento", nullable = false)
    @NotNull(message = "A data do evento e obrigatoria.")
    private LocalDate dataEvento;

    @Column(nullable = false, length = 150)
    @NotBlank(message = "A localizacao nao pode ser nula.")
    private String localizacao;

    @Column(name = "imagem_url", length = 255)
    private String imagemUrl;

    @ManyToOne
    @JoinColumn(name = "administrador_id", nullable = false)
    private Administrador administrador;
}
