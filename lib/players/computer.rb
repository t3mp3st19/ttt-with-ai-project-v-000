module Players
  class Computer < Player

    attr_accessor :board
    #played perfectly is unwinnable. logic - like on turn 1 always pic middle or go to corner. min/max algorithm may not work.
    def move(board)
      @board = board
      case input
        input = gets.strip
      when winning != nil
        input = winning + 1
      when blocking != nil
        input = blocking + 1
      when center?
        input = 5
      when opposite != nil && @board.taken?(opposite) == false
        input = opposite
      when corner
        input = corner + 1
      else
        until @board.taken?(input)
          input = (1..9).to_a.sample
      end
      input.to_s
    end

    #it accepts board. it returns the move from the computer in a 1-9 string. must make a valid move.
    def opposite
      case
      when board.taken?(1) && !board.taken?(9)
          9
        when board.taken?(9) && !board.taken?(1)
          1
        when board.taken?(3) && !board.taken?(7)
          7
        when board.taken?(7) && !board.taken?(3)
          3
        else
          nil
      end
    end

  end
end
