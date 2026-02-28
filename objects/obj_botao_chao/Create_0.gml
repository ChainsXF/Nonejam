colisao_botao=[obj_player,obj_player_morto,obj_caixa]
pisou_botao=false

botao_pressionado=function ()
{
    if instance_exists(obj_porta)
    {
         if (place_meeting(x,y-1,colisao_botao))
    {
        if (!audio_is_playing(snd_pisou_botao))
        {
            audio_play_sound(snd_pisou_botao,1,false)
        }       
        obj_porta.estado_porta="abrindo"
        image_index=1
    }
    else
     {
       audio_stop_sound(snd_pisou_botao) 
       obj_porta.estado_porta="fechando"
        image_index=0	
    }    
    }
    else {
    	return
    }
}