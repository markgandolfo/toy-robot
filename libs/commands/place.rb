module Commands
  module Place
    def place(args='')
      x, y, direction = parse_args(args)

      if x && y && direction && self.board.valid_placement?(x:x, y:y)
        self.x = x.to_i
        self.y = y.to_i
        self.direction = direction.upcase
      end

      self
    end

    private
    def parse_args(args)
      args.gsub(' ', '').split(',')
    end
  end
end
