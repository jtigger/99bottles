class Bottles
  def verse(drinks)
    case drinks
    when 6
      container = SixPack.new(drinks)
      "#{container.quantity.capitalize} #{container.name} of beer on the wall, #{container.quantity} #{container.name} of beer.\n" +
      "#{container.action}, 5 bottles of beer on the wall.\n"
    when 7
      "7 bottles of beer on the wall, 7 bottles of beer.\n" +
      "Take a bottle down and pass it around, 1 six-pack of beer on the wall.\n"
    else
      container = Bottle.new(drinks)
      "#{container.quantity.capitalize} #{container.name} of beer on the wall, #{container.quantity} #{container.name} of beer.\n" +
      "#{container.action}, #{container.one_fewer.quantity} #{container.one_fewer.name} of beer on the wall.\n"
    end
  end

  class SixPack
    def initialize(drinks)
      @sixpacks = drinks / 6
    end

    def quantity
      @sixpacks.to_s
    end

    def name
      if @sixpacks == 1
        "six-pack"
      else
        "six-packs"
      end
    end

    def action
      "Take a bottle down and pass it around"
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

    def action
      if @drinks == 0
        "Go to the store and buy some more"
      else
        "Take #{pronoun(@drinks)} down and pass it around"
      end
    end

    def one_fewer
      if @drinks == 0
        Bottle.new(99)
      else
        Bottle.new(@drinks - 1)
      end
    end

    private

    def pronoun(drinks)
      if drinks == 1
        "it"
      else
        "one"
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
