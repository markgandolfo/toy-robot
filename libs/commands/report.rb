module Commands
  module Report
    def report(args='')
      if self.placed?
        puts "#{x},#{y},#{direction}"
      end
    end
  end
end
