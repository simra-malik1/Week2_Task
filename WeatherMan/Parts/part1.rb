module Part1
  def self.execute()
    # Declare Arrays
    max_temp_array = []
    min_temp_array = []
    humidity_array = []
    max_temp_date_array = []
    min_temp_date_array = []
    humidity_date_array = []
    # Get the year and path from command prompt
    year = ARGV[1]
    path = ARGV[-1]

    # Store all specific year file data into an arrays:
    Dir.glob("#{path}/*#{year}*.txt") do |my_text_file|
      file = File.open(my_text_file, 'r')
      until file.eof?
        line = (file.readline).split(',')
        max_temp_date_array.push(line[0]) if line[0] != 0 && line[1].to_i != 0
        max_temp_array.push(line[1].to_i) if line[1].to_i != 0
        min_temp_date_array.push(line[0]) if line[0] != 0 && line[3].to_i != 0
        min_temp_array.push(line[3].to_i) if line[3].to_i != 0
        humidity_date_array.push(line[0]) if line[0] != 0 && line[7].to_i != 0
        humidity_array.push(line[7].to_i) if line[7].to_i != 0
      end
      file.close
    end
      # Find Highest Temperature from all Maximum Temperature
      max_temp = max_temp_array.max

      # Get the date of Highest Temperature
      max_temp_index = max_temp_array.index(max_temp)
      max_temp_date = max_temp_date_array[max_temp_index].split('-')
      max_temp_month = Date::ABBR_MONTHNAMES[max_temp_date[1].to_i]

      # Find Lowest Temperature from all Minimum Temperature
      low_temp = min_temp_array.min

      # Get the date of Lowest Temperature
      low_temp_index = min_temp_array.index(low_temp)
      low_temp_date = min_temp_date_array[low_temp_index].split('-')
      low_temp_month = Date::ABBR_MONTHNAMES[low_temp_date[1].to_i]

      # Find Highest Humidity from all Humidity
      humid = humidity_array.max

      # Get the date of Highest Humidity
      humidity_index = humidity_array.index(humid)
      hum_date = humidity_date_array[humidity_index].split('-')
      humidity_month = Date::ABBR_MONTHNAMES[hum_date[1].to_i]

      # Show output on the Screen
      puts "Highest:#{max_temp}C on #{max_temp_month} #{max_temp_date[2]} "
      puts "Lowest:#{low_temp}C on #{low_temp_month} #{low_temp_date[2]} "
      puts "Humid:#{humid}% on #{humidity_month} #{hum_date[2]} "
  end
end
