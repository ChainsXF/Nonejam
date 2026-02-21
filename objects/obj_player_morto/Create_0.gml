//lista de colisoes 
colisoes=[obj_chao]

velv=0
grav=.5
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
            colisao_morto=true
        }
    }    
}