colisao_botao=[obj_player,obj_player_morto]

botao_pressionado=function ()
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