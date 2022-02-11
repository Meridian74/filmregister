package hu.guidance.filmregister.repository;

import hu.guidance.filmregister.model.Audio;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AudioRepository extends JpaRepository<Audio, Long> {
}
