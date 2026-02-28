repeat (abs(velv))
 {
    var _velv=sign(velv)
    if (place_meeting(x,y+_velv,colisoes))
    {
        
      velv=0  
    }
    else    
    {
        y+=_velv
    }
}