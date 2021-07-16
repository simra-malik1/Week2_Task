# frozen_string_literal: true

require 'date'
require 'colorize'
require './Parts/part1'
require './Parts/part2'
require './Parts/part3'

# Function to Check Command Line Arguments Count
def check_command_line_arguments_count
  count_of_argument = 0
  ARGV.map do |_a|
    count_of_argument += 1
  end
  if count_of_argument > 3 || count_of_argument < 3
    puts 'Invalid Command Line Arguments'
    exit
  end
end

# Function to get result according to arguments
def get_result(arg)
  # Get year files
  case arg
  when '-e'
    Part1.execute
    # Get year/month files
  when '-a'
    Part2.execute
  when '-c'
    Part3.execute
  end
end

check_command_line_arguments_count

if ARGV[0] == '-e' || ARGV[0] == '-a' || ARGV[0] == '-c'
  get_result(ARGV[0])
else
  puts 'Invalid Arguments'
end
