estado_porta="fechado"

movendo_porta=function ()
{
  switch (estado_porta)
     { 
    case "fechado":
        
    break

    case "abrindo":
    y=approach(y,sprite_height*2,.6)
        
    break                
      
    case "fechando":
    y=approach(y,288,.8)    
        
        
    break    
        
} 
}