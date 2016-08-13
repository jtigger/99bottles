class Bottles
  def verse(num_bottles)
    case num_bottles
    when 0
      first_line = "No more bottles of beer on the wall, no more bottles of beer.\n"
      second_line = "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      first_line = "#{num_bottles} bottle of beer on the wall, #{num_bottles} bottle of beer.\n"
      second_line = "Take it down and pass it around, #{(num_bottles-1 > 0) ? (num_bottles-1) : "no more"} bottles of beer on the wall.\n"
    when 2
      first_line = "#{num_bottles} bottles of beer on the wall, #{num_bottles} bottles of beer.\n"
      second_line = "Take one down and pass it around, #{(num_bottles-1)} bottle of beer on the wall.\n"
    else
      first_line = "#{num_bottles} bottles of beer on the wall, #{num_bottles} bottles of beer.\n"
      second_line = "Take one down and pass it around, #{(num_bottles-1)} bottle#{(num_bottles-1) == 1 ? '' : 's'} of beer on the wall.\n"
    end

    first_line + second_line
  end

  def verses(num_bottles_to_start, num_bottles_to_stop)
    num_bottles_to_start.downto(num_bottles_to_stop).map { |num_bottles| verse(num_bottles) }.join("\n")
  end

  def song
    verses(99, 0)
  end
end
