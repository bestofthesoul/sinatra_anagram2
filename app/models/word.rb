class Word< ActiveRecord::Base

  def self.canonical(word)
    # Magic goes here
    length = word.length
    newword=word.downcase.split('').sort.join
    return  newword + length.to_s
  end

  def self.anagrams(word, list)
    result = []
      list.each do |singleword|
          if canonical(word) == canonical(singleword)
          result.push(singleword)
          end
      end
    result
  end

end

