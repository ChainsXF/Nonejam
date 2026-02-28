velh=0
velv=0
max_velh=4
max_velv=6
acc=.3
dcc=.3
hspd=0
vspd=0
grav=.4
dir=1

//variaveis de input
up=noone
down=noone
left=noone
right=noone
jump=noone
death=noone

//variaveis coiote jump
coyote_time=game_get_speed(gamespeed_fps)*0.1
coyote_timer_atual=coyote_time

//variaveis buffer do pulo
pulo_timer=game_get_speed(gamespeed_fps)*0.1
pulo_timer_atual=0

tile_chao=layer_tilemap_get_id("tl_level")

//lista de colisoes 
colisoes=[obj_chao,obj_botao_chao,obj_porta,obj_botao_lustre,obj_caixa,obj_suporte_caixa,tile_chao,obj_chao_fragil]

//personagem está vivo ou morto
estado_morto="vivo"
global.colisao_morto=false

//variavel para controlar as sprites do personagem em uma maquina de estados
personagem_estado="esta_vivo"


pega_inputs= function ()
{
    up=keyboard_check(ord("W"))   
    down=keyboard_check(ord("S"))   
    left=keyboard_check(ord("A"))   
    right=keyboard_check(ord("D")) 
    jump=keyboard_check_pressed(vk_space)
    jump_r=keyboard_check_released(vk_space)
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

//metodo coyote jump
coyote_jump = function ()
{
    var _checa_chao=place_meeting(x,y+1,colisoes)
    
    if !_checa_chao
    {
       coyote_timer_atual-- 
    }
    else    
    {
        coyote_timer_atual=coyote_time
    }
}

//buffer do pulo
buffer_pulo=function ()
{
  var _checa_chao=place_meeting(x,y+1,colisoes)  
    pega_inputs()
    
    if !_checa_chao 
    {
        if (jump) pulo_timer_atual=pulo_timer
            
        pulo_timer_atual--
    }
    
}

movimentacao_vertical= function ()
{
    var _checa_chao=place_meeting(x,y+1,colisoes)
    //if (pulo_timer_atual=0) velv=0
    if (_checa_chao)
    {
     if (jump or pulo_timer_atual)
    { 
        velv=-max_velv
        pulo_timer_atual=0     
    }    
    }
    else
    {
      velv+=grav
      velv=clamp(velv,-max_velv,max_velv)  
    }
    
    if (velv<0)
    {
        if (jump_r)
        {
            velv*=0.5
        }
    } 
    
    if (coyote_timer_atual && jump)
    {
      velv=-max_velv
        coyote_timer_atual=0   
    }         
    
}

mecanica_morrer=function ()
{
    if (death) or place_meeting(x+sign(hspd),y,obj_espinho) or place_meeting(x,y,obj_lustre)
    {
        global.morto=true
        estado_morto="morto"
        
    }
    
    switch (estado_morto)
     {
        case "vivo":
        global.morto=false
        estado_morto="vivo"

            
        if (place_meeting(x,y,obj_lustre))
        {
            estado_morto="morto_queimado"
        }        
            
        break
        
        case "morto_queimado":

             
        if (!instance_exists(obj_player_morto))
        {
         var _morto=instance_create_layer(x,y,"personagem_morto",obj_player_morto)
            _morto.sprite_index=spr_player_morto_queimado
           
        }
        array_push(colisoes,obj_chao_invisivel)
               
            
        if (global.colisao_morto=true)
        {
            array_push(colisoes,obj_player_morto)
        } 
            
        break       
        
        case "morto": 

             
        if (!instance_exists(obj_player_morto))
        {
         var _morto=instance_create_layer(x,y,"personagem_morto",obj_player_morto)
          audio_play_sound(snd_som_morte,1,false) 
        } 
            array_push(colisoes,obj_chao_invisivel)
            
        if (global.colisao_morto=true)
        {
            array_push(colisoes,obj_player_morto)
        }
        break
    
    } 
}

maquina_sprite=function ()
{
    switch (personagem_estado)
     {
        case "esta_vivo":
        if (velh>0.2)
        {
            sprite_index=spr_player_andando
            
        }
        else
         {
             sprite_index=spr_player_idle 
         }
           if (global.morto=true) personagem_estado="esta_morto"
                                 
        break 
        case "esta_morto":
        if (place_meeting(x,y,obj_serra))
        {
            room_restart()
        }        
            
        if (velh>0.2)
        {
            sprite_index=spr_player_fantasma_andando
        }
        else 
        {
            sprite_index=spr_player_fantasma_idle
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
            for (var i = 0; i < ds_list_size(_push_list); i++)
             {
                var _block=_push_list[|i]
                with (_block)
                     {
                        
                       if (!place_meeting(x+other.hspd,y,colisoes) && global.colisao_morto=true )
                    {
                        
                       x+=other.hspd/2
                          
                    } 
                    	 
                    }	
            }
        }       
    }
    ds_list_destroy(_push_list)   
}

movendo_caixa= function ()
{
   var _push_list=ds_list_create()
   var _is_block_h=instance_place_list(x+hspd,y,obj_caixa,_push_list,false)
  if (_is_block_h)
    {
        if (ds_list_size(_push_list)) >0
        {
            for (var i = 0; i < ds_list_size(_push_list); i++)
             {
                var _block=_push_list[|i]
                with (_block)
                     {
                        
                       if (!place_meeting(x+other.hspd,y,colisoes) )
                    {
                        
                       x+=other.hspd/2
                          
                    } 
                    	 
                    }	
            }
        }       
    }
    ds_list_destroy(_push_list)   
}

movendo_barril= function ()
{
   var _push_list=ds_list_create()
   var _is_block_h=instance_place_list(x+hspd,y,obj_barri_inflamavel,_push_list,false)
  if (_is_block_h)
    {
        if (ds_list_size(_push_list)) >0
        {
            for (var i = 0; i < ds_list_size(_push_list); i++)
             {
                var _block=_push_list[|i]
                with (_block)
                     {
                        
                       if (!place_meeting(x+other.hspd,y,colisoes) )
                    {
                        
                       x+=other.hspd/2
                          
                    } 
                    	 
                    }	
            }
        }       
    }
    ds_list_destroy(_push_list)   
}