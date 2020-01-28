require 'bundler'
Bundler.require

require_relative 'lib/game' #référence au fichier game.rb
require_relative 'lib/player' #référence au fichier player.rb

player1 = Player.new("Josiane") #Création nouvelle instance
player2 = Player.new("José") #Création nouvelle instance

while player1.life_points > 0 && player2.life_points > 0 do 
  puts "Voici l'état de chaque joueur :"
  puts " "
  puts player1.show_state
  puts player2.show_state
  puts "Passons à la phase d'attaque!!!"
  puts " "
  player1.attacks(player2)
  puts " "
  if player2.life_points <= 0
    break
  else
  player2.attacks(player1)
  puts " "
  end
end












