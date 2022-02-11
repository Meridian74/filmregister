package hu.guidance.filmregister.service;

import hu.guidance.filmregister.dto.AudioDTO;
import hu.guidance.filmregister.dto.CreateAudioCommand;
import hu.guidance.filmregister.dto.UpdateAudioCommand;
import hu.guidance.filmregister.exception.AudioNotFoundException;
import hu.guidance.filmregister.model.Audio;
import hu.guidance.filmregister.repository.AudioRepository;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class AudioService {

    private final AudioRepository audioRepository;
    private final ModelMapper modelMapper;

    public AudioService(AudioRepository audioRepository, ModelMapper modelMapper) {
        this.audioRepository = audioRepository;
        this.modelMapper = modelMapper;
    }

    public AudioDTO createAudio(CreateAudioCommand command) {
        Audio audio = new Audio();
        audio.setLanguage(command.getLaguage());

        audio = audioRepository.save(audio);
        return modelMapper.map(audio, AudioDTO.class);

    }

    public AudioDTO findAudioById(long id) {
        Optional<Audio> optionalEmployee = audioRepository.findById(id);

        if (optionalEmployee.isPresent()) {
            return modelMapper.map(optionalEmployee.get(), AudioDTO.class);
        }
        else {
            throw new AudioNotFoundException(id);
        }
    }

    @Transactional
    public AudioDTO updateAudio(long id, UpdateAudioCommand command) {
        Optional<Audio> optionalAudio = audioRepository.findById(id);

        if (optionalAudio.isEmpty()) {
            throw new AudioNotFoundException(id);
        }

        Audio employee = optionalAudio.get();
        if (command.getLanguage() != null && !command.getLanguage().equals("") ) {
            employee.setLanguage(command.getLanguage());
        }

        return modelMapper.map(employee, AudioDTO.class);
    }

    public void deleteEmployeeById(long id) {
        Optional<Audio> optionalEmployee = audioRepository.findById(id);
        if (optionalEmployee.isPresent()) {
            audioRepository.deleteById(id);
        }
        else {
            throw new AudioNotFoundException(id);
        }
    }

    public List<AudioDTO> listAllAudios(Optional<String> prefix) {
        Type targetListType = new TypeToken<List<AudioDTO>>(){}.getType();

        List<Audio> employees = audioRepository.findAll();
        List<Audio> filtered = employees.stream()
                .filter(e -> prefix.isEmpty()
                        || e.getLanguage().toLowerCase().startsWith(prefix.get().toLowerCase()))
                .collect(Collectors.toList());

        return modelMapper.map(filtered, targetListType);
    }

}
