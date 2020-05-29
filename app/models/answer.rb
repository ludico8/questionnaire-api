class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  # It returns all the answers based on the provided Hash param, the hash could contain the following parameters:
  #   @param default_search, boolean, indicates if it should ignore the matching functionality
  def self.get_filtered_answers(params, default_search)
    result = []
    @users = default_search ? User.all : User.get_filtered_users(params)

    @users.each do |user|
      @user_questions = default_search ? user.questions : user.get_filtered_user_questions(params)
      @user_answers = default_search ? user.answers : user.get_answers_from_questions(@user_questions.pluck(:id), params)
      next if @user_answers.length == 0

      new_row = { "id" => user.id, "name" => user.name, "email" => user.email, "questions" => []}

      @user_answers.each do |answer|
          new_row["questions"].push({
            "id" => answer.question.id,
            "label" => answer.question.label,
            "active" => answer.question.active,
            "answer" =>  { "id" => answer.id, "answer" => answer.answer}
          })
      end

      result.push(new_row)
    end
    
    return result
  end
end
