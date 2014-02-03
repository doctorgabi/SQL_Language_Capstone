class Skill

 attr_accessor :english_to_pronunciation, :pronunciation_to_english, :kanji_to_english, :english_to_kanji, :kanji_to_pronunciation, :pronunciation_to_kanji, :k_e_reps, :e_k_reps, :k_p_reps, :p_k_reps, :e_p_reps, :p_e_reps
 attr_reader :id

 def initialize attributes = {}
  update_attributes(attributes)
 end

 def self.create attributes = {}
  skill = Skill.new(attributes)
  skill.save
  skill
 end

 def update attributes = {}
  update_attributes(attributes)
  save
 end

 def save
  database = Environment.database_connection
  if id
   database.execute("update skills set
    english_to_pronunciation = '#{english_to_pronunciation}'
    pronunciation_to_english = '#{pronunciation_to_english}',
    kanji_to_english = '#{kanji_to_english}',
    english_to_kanji = '#{english_to_kanji}',
    kanji_to_pronunciation = '#{kanji_to_pronunciation}',
    pronunciation_to_kanji = '#{pronunciation_to_kanji}',
    e_p_reps = '#{e_p_reps}',
    p_e_reps = '#{p_e_reps}',
    k_e_reps = '#{k_e_reps}',
    e_k_reps = '#{e_k_reps}',
    k_p_reps = '#{k_p_reps}',
    p_k_reps = '#{p_k_reps}',
    where id = #{id}")
  else
   # database.execute("insert into skills(english_to_pronunciation, pronunciation_to_english, kanji_to_english, english_to_kanji, kanji_to_pronunciation, pronunciation_to_kanji, k_e_reps, e_k_reps, k_p_reps, p_k_reps, e_p_reps, p_e_reps) values('-1', '-1', '-1', '-1', '-1', '-1', '0', '0', '0', '0', '0', '0')")
   database.execute("insert into skills(
    english_to_pronunciation,
    pronunciation_to_english,
    kanji_to_english,
    english_to_kanji,
    kanji_to_pronunciation,
    pronunciation_to_kanji,
    e_p_reps,
    p_e_reps,
    k_e_reps,
    e_k_reps,
    k_p_reps,
    p_k_reps
    )values('-1', '-1', '-1', '-1', '-1', '-1', '0', '0', '0', '0', '0', '0')")
   @id = database.last_insert_row_id
  end
 end

 def self.all
  database = Environment.database_connection
  database.results_as_hash = true
  results = database.execute("select * from skills")
  results.map do |row_hash|
   skill = Skill.new(row_hash)
   skill.send("id=", row_hash["id"])
   skill
  end
 end

 def self.find_or_create english_to_pronunciation
  database = Environment.database_connection
  database.results_as_hash = true
  skill = Skill.new(english_to_pronunciation)
  results = database.execute("select * from skills where english_to_pronunciation = '#{skill.english_to_pronunciation}'")

  if results.empty?
   database.execute("insert into skills(english_to_pronunciation) values('#{skill.english_to_pronunciation}')")
   skill.send("id=", database.last_insert_row_id)
  else
   row_hash = results[0]
   skill.send("id=", row_hash["id"])
  end
  skill
 end

 protected

 def id=(id)
  @id = id
 end

 def update_attributes(attributes)
  [:english_to_pronunciation, :pronunciation_to_english, :kanji_to_english, :english_to_kanji, :kanji_to_pronunciation, :pronunciation_to_kanji, :k_e_reps, :e_k_reps, :k_p_reps, :p_k_reps, :e_p_reps, :p_e_reps].each do |attr|
    if attributes[attr]
     self.send("#{attr}=", attributes[attr])
    end
  end
 end


end