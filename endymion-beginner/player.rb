class Player

def play_turn(warrior)
	$t=0
	$t2=0
	
	for i in 0..2 do
      if !warrior.look(:backward)[i].empty?
			$t2 = i
			break
	  end
   end  
	
	if warrior.look(:backward)[$t2].wall? || warrior.look(:backward)[$t2].empty?
    
		for i in 0..2 do
			if !warrior.look[i].empty?
				$t = i
				break
			end
		end  
			
		if warrior.look[$t].enemy? 
				warrior.shoot!	
		else
				if warrior.health == 20
					if warrior.feel.captive?
						warrior.rescue!
					else
						if warrior.feel.wall?
							warrior.pivot!
						else
							warrior.walk!
						end
					end
							
				else
					warrior.rest!
				end
					
			
		end
	else
		if warrior.look(:backward)[$t2].enemy?
		   warrior.shoot!(:backward)
		else
			if warrior.feel(:backward).captive?
				warrior.rescue!(:backward)
			else
				warrior.walk!(:backward)
			end
		end
	end
end
end

