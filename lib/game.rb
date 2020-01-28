class Game
  attr_accessor :human_player , :enemies
  
  def initialize (human_player)
    @human_player = HumanPlayer.new(human_player)
    enemy_1 = Player.new("Thanos")
    enemy_2 = Player.new("Joker")
    enemy_3 = Player.new("DarkVador")
    enemy_4 = Player.new("Voldemort")
    @enemies = [enemy_1,enemy_2,enemy_3,enemy_4] 
    
  end

  def kill_player(enemy_test)
    @enemies.each do |enemy|
      if enemy == enemy_test
        @enemies.delete(enemy)
      end
    end
  end

  def is_still_ongoing?
    if human_player.life_points > 0 || @enemies.length > 0
      return true
    else 
      return false
    end
  end

  def show_players 
    human_player.show_state
    puts " Attention il reste #{@enemies.length} ennemies "
  end

  def menu
    
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleur arme"
    puts "s - chercher à se soigner "
    puts "Attaquer un joueur en vue :"
    num = 0
    @enemies.each do |enemy|
      print "#{num} - "
      enemy.show_state
      num = num + 1
    end
    print "choix : > "
  end


  def menu_choice(choice) 
    if choice == "a"
      human_player.search_weapon
    elsif choice == "s"
      human_player.search_health_pack
    else
      z = choice.to_i
      human_player.attacks(@enemies[z])
    end 

    @enemies.each do |enemy|
      if enemy.life_points <= 0
      kill_player(enemy)
      end
    end

    puts " "
    puts "Les autres joueurs t'attaquent !"
    puts "Si vous êtes prets à recevoir les degats tapez entrez"
    gets.chomp 
    @enemies.each do |enemy|
      if enemy.life_points > 0
      puts "---------------------------------------------"
      enemy.attacks(human_player)
      puts "---------------------------------------------"
      puts " "
       end
    end
  end

  def end
    puts "La partie est finie!!!"
    if human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNE !"
    else
      puts "Loser ! Tu as perdu !"
    end
  end

end