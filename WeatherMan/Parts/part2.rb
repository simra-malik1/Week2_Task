module Part2
  def self.execute()
    # Get year/month from command line argument
    year_month = ARGV[1].split('/')
    year = year_month[0].to_i
    month = year_month[1]

    # Convert month no. into  month name
    month_name = Date::ABBR_MONTHNAMES[month.to_i]

    # Get path from command line argument
    command_path = ARGV[-1].split('/')
    text_file = command_path[-1]
    filename = text_file + "_#{year}_#{month_name}.txt"

    # Open and read file
    path = "#{ARGV[-1]}/#{filename}"

    # Reading 1 line at a time
    file = File.open(path, 'r')
    line_number = 1

    # Declare Arrays
    highest_temp_array = []
    lowest_temp_array = []
    humidity_array = []

    # Store the data from file into an arrays:
    until file.eof?
      line = (file.readline).split(',')
      highest_temp_array.push(line[1].to_i) if line[1].to_i != 0
      lowest_temp_array.push(line[3].to_i) if line[3].to_i != 0
      humidity_array.push(line[7].to_i) if line[7].to_i != 0
      line_number += 1
    end
    file.close

    # Find the sum of all max_temp and then find average of it
    highest_temp_sum = highest_temp_array.inject(0) { |sum, i| sum + i }
    highest_temp_count = highest_temp_array.count
    puts "Highest Average: #{highest_temp_sum / highest_temp_count}C"

    # Find the sum of all min_temp and then find average of it
    lowest_temp_sum = lowest_temp_array.inject(0) { |sum, i| sum + i }
    lowest_temp_count = lowest_temp_array.count
    puts "Lowest Average: #{lowest_temp_sum / lowest_temp_count}C"

    # Find the sum of all humidity and then find average of it
    humidity_sum = humidity_array.inject(0) { |sum, i| sum + i }
    humidity_count = humidity_array.count
    puts "Average Humidity: #{humidity_sum / humidity_count}%"
  end
end
