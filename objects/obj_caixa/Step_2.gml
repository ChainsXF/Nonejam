repeat (abs(velv))
 {
    var _velv=sign(velv)
    if (place_meeting(x,y+_velv,colisoes))
    { 

      velv=0  
    }
    else    
    {
        som_executado=false
        y+=_velv
    }
}