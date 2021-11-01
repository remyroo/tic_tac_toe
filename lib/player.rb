class Player
  attr_accessor :name, :marker

  def initialize(name, marker)
    @name = name.capitalize
    @marker = marker
  end

  def info
    "#{name} is playing with the marker: #{marker}"
  end
end
