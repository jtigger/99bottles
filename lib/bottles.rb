class Bottles
  def verse(num_bottles)
    first_suffix = (num_bottles) == 1 ? '' : 's'
    second_suffix = (num_bottles-1) == 1 ? '' : 's'

    adjective = (num_bottles > 1) ? "one" : "it"

    num_bottles_before = (num_bottles > 0) ? (num_bottles) : "no more"
    num_bottles_after = (num_bottles-1 > 0) ? (num_bottles-1) : "no more"

    num_bottles_before_first = (num_bottles > 0) ? (num_bottles) : "No more"

    first_line = "#{num_bottles_before_first} bottle#{first_suffix} of beer on the wall, #{num_bottles_before} bottle#{first_suffix} of beer.\n"
    second_line = "Take #{adjective} down and pass it around, #{num_bottles_after} bottle#{second_suffix} of beer on the wall.\n"

    if num_bottles == 0
      second_line = "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end

    first_line + second_line
  end

  def verses(num_bottles_to_start, num_bottles_to_stop)
    result = ""
    num_bottles = num_bottles_to_start
    while num_bottles >= num_bottles_to_stop
      result += verse(num_bottles)
      num_bottles = num_bottles - 1
      if num_bottles >= num_bottles_to_stop
        result += "\n"
      end
    end
    result
  end

  def song
    verses(99, 0)
  end
end
