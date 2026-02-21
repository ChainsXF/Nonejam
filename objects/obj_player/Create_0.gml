velh=0
velv=0
max_velh=6
max_velv=8
acc=.3
dcc=.3
hspd=0
vspd=0
grav=.4

//variaveis de input
up=noone
down=noone
left=noone
right=noone
jump=noone
death=noone

//lista de colisoes 
colisoes=[obj_chao]

//personagem está vivo ou morto
estado_morto="vivo"
colisao_morto=false


pega_inputs= function ()
{
    up=keyboard_check(ord("W"))   
    down=keyboard_check(ord("S"))   
    left=keyboard_check(ord("A"))   
    right=keyboard_check(ord("D")) 
    jump=keyboard_check_pressed(vk_space)
    death=keyboard_check_pressed(ord("E"))  
}

movimentacao_horizontal = function ()
{
    var _move=(right-left!=0)
    
    if (_move) //estou me movendo 
    {
        velh=lerp(velh,max_velh,acc)       
    }
    else
    {
        velh=lerp(velh,0,dcc)
    }     
    
    var _dir=point_direction(0,0,right-left,0)
    hspd=lengthdir_x(velh,_dir)
    hspd=round(hspd)
}

movimentacao_vertical= function ()
{
    var _checa_chao=place_meeting(x,y+1,colisoes)
    if (_checa_chao)
    {
     if (jump)
    { 
        velv=-max_velv     
    }    
    }
    else
    {
      velv+=grav
      velv=clamp(velv,-max_velv,max_velv)  
    }       
    
}

mecanica_morrer=function ()
{
    if (death)
    {
        global.morto=true
        estado_morto="morto"
    }
    
    switch (estado_morto)
     {
        case "vivo":
        sprite_index=spr_player
        global.morto=false
        estado_morto="vivo"
        break
        
        case "morto": 
            sprite_index=spr_player_fantasma
            image_alpha=.7   
        if (!instance_exists(obj_player_morto))
        {
         var _morto=instance_create_layer(x,y,"personagem_morto",obj_player_morto)
            
        }
            
        if (colisao_morto=true)
        {
            array_push(colisoes,obj_player_morto)
        }
        break           
    } 
}

movendo_corpo= function ()
{
   var _push_list=ds_list_create()
   var _is_block_h=instance_place_list(x+hspd,y,obj_player_morto,_push_list,false)
  if (_is_block_h)
    {
        if (ds_list_size(_push_list)) >0
        {
            for (var i = 0; i < ds_list_size(+_push_list); i++)
             {
                var _block=_push_list[|i]
                with (obj_player_morto)
                     {
                       if (!place_meeting(x+other.hspd,y,obj_chao))
                    {
                        
                       x+=other.hspd 
                          
                    } 
                    	 
                    }	
            }
        }       
    }   
}