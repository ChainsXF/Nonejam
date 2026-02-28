// Defina aqui as salas onde a música DEVE tocar
if (room == rm_menu || room == rm_menu_comando) {
    // Se a música ainda não estiver tocando, comece a tocar
    if (!audio_is_playing(snd_menu_musica)) {
        audio_play_sound(snd_menu_musica, 10, true);
    }
} else {
    // Se estiver em QUALQUER OUTRA sala, a música para
    audio_stop_sound(snd_menu_musica);
}