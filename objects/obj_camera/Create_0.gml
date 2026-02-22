alvo=noone
estado=noone
escala=1
cam_w=camera_get_view_width(view_camera[0])
cam_h=camera_get_view_height(view_camera[0])

zoom= function ()
{
    //o tamanho da minha view
    camera_set_view_size(view_camera[0],cam_w*escala,cam_h*escala)
    
    //mudando o valor da escala
    if (mouse_wheel_down())
    {
        escala+=.1
    }
    else if (mouse_wheel_up()) 
    {
    	escala-=.1
    } 
    	
}

segue_alvo = function ()
{
    //tamanho da camera
    var _viewW=camera_get_view_width(view_camera[0])
    var _viewH=camera_get_view_height(view_camera[0])
    var _cam_x=x-_viewW/2
    var _cam_y=y-_viewH/2
    
    //impedindo que a camera saia da room
    _cam_x=clamp(_cam_x,0,room_width-_viewW)
    _cam_y=clamp(_cam_y,0,room_height-_viewH)
    


    x=lerp(x,alvo.x,.1)
    y=lerp(y,alvo.y,.1)
    
    //definidn a posição da camera
    camera_set_view_pos(view_camera[0],_cam_x,_cam_y)
    
}
//segundo o player
segue_player= function ()
{
    //checando se o player existe
    if (instance_exists(obj_player))
    {
        alvo=obj_player
    }
    else
     {
        estado=segue_nada
    }
    
    segue_alvo()
    
    //if (keyboard_check_released(vk_space)) estado=segue_inimigo
}

segue_nada = function ()
{
    alvo=noone
}


estado=segue_player