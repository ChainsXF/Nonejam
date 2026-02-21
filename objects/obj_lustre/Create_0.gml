//lista de colisoes 
colisoes=[obj_chao,obj_botao_chao,obj_porta]

velv=0
grav=.8
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