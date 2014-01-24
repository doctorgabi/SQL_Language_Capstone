class Word
 attr_accessor :kanji, :onyomi, :kunyomi, :english, :jlptlevel, :category

 def initialize attributes = {}
   # Long Way: @category = attributes[:category]
   # Short Way:
  attributes.each_pair do |attribute, value|
   self.send("#{attribute}=", value)
  end
 end

 def to_s
  "kanji: #{kanji}, onyomi: #{onyomi}, kunyomi: #{kunyomi}, english: #{english}, JLPT level: #{jlptlevel}, category: #{category}"
 end

end