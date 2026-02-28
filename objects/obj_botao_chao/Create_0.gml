colisao_botao=[obj_player,obj_player_morto,obj_caixa]
ja_estava_pressionado = false

botao_pressionado = function() {
    if (!instance_exists(obj_porta)) return;

    
    var em_cima_agora = place_meeting(x, y - 1, colisao_botao);

    if (em_cima_agora) {
        
        if (!ja_estava_pressionado) {
            audio_play_sound(snd_pisou_botao, 1, false);
            ja_estava_pressionado = true; 
        }
        
        obj_porta.estado_porta = "abrindo";
        image_index = 1;
    } else {
        
        ja_estava_pressionado = false;
        
        obj_porta.estado_porta = "fechando";
        image_index = 0;
    }
}