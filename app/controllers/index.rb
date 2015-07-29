#METHOD 1
#: 1ST STEP
get '/' do

  erb :index
end
#: 2ND STEP
post '/search_anagrams' do
  # a = Word.pluck(:word)
  # @anagrams = Word.anagrams(params[:user_input],a)
  # puts @anagrams
  # erb :index
  redirect to("/#{params[:user_input]}")
end

#METHOD 2: TYPE IN LOCALHOST.../CHICKEN(FOR EG.)
get '/*' do
  a = Word.pluck(:word)
  word = "#{request.path}"[1..-1]
  list = Word.anagrams(word,a)
  erb :general, :locals => { :@anagrams => list, :url_word => word}
end