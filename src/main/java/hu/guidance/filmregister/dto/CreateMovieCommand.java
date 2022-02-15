package hu.guidance.filmregister.dto;

import hu.guidance.filmregister.model.CodecFormat;
import hu.guidance.filmregister.model.Director;
import hu.guidance.filmregister.model.Genre;
import hu.guidance.filmregister.model.StorageType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;

import java.time.LocalTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreateMovieCommand {

    @Schema(description = "Hungarian title name", example = "Istenek fegyverzete")
    private String titleHun;

    @Schema(description = "English title name", example = "The armour of god")
    private String titleEnglish;

    @Schema(description = "Original title name", example = "Long xiong hu di")
    private String titleOriginal;

    @Schema(description = "Movie length", example = "01:28:31")
    private LocalTime duration;

    @Schema(description = "Movie release year", example = "1986")
    private Integer releaseYear;


    @Schema(description = "Screen resolution of with", example = "1280")
    private Integer xResolution;

    @Schema(description = "Screen resolution of height", example = "720")
    private Integer yResolution;

    @Schema(description = "Number of the storage", example = "2")
    private Integer storageNumber;

    private Genre genre;

    private Director director;

    private CodecFormat codecFormat;

    private StorageType storageType;

}
