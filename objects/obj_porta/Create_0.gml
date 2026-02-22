
estado_porta="fechado"

movendo_porta=function ()
{
  switch (estado_porta)
     { 
    case "fechado":
        
    break

    case "abrindo":
    y=approach(y,sprite_height,.6)
        
    break                
      
    case "fechando":
    y=approach(y,pos_y,.8)    
        
        
    break    
        
} 
}