//lista de colisoes 
tile_chao=layer_tilemap_get_id("tl_level")
colisoes=[obj_chao,obj_botao_chao,obj_porta,obj_botao_lustre,obj_caixa,obj_suporte_caixa,tile_chao,obj_chao_fragil]

velv=0
grav=.3
max_velv=7



gravidade=function ()
{
  var _checa_chao=place_meeting(x,y,colisoes)
    
  if (!_checa_chao)
    {
      velv+=grav 
       velv=clamp(velv,-max_velv,max_velv)  
    }
    else
    {
        velv=0
    }           
}

dando_colisao= function ()
{
    if !place_meeting(x,y,obj_player)
    {
        with (obj_player)
         {
            global.colisao_morto=true
        }
    }    
}

colidindo_exploxao=function ()
{
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
if place_meeting(x,y,obj_barri_inflamavel)
{
    with (obj_barri_inflamavel)
     {
        destroi_itens()	
    }
}
=======
=======
>>>>>>> parent of 0a3fd9f (minha nossa senhora)
=======
>>>>>>> parent of 0a3fd9f (minha nossa senhora)
    if (instance_exists(obj_suporte_caixa))
    {
         if (place_meeting(x+1,y+1,obj_barri_inflamavel))
    {
        scream_shake(10)
       instance_destroy(obj_barri_inflamavel) 
       instance_destroy(obj_suporte_caixa) 
    }   
    }
    else
    {
        return
    }
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> parent of 0a3fd9f (minha nossa senhora)
=======
>>>>>>> parent of 0a3fd9f (minha nossa senhora)
=======
>>>>>>> parent of 0a3fd9f (minha nossa senhora)
}