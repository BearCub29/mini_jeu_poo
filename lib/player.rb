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