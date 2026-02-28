gravidade()
destruindo_chao_fragil()

if (place_meeting(x,y+1,colisoes))
{
    if (som_executado=false)
    {
        scream_shake(10)
        audio_play_sound(snd_lustre_queda,1,false)
        som_executado=true
    }

}

