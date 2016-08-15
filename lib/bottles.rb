class Bottles
  def verse(drinks)
    case drinks
    when 0
      "#{quantity(drinks).capitalize} #{name(drinks)} of beer on the wall, #{quantity(drinks)} #{name(drinks)} of beer.\n" +
      "Go to the store and buy some more, 99 #{name(drinks-1)} of beer on the wall.\n"
    when 1
      "#{quantity(drinks)} #{name(drinks)} of beer on the wall, #{quantity(drinks)} #{name(drinks)} of beer.\n" +
      "Take it down and pass it around, #{quantity(drinks-1)} #{name(drinks-1)} of beer on the wall.\n"
    when 2
      "#{quantity(drinks)} #{name(drinks)} of beer on the wall, #{quantity(drinks)} #{name(drinks)} of beer.\n" +
      "Take one down and pass it around, #{quantity(drinks-1)} #{name(drinks-1)} of beer on the wall.\n"
    else
      "#{quantity(drinks)} #{name(drinks)} of beer on the wall, #{quantity(drinks)} #{name(drinks)} of beer.\n" +
      "Take one down and pass it around, #{quantity(drinks-1)} #{name(drinks-1)} of beer on the wall.\n"
    end
  end

  def quantity(drinks)
    if drinks == 0
      "no more"
    else
      drinks.to_s
    end
  end

  def name(drinks)
    if drinks == 1
      "bottle"
    else
      "bottles"
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
