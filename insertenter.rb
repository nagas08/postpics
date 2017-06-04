p filename = ARGF.filename   #=> text.txt

ARGF.each_line do |line|

  #ファイル行数
#print line
print line.gsub(",",",\n")

end
