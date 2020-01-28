class Player
  attr_accessor :name , :life_points
  
  def initialize (name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{name} a #{life_points} point de vie."
  end

  def gets_damage(damage)
    new_life_points = @life_points - damage
    @life_points = new_life_points
  end

  def attacks(player_def)
    player_at = self.name
    puts " Le joueur #{player_at} attaque le joueur #{player_def.name},"
    @damage = compute_damage
    player_def.gets_damage(@damage)
    puts "il lui inflige #{@damage} points de dommages."
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level , :life_points

  def initialize (name)
    @life_points = 100
    @weapon_level = 1
    @name = name
  end

  def show_state
    puts "#{name} a #{life_points} point de vie et une arme de niveau #{weapon_level}!!!"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    level_weapon = rand(1..6)
    puts " "
    puts "Tu as trouvé une arme de niveau #{level_weapon}\n\n"
    if level_weapon > @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      @weapon_level = level_weapon
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    level_health = rand(1..6)
    if level_health == 1
      puts " "
      puts "Tu n'as rien trouvé..."
    elsif level_health >= 2 && level_health <= 5
      if @life_points > 50
      @life_points = (@life_points+50)-(@life_points-50)
      else
      @life_points = @life_points + 50
      end
      puts " "
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else
      if @life_points > 20
        @life_points = (@life_points+80)+(100-(@life_points+80))
      else
        @life_points = @life_points + 80
      end
      puts " "
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end

end