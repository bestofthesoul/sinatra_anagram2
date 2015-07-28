# File.open('words') do |f|
#   f.each do |word|
#     sorted_word = word.split(//).sort.join
#     Word.create(word: word, sorted_word: sorted_word)
#   end
# end

# 20150323173724_create_sorted_words.rb - Courtest from Jay
sql_query = "INSERT INTO words (word, sorted_word, created_at, updated_at) VALUES "
n = 0
d = 0
ActiveRecord::Base.transaction do
  File.readlines('words').each do |line|
    word = line.chomp
    sql_query << "('#{word}', '#{word.split(//).sort.join}', now(), now()),"
    n += 1
    if n >= 1000
      d += 1
      print "#{d}."
      ActiveRecord::Base.connection.execute(sql_query[0, sql_query.length - 1] << ";")
      sql_query = "INSERT INTO words (word, sorted_word, created_at, updated_at) VALUES "
      n = 0
    end
  end
  ActiveRecord::Base.connection.execute(sql_query[0, sql_query.length - 1] << ";")
end
puts ""