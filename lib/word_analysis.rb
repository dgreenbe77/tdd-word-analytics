class Words
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def word_count
    @text.split(' ').count
  end

  def element_count(regex)
    textray = @text.scan(regex).count
  end

  def common_words
    wordray = @text.split('').delete_if {|element| element.match(/[-!$%^&*()_+|~=`{}#@\[\]:";'<>?,.\/]/)}.join('').split(' ')
    word_count = wordray.inject(Hash.new(0)) {|hash, word| hash[word.downcase] += 1; hash}.sort_by {|k,v| v}.pop(3)
  end

  def common_letters
    @text.scan(/[a-zA-Z]/).inject(Hash.new(0)){|hash, char| hash[char] += 1; hash}.sort_by {|k,v| v}.pop(3)
  end

  def unique_words
    uniqray = @text.downcase.split('').delete_if {|element| element.match(/[-!$%^&*()_+|~=`{}#@\[\]:";'<>?,.\/]/)}.join('').scan(/\w+/)
    unique_count = uniqray.inject(Hash.new(0)) {|hash, word| hash[word.downcase] += 1; hash}.select {|k,v| v == 1}.count
  end

end






 # textray = @text.split('')
    # textray.each do |element|
    #  @counter += 1 if element =~ regex
    # end
    # @counter
