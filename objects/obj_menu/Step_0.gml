if (keyboard_check_pressed(ord("S")))
{
    index++
    audio_play_sound(snd_menu,1,false)
    
    if (index>op_max-1)
    {
        index=0
    }
}

if (keyboard_check_pressed(ord("W")))
{
    index--
    audio_play_sound(snd_menu,1,false)
    
    if (index<0)
    {
        index=op_max-1
    }
}

if (keyboard_check_pressed(vk_space))
{
    audio_play_sound(snd_menu_confirma,1,false)
    if (index=2)
    {
      window_set_fullscreen(true) 
    }
    else if (index=0)  
    {
        room_goto(rm_level_1)
    }
    else if (index=3)
    {
        game_end()
    }
    else if (index=1)
    {
        room_goto(rm_menu_comando)
    }              
}   