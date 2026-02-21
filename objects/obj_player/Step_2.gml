repeat (abs(hspd))
 {
    var _velh=sign(hspd)
    
    if place_meeting(x+_velh,y,colisoes)
    {
        velh=0
        break
    }
    else
     {
    	x+=_velh
    }
}


repeat (abs(velv))
 {
    var _velv=sign(velv)
    if (place_meeting(x,y+_velv,colisoes))
    {
        velv=0
        break
    }
    else
    {
        y+=_velv
    }
}