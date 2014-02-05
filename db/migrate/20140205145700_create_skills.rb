class CreateSkills < ActiveRecord::Migration
 def change
  create_table :skills do |t|
   t.integer :kanji_to_english
   t.integer :english_to_kanji
   t.integer :kanji_to_pronunciation
   t.integer :pronunciation_to_kanji
   t.integer :english_to_pronunciation
   t.integer :pronunciation_to_english
   t.integer :k_e_reps
   t.integer :e_k_reps
   t.integer :k_p_reps
   t.integer :p_k_reps
   t.integer :e_p_reps
   t.integer :p_e_reps
 end
end