File.open('words') do |f|
  f.each do |line|
    Word.create(word: line.chomp)
  end
end