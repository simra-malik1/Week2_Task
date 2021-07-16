# frozen_string_literal: true

require 'csv'

correct_answers = {}
size_of_arr = 0

# Save Correct Answers from file
file = File.open('problems.csv', 'r')
until file.eof?
  line = file.readline
  data = line.split(',')
  correct_answers [size_of_arr] = data[1]
  size_of_arr += 1
end

response_of_user = {}
questions_count = 0

# Ask Questions from the user and store it
puts 'Lets start the Quiz:'
file = File.open('problems.csv', 'r')
until file.eof?
  line = file.readline
  data = line.split(',')
  puts "What #{data[0]} Sir?"
  response_of_user[questions_count] = gets
  questions_count += 1
end

# Check that how many responses is correct
correct_response = 0
(0..questions_count - 1).each do |i|
  correct_response += 1 if correct_answers[i] == response_of_user[i]
end

puts "Total Number of Questions Correct: #{correct_response}"
puts "Total Questions :#{questions_count}"
