gravidade()
dando_colisao()


var _barril = instance_nearest(x, y, obj_barri_inflamavel);

if (_barril != noone) {
    if (distance_to_object(_barril) <= 1) { 
        
        instance_destroy(_barril); 
    }
}

if (instance_exists(obj_lustre))
{
    if (place_meeting(x,y,obj_lustre))
    {
        
        sprite_index=spr_player_morto_queimado
    }
}

