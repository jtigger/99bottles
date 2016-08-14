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
    if fits_in_six_pack(@drinks)
      (@drinks / 6).to_s
    else
      if @drinks == 0
        "no more"
      else
        @drinks.to_s
      end
    end
  end

  def container
    if fits_in_six_pack(@drinks)
      "six-pack of beer"
    else
      if @drinks == 1
        "bottle of beer"
      else
        "bottles of beer"
      end
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

  private

  def fits_in_six_pack(drinks)
    drinks != 0 && (drinks % 6 == 0)
  end
end

