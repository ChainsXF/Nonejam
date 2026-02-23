if (keyboard_check_pressed(ord("S")))
{
    index++
    
    if (index>op_max-1)
    {
        index=0
    }
}

if (keyboard_check_pressed(ord("W")))
{
    index--
    
    if (index<0)
    {
        index=op_max-1
    }
}

if (keyboard_check_pressed(vk_space))
{
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