class Bottles
  def verse(stash)
    "#{stash.how_much_left.capitalize} of beer on the wall, #{stash.how_much_left} of beer.\n" +
    "#{take_action(stash.drinks)}, #{stash.one_fewer.how_much_left} of beer on the wall.\n"
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
    @container = CONTAINER_TYPES.find { |c| c.fits_exactly?(@drinks) }.new(@drinks)
  end

  def how_much_left
    "#{quantity} #{name}"
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
  def quantity
    @container.quantity == 0 ? 'no more' : @container.quantity.to_s
  end

  def name
    @container.quantity == 1 ? @container.name : @container.name + 's'
  end

  class Bottles
    def self.fits_exactly?(drinks)
      true
    end

    def initialize(drinks)
      @drinks = drinks
    end

    def quantity
      @drinks
    end

    def name
      "bottle"
    end
  end

  class SixPacks
    def self.fits_exactly?(drinks)
      (drinks != 0 && drinks % 6 == 0)
    end

    def initialize(drinks)
      @drinks = drinks
    end

    def quantity
      num_six_packs(@drinks)
    end

    def name
      "six-pack"
    end

    private

    def num_six_packs(drinks)
      drinks / 6
    end
  end

  CONTAINER_TYPES = [SixPacks, Bottles]
end

