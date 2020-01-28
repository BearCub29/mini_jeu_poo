require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#Présentation app et demande de nom-----------------
puts "---------------------------------------------"
puts "|  Bienvenue sur 'ILS VEULENT TOUS MA POO'  |"
puts "| Le but du jeu : Etre le dernier survivant |"
puts "---------------------------------------------"
puts " "
puts "Commencons par le commencement,quel est votre"
puts "nom de survivant?"
puts ""
print "> "
name_player = gets.chomp
#Mise à jour des informations-----------------------
human_player = HumanPlayer.new(name_player)
enemy_1 = Player.new("Josiane")
enemy_2 = Player.new("José")
enemies = []
enemies << enemy_1  
enemies << enemy_2
#Boucle principale-----------------------------------
while  human_player.life_points > 0 &&  (enemy_1.life_points > 0 || enemy_2.life_points > 0)  do 
  puts " "
  puts "----------------------------------------------------"
  human_player.show_state
  puts "----------------------------------------------------"
  puts " "
  puts "Quelle action veux-tu effectuer ?"
  puts " "
  puts "a - chercher une meilleur arme"
  puts "s - chercher à se soigner "
  puts " "
  puts "Attaquer un joueur en vue :"
  print "0 - " 
  enemy_1.show_state
  print "1 - " 
  enemy_2.show_state
  puts " "
  print "choix : > "
  choice = gets.chomp
  puts " "
  if choice == "a"
    human_player.search_weapon
  elsif choice == "s"
    human_player.search_health_pack
  elsif choice == "0"
    human_player.attacks(enemy_1)
  elsif choice == "1"
    human_player.attacks(enemy_2)
  else
   puts "Vous passez votre tour,dommage... :("
  end
  puts " "
  puts "Les autres joueurs t'attaquent !"
  puts "Si vous êtes prets à recevoir les degats tapez entrez"
  gets.chomp
  enemies.each do |enemy|
    if enemy.life_points > 0
    puts "---------------------------------------------"
    enemy.attacks(human_player)
    puts "---------------------------------------------"
    puts " "
    end
  end

end
#Message final-----------------------------------------
puts "La partie est finie!!!"

if human_player.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end

