if (global.morto == true) { // Use == para comparação
    if (audio_is_playing(snd_game_vivo)) {
        audio_stop_sound(snd_game_vivo);
    }
    // SÓ toca se o som de morto NÃO estiver tocando ainda
    if (!audio_is_playing(snd_game_morto)) {
        audio_play_sound(snd_game_morto, 1, true);
    }
} else {
    if (audio_is_playing(snd_game_morto)) {
        audio_stop_sound(snd_game_morto);
    }
    // SÓ toca se o som de vivo NÃO estiver tocando ainda
    if (!audio_is_playing(snd_game_vivo)) {
        audio_play_sound(snd_game_vivo, 1, true);
    }
}