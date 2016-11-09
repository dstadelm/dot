#!/usr/bin/env ruby 

require 'rubygems'
require 'rubyXL'
require 'date'
require 'pp'
require 'fileutils'

class Xlsx2Ruby
  def parse(file)
    workbook = RubyXL::Parser.parse(file)
    workbook.each_with_index do |wb,i|

      caption =  wb.sheet_name
      File.open("#{caption.gsub(/ /,"_")}.tex","w") do |file|
        table = workbook[i].get_table()
        file.printf "\\begin{longtable}{"
        workbook[i][0].each_with_index do |cell,c_idx|
          file.printf "|" if workbook[i][0][c_idx].border_left == "thin"
          file.printf "||" if workbook[i][0][c_idx].border_left == "double"
          file.printf "l" if workbook[i][0][c_idx].horizontal_alignment == "left" or workbook[i][0][c_idx].horizontal_alignment.nil?
          file.printf "r" if workbook[i][0][c_idx].horizontal_alignment == "right"
          file.printf "c" if workbook[i][0][c_idx].horizontal_alignment == "center"
        end
        file.printf "|}" unless workbook[i][0].last.border_right.nil?
        file.printf "\n"
        file.printf "\\hline\n"
        file.printf "\\rowcolor{scs-tableheader}"
        table[:sorted_headers].each_with_index do |value,c_idx|
          file.printf " &" unless c_idx == 0
          file.printf "#{value}"
        end
        file.puts "\\\\"
        file.puts "\\hline"
        file.puts "\\endhead"
        workbook[i].sheet_data[0].each do |cell|
          
        end
        table[:table].each_with_index do |row,r_idx|
          unless row.empty?
            underline = nil
            row.each_with_index do |value, c_idx|
              file.printf " &" unless c_idx == 0
              value[1].gsub!(/_/,"\\_") if value[1].class == String
              value[1].gsub!(/\\\\_/,"\\_") if value[1].class == String
              file.printf "#{value[1]}"
              
              unless workbook[i][r_idx+1][c_idx].nil?
                unless underline == "double"
                  underline = workbook[i][r_idx+1][c_idx].border_bottom
                end
              end
            end
            file.puts "\\\\"
            unless underline.nil?
              file.printf "\\hline"
              if underline == "medium"
                file.printf "\\hline"
              elsif underline == "double"
#                file.puts "\\\\"
                file.printf " \\hline"
              end
              file.printf "\n"
            end
          end
        end
        file.puts "\\caption{#{caption}}"
        file.puts "\\label{tab:#{caption.gsub(/ /,"")}}"
        file.puts "\\end{longtable}"
        
      end
    end
  end


end

def usage 
    puts
    puts "Usage:"
    puts "xlsx2Latex.rb <FILE>"
    puts

end

if __FILE__ == $0
  parser = Xlsx2Ruby.new 
  
  if ARGV[0].nil?
    usage
  elsif File.exists?(ARGV[0])
    parser.parse(ARGV[0])
    date_string = Date.new(Date.today.year,Date.today.month,Date.today.day).to_s
    date_string.gsub!(/-/,"_")
    Dir["#{date_string}*"].each do |mdir|
      FileUtils.rm_rf mdir
    end
  else 
    usage
  end
end
