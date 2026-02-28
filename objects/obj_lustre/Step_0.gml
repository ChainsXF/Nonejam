if (place_meeting(x,y+1,colisoes))
{
    
    sprite_index=spr_lustre_destruido
    if (som_executado=false)
    {
        scream_shake(14)
        audio_play_sound(snd_lustre_queda,1,false)
        som_executado=true
    }

}