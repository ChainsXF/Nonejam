function scream_shake(_treme=1)
{
	if instance_exists(obj_screamshake)
		{
			//chegando se o valor do treme atual é maior do que o treme do objeti screenshake
			with(obj_screamshake)
			{
				
				//meu codigo vai rodar dentro da instancia do objeto
				//se o treme novo for maior do que eu to tremendo eu mudo o valor dele, se não, faço nada 
				if _treme>treme
				{
					treme=_treme
				}
			}
			//obj_screamshake.treme=_treme
	
		}	
}