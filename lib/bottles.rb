class Bottles
  def verse(drinks)
    container = Bottle.new(drinks)
    case drinks
    when 0
      "#{container.quantity.capitalize} #{container.name} of beer on the wall, #{container.quantity} #{container.name} of beer.\n" +
      "Go to the store and buy some more, #{container.one_fewer.quantity} #{container.one_fewer.name} of beer on the wall.\n"
    when 1
      "#{container.quantity.capitalize} #{container.name} of beer on the wall, #{container.quantity} #{container.name} of beer.\n" +
      "Take it down and pass it around, #{container.one_fewer.quantity} #{container.one_fewer.name} of beer on the wall.\n"
    when 2
      "#{container.quantity.capitalize} #{container.name} of beer on the wall, #{container.quantity} #{container.name} of beer.\n" +
      "Take one down and pass it around, #{container.one_fewer.quantity} #{container.one_fewer.name} of beer on the wall.\n"
    else
      "#{container.quantity.capitalize} #{container.name} of beer on the wall, #{container.quantity} #{container.name} of beer.\n" +
      "Take one down and pass it around, #{container.one_fewer.quantity} #{container.one_fewer.name} of beer on the wall.\n"
    end
  end

  class Bottle
    def initialize(drinks)
      @drinks = drinks
    end

    def quantity
      if @drinks == 0
        "no more"
      else
        @drinks.to_s
      end
    end

    def name
      if @drinks == 1
        "bottle"
      else
        "bottles"
      end
    end

    def one_fewer
      if @drinks == 0
        Bottle.new(99)
      else
        Bottle.new(@drinks - 1)
      end
    end
  end


  def verses(drinks_to_start, drinks_to_end)
    drinks_to_start
      .downto(drinks_to_end)
      .map { |drinks| verse(drinks) }
      .join("\n")
  end

  def song
    verses(99,0)
  end
end
