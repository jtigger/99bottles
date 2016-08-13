class Bottles
  def verse(drinks)
    "#{quantity(drinks).capitalize} #{beverages(drinks)} on the wall, #{quantity(drinks)} #{beverages(drinks)}.\n" +
    "#{take_action(drinks)}, #{quantity(one_fewer(drinks))} #{beverages(one_fewer(drinks))} on the wall.\n"
  end

  def quantity(drinks)
    if drinks == 0
      "no more"
    else
      drinks.to_s
    end
  end

  def beverages(drinks)
    if drinks == 1
      "bottle of beer"
    else
      "bottles of beer"
    end
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

  def one_fewer(drinks)
    if drinks == 0
      99
    else
      drinks-1
    end
  end

  def verses(drinks_to_start, drinks_to_stop)
    drinks_to_start.downto(drinks_to_stop).map { |drinks| verse(drinks) }.join("\n")
  end

  def song
    verses(99, 0)
  end
end
