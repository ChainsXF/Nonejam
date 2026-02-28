
estado_porta="fechado"

movendo_porta=function ()
{
  switch (estado_porta)
     { 
    case "fechado":
        
    break

    case "abrindo":
    y=approach(y,pos_y_abrindo,.6)
    if y!=pos_y_abrindo
    {
                
                scream_shake(3)
    }      

  
    break                
      
    case "fechando":
    y=approach(y,pos_y,.8)    
         if y!=pos_y
    {
        
                scream_shake(3)
    }    
        
    break    
        
} 
}