module Part3
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
    path1 = "#{ARGV[-1]}/#{filename}"
    file = File.open(path1, 'r')
    line_number = 0

    until file.eof?
      line = (file.readline).split(',')
      if line[1].to_i != 0
        print line_number, ' '
        line[1].to_i.times do
          print '+'.red
        end
        print ' ', line[1], 'C'
        puts("\n")
      end
      if line[3].to_i != 0
        print line_number, ' '
        line[3].to_i.times do
          print '+'.blue
        end
        print ' ', line[3], 'C'
        puts("\n")
      end
      line_number += 1
    end
    file.close
  end
end
