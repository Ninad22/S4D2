class Player
	attr_accessor :name, :life_points


	def initialize (name)
		@name = name.to_s
		@life_points = 10
	end

	def show_state
		puts "#{name} a #{@life_points} points de vie"
	end

	def gets_damage (damage)
		 @life_points = @life_points - damage
		 if @life_points <= 0
		 	puts "Le joueur #{name} a été tué !"
		 end
	end
 
 	def attacks (ennemy)
 		puts "Le joueur #{name} attaque le joueur #{ennemy.name}"
 		attacks_power = compute_damage
 		puts "Il lui inflige #{attacks_power} points de dommages"
 		ennemy.gets_damage(attacks_power)
 	end

 	def compute_damage
 		return rand(1..6)
 	end
end


class HumanPlayer < Player
	attr_accessor :weapon_level 


	def initialize (name)
		super(name)

		@weapon_level = 1
		@life_points = 100
	end

	def show_state
		puts "#{name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
    	rand(1..6) * @weapon_level
  	end

  	def search_weapon
  		new_weapon_level = rand(1..6)
  		puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
  		if @weapon_level < new_weapon_level
  			@weapon_level = new_weapon_level
  			puts "Youhou! Cette super machette va remplacer ta brosse à chiottes, tu la prends!"
  		else @weapon_level >= new_weapon_level
  			puts "Merde ! Ce cure-dent ne te sera d'aucune utilité, tu le laisses !"
  		end
  	end

  	def search_health_pack
  		health_search = rand(1..6)
  		if health_search == 1
  			puts "Ravale ta morve, tu n'as rien trouvé!"
  		elsif health_search == (2...5)
  			@life_points = @life_points + 50
  			#pour ne pas dépasser 100pts de vie
  				if @life_points >= 100
  					@life_points = 100
  				end
  			puts "Bravo, tu as trouvé un pack de bières, +50 points de vie!"
  		else 
  			#idem
  			@life_points = @life_points + 80
  				if @life_points >= 100
  					@life_points = 100
  				end
  			 puts "WAOW, tu as trouvé un bouteille de vodka, +80 points de vie!"
  		end
  	end
end
