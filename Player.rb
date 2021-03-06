class Player
  attr_reader :facing_tile, :x, :y, :vel_x, :vel_y, :max_energy
  attr_accessor :energy, :map, :direction
  
  def initialize(window, map)
    @window, @map = window, map
    @energy = @max_energy = 35
    @animation = Gosu::Image::load_tiles(window, "media/sprites/ruby.png", 16, 16, true)
    @direction = :down
    @animation_speed = 200
    calc_animation
    @x = @y = @vel_x = @vel_y = 0
    @expected_tile = @current_tile = @map.tile_at(@x, @y)
    @warped = false
    @no_energy = ["You are way too tired to do that.", "You can't stop yawning long enough to try.", "You're not a machine, you need to rest.", "Go to bed. Really. Get some sleep.", "The crops will be waiting here in the morning.", "Being this sleepy makes it impossible to work.", "Okay buster you won't get anything accomplished when you're this tired."]
  end

  def day_pass
    @energy = @max_energy
  end

  def energy_change(value)
    @energy += value
    calc_animation
  end

  def no_energy?(cost)
    if @energy -cost >= 1
      false
    else
      @window.show_message(@no_energy.sample)
      true
    end
  end

  def warp(x, y, direction)
    @vel_x, @vel_y = 0, 0
    @warped = true
    @x, @y = x * 64, y * 64
    @current_tile = @map.tile_at(@x, @y)
    @expected_tile = @current_tile
    @direction = direction
    calc_animation
    set_facing
  end

  def interact
    @facing_tile.touch
  end

  def set_facing
    @facing_tile =
    case @direction
    when :up then @facing_tile = @map.tile_at(@x, @y - 64)
    when :down then @facing_tile = @map.tile_at(@x, @y + 64)
    when :left then @facing_tile = @map.tile_at(@x - 64, @y)
    when :right then @facing_tile = @map.tile_at(@x + 64, @y)
    end
  end

  def accelerate(direction)
    @window.set_timer(5) if direction != @direction
    @direction = direction
    calc_animation
    set_facing
    if !@window.timer.waiting
      case @direction
      when :up
        @expected_tile = @map.tile_at(@x, @y - 64)
        @expected_tile.collidable ? @window.fx(:collision) : @vel_y = -4
      when :down
        @expected_tile = @map.tile_at(@x, @y + 64)
        @expected_tile.collidable ? @window.fx(:collision) : @vel_y = 4
      when :left
        @expected_tile = @map.tile_at(@x - 64, @y)
        @expected_tile.collidable ? @window.fx(:collision) : @vel_x = -4
      when :right
        @expected_tile = @map.tile_at(@x + 64, @y)
        @expected_tile.collidable ? @window.fx(:collision) : @vel_x = 4
      end
      @warped = false
    end
  end

  def update
    if !@window.timer.waiting
      case @direction
      when :up
        @y += @vel_y
        if @y <= @expected_tile.y
          @current_tile = @map.tile_at(@x, @y)
          @current_tile.walk_on if !@warped
          @vel_y = 0
        end
        @vel_x = 0
      when :down
        @y += @vel_y
        if @y >= @expected_tile.y
          @current_tile = @map.tile_at(@x, @y)
          @current_tile.walk_on if !@warped
          @vel_y = 0
        end
        @vel_x = 0
      when :left
        @x += @vel_x
        if @x <= @expected_tile.x
          @current_tile = @map.tile_at(@x, @y)
          @current_tile.walk_on if !@warped
          @vel_x = 0
        end
        @vel_y = 0
      when :right
        @x += @vel_x
        if @x >= @expected_tile.x
          @current_tile = @map.tile_at(@x, @y) 
          @current_tile.walk_on if !@warped
          @vel_x = 0
        end
        @vel_y = 0
      end
      set_facing
    end
  end

  def calc_animation
    @current_anim = 
    case @direction
    when :up then [@animation[8],@animation[9],@animation[10],@animation[11]]
    when :down then [@animation[0],@animation[1],@animation[2],@animation[3]]
    when :right then [@animation[12],@animation[13],@animation[14],@animation[15]]
    when :left then [@animation[4],@animation[5],@animation[6],@animation[7]]
    end
    @max_energy / (@energy.nonzero? || 1) <= 0.20 ? @animation_speed = 400 : @animation_speed = 200
  end

  def draw(move = true)
    if move
      img = @current_anim[Gosu::milliseconds / @animation_speed % 4]
      @current_frame = img
    else
      img = @current_frame
    end
    img.draw(320, 320, 2, 4, 4)
  end
end