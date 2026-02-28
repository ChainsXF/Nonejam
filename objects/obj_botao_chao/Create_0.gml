colisao_botao=[obj_player,obj_player_morto,obj_caixa]

botao_pressionado=function ()
{
    if instance_exists(obj_porta)
    {
         if (place_meeting(x,y-1,colisao_botao))
    {
        
        obj_porta.estado_porta="abrindo"
        image_index=1
    }
    else
     {
        
       obj_porta.estado_porta="fechando"
        image_index=0	
    }    
    }
    else {
    	return
    }
}