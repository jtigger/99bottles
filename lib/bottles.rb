class Bottles
  def verse(stash)
    "#{stash.how_much_left.capitalize} on the wall, #{stash.how_much_left}.\n" +
    "#{take_action(stash.drinks)}, #{stash.one_fewer.how_much_left} on the wall.\n"
  end

  def take_action(drinks)
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

  def verses(drinks_to_start, drinks_to_stop)
    drinks_to_start.downto(drinks_to_stop).map { |drinks| verse(Stash.new(drinks))}.join("\n")
  end

  def song
    verses(99, 0)
  end
end


class Stash
  def initialize(drinks)
    @drinks = drinks
  end

  def how_much_left
    "#{quantity} #{container}"
  end

  def quantity
    case @drinks
    when 0
      "no more"
    when 6
      "1"
    else
      @drinks.to_s
    end
  end

  def container
    case @drinks
    when 1
      "bottle of beer"
    when 6
      "six-pack of beer"
    else
      "bottles of beer"
    end
  end

  def one_fewer
    if @drinks == 0
      Stash.new(99)
    else
      Stash.new(@drinks-1)
    end
  end

  def drinks
    @drinks
  end
end

