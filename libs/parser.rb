class Parser
  def initialize(valid_commands:)
    @valid_commands = valid_commands.map(&:downcase)
  end

  def valid?(line)
    command, _ = line.downcase.split(' ')
    valid_commands.include?(command)
  end

  private
  attr_accessor :valid_commands
end

