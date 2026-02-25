gravidade()
dando_colisao()
colidindo_exploxao()

if (instance_exists(obj_lustre))
{
    if (place_meeting(x,y,obj_lustre))
    {
        //global.morto=true
        sprite_index=spr_player_morto_queimado
    }
}