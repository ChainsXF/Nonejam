//lista de colisoes 
tile_chao=layer_tilemap_get_id("tl_level")
colisoes=[obj_chao,obj_botao_chao,obj_porta,obj_botao_lustre,obj_suporte_caixa,tile_chao]

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


destroi_itens = function() {
    var raio = 150;
    var meu_x = x;
    var meu_y = y;

    
    with (obj_suporte_caixa) {
        if (point_distance(x, y, meu_x, meu_y) <= raio) {
            instance_destroy();
        }
    }

    
    with (obj_chao_fragil) {
        if (point_distance(x, y, meu_x, meu_y) <= raio) {
            instance_destroy();
        }
    }
}