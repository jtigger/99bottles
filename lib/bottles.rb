class Bottles
  def verse(drinks)
    case drinks
    when 0
      "#{quantity(drinks).capitalize} bottles of beer on the wall, #{quantity(drinks)} bottles of beer.\n" +
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "#{quantity(drinks)} bottle of beer on the wall, #{quantity(drinks)} bottle of beer.\n" +
      "Take it down and pass it around, #{quantity(drinks-1)} bottles of beer on the wall.\n"
    when 2
      "#{quantity(drinks)} bottles of beer on the wall, #{quantity(drinks)} bottles of beer.\n" +
      "Take one down and pass it around, #{quantity(drinks-1)} bottle of beer on the wall.\n"
    else
      "#{quantity(drinks)} bottles of beer on the wall, #{quantity(drinks)} bottles of beer.\n" +
      "Take one down and pass it around, #{quantity(drinks-1)} bottles of beer on the wall.\n"
    end
  end

  def quantity(drinks)
    if drinks == 0
      "no more"
    else
      drinks.to_s
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
