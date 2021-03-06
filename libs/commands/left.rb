module Commands
  module Left
    def left(args='')
      if self.placed?
        _direction_index = directions.index(self.direction.upcase)

        index = (_direction_index - 1) % directions.size
        self.direction = directions[index]

        self
      end
    end
  end
end
