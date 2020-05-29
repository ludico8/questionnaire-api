I18n.locale = :en

Answer.delete_all
Question.delete_all
User.delete_all

user_list = [
  ["Orla Mcdonald", "ormc@gmail.com"],
  ["Kara Garner", "garne_ka@gmail.com"],
  ["Rosie Cruz", "ros19cz@gmail.com"],
  ["Alvin Bean", "albn@gmail.com"],
  ["Franklin Watson", "frankw@gmail.com"],
  ["Carlos Gibbs", "gibbs012@gmail.com"],
  ["Emanuel Ballard", "balleman@gmail.com"]
]

p '================================================ Creating Users  ============================================================='

user_list.each do |name, email|
  User.create( name: name, email: email )
end

question_list = [
  ["Do You Like To Cook?", true],
  ["What Is Your Favorite Hobby?", true],
  ["Do You Drink Coffee Or Tea?", true],
  ["Do You Believe In Luck?", false],
  ["What Is Your Favorite Meal Of The Day?", true],
  ["What Do You Do For A Living?", false],
  ["What Is Your Favorite Season, And Why?", true],
  ["What Makes You Laugh The Most?", true],
  ["What Is The Best Pizza Topping Combination?", true],
  ["What’s The Coolest Thing About Science?", true]
]

p '================================================ Creating Questions  ========================================================='

question_list.each do |label, active|
  Question.create( label: label, active: active )
end

question_7_id = Question.all[6].id
question_8_id = Question.all[7].id
question_9_id = Question.all[8].id
question_10_id = Question.all[9].id

answer_list = [
  # Question #1 answers
  [Question.first.id, "Yes, I like it", User.first.id],
  [Question.first.id, "Nop, too much sugar", User.second.id],
  [Question.first.id, "Just in summer", User.third.id],
  
  # Question #2 answers
  [Question.second.id, "I like Photography", User.first.id],
  [Question.second.id, "It would be soccer!", User.fourth.id],
  [Question.second.id, "Camping, absolutely...", User.fifth.id],
  
  # Question #3 answers
  [Question.third.id, "I like Tea", User.first.id],
  [Question.third.id, "Coffee", User.all[5].id],
  [Question.third.id, "Neither coffee or tea", User.fourth.id],
  
  # Question #5 answers
  [Question.fifth.id, "Breakfast!", User.third.id],
  [Question.fifth.id, "A prefered a snack...", User.all[5].id],
  [Question.fifth.id, "Dinner", User.fifth.id],
  
  # Question #7 answers
  [question_7_id, "Summer", User.first.id],
  [question_7_id, "Summer!!!", User.all[5].id],
  [question_7_id, "Summer, no doubt", User.second.id],
  
  # Question #8 answers
  [question_8_id, "The guys from the Jackass movies", User.first.id],
  [question_8_id, "My children", User.second.id],
  [question_8_id, "Memes and stuff like that", User.third.id],
  
  # Question #9 answers
  [question_9_id, "Ham and pineapple, classic!", User.fourth.id],
  [question_9_id, "Barbecue sauce and chicken, arg :P", User.fifth.id],
  [question_9_id, "Garlic and ranch", User.all[5].id],
  
  # Question #10 answers
  [question_10_id, "The intrigue of the uncertain", User.first.id],
  [question_10_id, "It's beauty", User.all[5].id],
  [question_10_id, "It's complexity", User.second.id]
]

p '================================================ Creating Answers  ==========================================================='
answer_list.each do |question_id, answer, user_id|
  Answer.create( question_id: question_id, answer: answer, user_id: user_id )
end