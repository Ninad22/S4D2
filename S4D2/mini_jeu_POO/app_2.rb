require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------------------"
puts "   Bienvenue dans le jeu Kill me first or die dans ton POO ! "
puts "     Le but du jeu est de ne pas se ch... dessus !          " 
puts "------------------------------------------------------------"

puts "Quel est ton blaze de combattant?"
print "> "
first_name = gets.chomp.to_s

user=HumanPlayer.new(first_name)
player1=Player.new("José")
player2=Player.new("Josiane")

enemies = [player1, player2]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
	
	puts "-------------------------------"
	puts "Voici ton état actuel :"
	print user.show_state

# quand tout le monde est vivant
	if player1.life_points > 0 && player2.life_points > 0
		puts "\nQuelle action veux-tu effectuer ?"
		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner"                    
		puts "attaquer un joueur en vue : "
		print "0 - " 
		print "#{player1.show_state}"
		print "1 - " 
		print "#{player2.show_state}"

# quand José est mort
	elsif player1.life_points <= 0
		puts "\nQuelle action veux-tu effectuer ?"
		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner"                    
		puts "attaquer un joueur en vue : "
		print "1 - " 
		print "#{player2.show_state}"

# quand Josiane est die
	elsif player2.life_points <= 0
		puts "\nQuelle action veux-tu effectuer ?"
		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner"                    
		puts "attaquer un joueur en vue : "
		print "0 - " 
		print "#{player1.show_state}"
	end

#le menu
	print "\n>"
	case gets.chomp
		when "a"
			user.search_weapon
		when "s"
			user.search_health_pack
		when "0"
			user.attacks(player1)
		when "1"
			user.attacks(player2)
		else
			puts "Dommage jeune padawan, il fallait choisir entre a, s, 0 et 1!"
	end

	STDIN.getch
#pour décomposer le jeu > appuie sur n'importe quelle touche pour continuer

	if player1.life_points > 0 || player2.life_points > 0
	puts "Les autres joueurs t'attaquent !"

	STDIN.getch

	end

	enemies.each do |enemy| 
		if enemy.life_points > 0
			enemy.attacks(user) 
			STDIN.getch
		end
	end
end

#fin du game, pour + de suspens, mettre 20pts à Humanplayer ;)
puts "La partie est finie."
	if user.life_points > 0
		puts "BRAVO! TU AS VAINCU!"
	else 
		puts "Loser ! Tu as perdu dans ton POO !"
	end