colisao_botao=[obj_player,obj_player_morto,obj_caixa]

botao_pressionado=function ()
{
    if (instance_exists(obj_lustre))
    {
          if (place_meeting(x,y-1,colisao_botao))
    {
        obj_lustre.gravidade()
        
    }  
    }
    else
     {
    	return
    }
   
}

botao_pressionado_porta=function ()
{
    if (instance_exists(obj_porta))
    {
        if (place_meeting(x,y-1,colisao_botao))
    {
        obj_porta.estado_porta="abrindo"
    }
    else
     {
       obj_porta.estado_porta="fechando"	
    }   
    }
   else {
	return
}
}