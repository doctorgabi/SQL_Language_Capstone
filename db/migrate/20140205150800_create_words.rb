class CreateWords < ActiveRecord::Migration
 def change
  create_table :words do |t|
   t.string :kanji
   t.string :onyomi
   t.string :kunyomi
   t.string :english
   t.string :jlptlevel
   t.string :category
 end
end