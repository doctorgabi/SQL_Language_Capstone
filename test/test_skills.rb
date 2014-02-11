require_relative 'helper'

class TestSkills < JstudyTest
 def test_01_count_when_no_skills
  assert_equal 3, Skill.count #Three were imported at the start.
 end

 # def test_02_count_of_multiple_skills
 #  Skill.find_or_create("foo")
 #  Skill.find_or_create("bar")
 #  Skill.find_or_create("buz")
 #  assert_equal 6, Skill.count
 # end

 # def test_03_skills_are_created_if_needed
 #  foos_before = Skill.count
 #  Skill.find_or_create("foo")
 #  foos_after = Skill.count
 #  assert_equal foos_before + 1, foos_after
 # end

 # def test_04_skills_are_not_created_if_they_already_exist
 #  Skill.find_or_create("foo")
 #  foos_before = Skill.count
 #  Skill.find_or_create("foo")
 #  foos_after = Skill.count
 #  assert_equal foos_before, foos_after
 # end
end
