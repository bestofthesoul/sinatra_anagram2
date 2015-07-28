get '/:input' do
  a = Word.pluck(:word)

  @anagrams = Word.anagrams(params[:input],a)
  puts @anagrams

  erb :index
end



# <%= @anagrams.each do |x| print x end %><br>