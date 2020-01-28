require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

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

my_game = Game.new(name_player)

while my_game.is_still_ongoing? do 
  my_game.menu
  choice = gets.chomp
  my_game.menu_choice(choice)
  my_game.show_players
end

my_game.end