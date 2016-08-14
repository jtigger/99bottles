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
    if fits_in_six_packs(@drinks)
      "#{six_pack_quantity} #{six_pack_container} of beer"
    else
      "#{bottle_quantity} #{bottle_container} of beer"
    end
  end

  def bottle_quantity
    if @drinks == 0
      "no more"
    else
      @drinks.to_s
    end
  end

  def bottle_container
    if @drinks == 1
      "bottle"
    else
      "bottles"
    end
  end

  def six_pack_quantity
    num_six_packs(@drinks).to_s
  end

  def six_pack_container
    if num_six_packs(@drinks) == 1
      "six-pack"
    else
      "six-packs"
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
  def fits_in_six_packs(drinks)
    (drinks != 0 && drinks % 6 == 0)
  end

  def num_six_packs(drinks)
    drinks / 6
  end
end

