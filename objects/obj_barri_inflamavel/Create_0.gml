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

destroi_itens= function ()
{
// 1. Criar uma lista para armazenar os IDs encontrados
var _lista_alvos = ds_list_create();

// 2. Definir o raio da explosão e o objeto alvo (pode ser 'all' para todos)
var _raio = 128; 
var _objeto_alvo = obj_destroi_pai; // Use um objeto pai para atingir vários tipos

// 3. Buscar instâncias no raio circular
var _quantidade = collision_circle_list(x, y, _raio, _objeto_alvo, false, true, _lista_alvos, false);

// 4. Percorrer a lista e destruir cada instância encontrada
for (var i = 0; i < _quantidade; i++) {
    instance_destroy(_lista_alvos[| i]);
}

// 5. IMPORTANTE: Destruir a lista para evitar vazamento de memória (memory leak)
ds_list_destroy(_lista_alvos);
}