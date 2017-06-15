require 'fileutils'
def check_xml(file)
  text = File.open(file, "r:UTF-8").read
  match = 0
  line_num = 0
  text.each_line{|line| 
    line_num += 1
    goods_start = line =~ /<goods .*>/
    if goods_start then
      match += 1
      next
    end
    goods_end = line =~ /<\/goods>/
    if goods_end then
      match -= 1
      if match == 0 then
        next
      else
        raise "error : not match at #{line_num}, content =  #{line}, "  
      end
      next
    end
  }
  puts "ok"
end

check_xml "goods.xml"