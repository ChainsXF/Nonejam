

//alterando a posicao do viewport com base da posição do treme
if treme>0.1
{
	var _x=random_range(-treme,treme)
	var _y=random_range(-treme,treme)
//alteração a posicao x do viewport
view_set_xport(view_current,_x)

view_set_yport(view_current,_y)
}
else //cheguei perto de zero, zero o valor do treme
{
	treme=0
	//posição do view é zerada 
	view_set_xport(view_current,0)
	view_set_yport(view_current,0)
}


//parando de tremer aos poucos

treme=lerp(treme,0,.1)