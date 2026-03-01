//lista de colisoes
tile_chao=layer_tilemap_get_id("tl_level") 
colisoes=[obj_chao,obj_botao_chao,obj_porta,obj_botao_lustre,obj_suporte_caixa,tile_chao,obj_chao_invisivel]
som_executado=noone


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

destruindo_chao_fragil= function ()
{
    if instance_place(x,y+1,obj_chao_fragil)
    {
        with (obj_chao_fragil)
         {
            instance_destroy()	
        }
    }    
}