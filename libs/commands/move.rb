module Commands
  module Move
    def move(args='')
      if placed?
        case(direction)
        when "NORTH"
          self.y += 1 if board.valid_placement?(x: x, y: y + 1)
        when "SOUTH"
          self.y -= 1 if board.valid_placement?(x: x, y: y - 1)
        when "EAST"
          self.x += 1 if board.valid_placement?(x: x + 1, y: y)
        when "WEST"
          self.x -= 1 if board.valid_placement?(x: x - 1, y: y)
        end
      end
    end
  end
end

