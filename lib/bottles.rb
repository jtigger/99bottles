class Bottles
  def verse(drinks)
    container = Bottle.new(drinks)
    "#{container.quantity.capitalize} #{container.name} of beer on the wall, #{container.quantity} #{container.name} of beer.\n" +
    "#{action(drinks)}, #{container.one_fewer.quantity} #{container.one_fewer.name} of beer on the wall.\n"
  end

  def action(drinks)
    if drinks == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(drinks)} down and pass it around"
    end
  end

  def pronoun(drinks)
    if drinks == 1
      "it"
    else
      "one"
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
