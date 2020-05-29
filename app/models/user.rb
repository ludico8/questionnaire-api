class User < ApplicationRecord
  has_many :answers
  has_many :questions, through: :answers

  validates_presence_of :name
  validates_presence_of :email

  # It returns all the users that match with the provided params
  #   @param user_id, integer, User identifier
  #   @param user_name, string, to search by user name
  #   @param user_email, string, to search by user email
  def self.get_filtered_users(params)
    where_clause = [""]
    if params["user_id"].present?
      where_clause[0] = "id IN (?)"
      where_clause.push(params["user_id"].split(","))
    end

    if params["user_email"].present?
      clause = "UPPER(email) like UPPER(?)"
      where_clause[0] = where_clause[0].blank? ? clause : "#{where_clause[0]} AND #{clause}"
      where_clause.push("%#{params["user_email"]}%")
    end

    if params["user_name"].present?
      clause = "UPPER(name) like UPPER(?)"
      where_clause[0] = where_clause[0].blank? ?  clause : "#{where_clause[0]} AND #{clause}"
      where_clause.push("%#{params["user_name"]}%")
    end
    
    where_clause.length > 1 ? self.where(where_clause) : self.all
  end

  # It returns all the questions that belongs to the user and match with the provided params
  #   @param question_id, [integer, integer, ...], to search by Question Ids
  #   @param question_label, string, to search by label
  #   @param active_question, boolean, to search by active questions
  def get_filtered_user_questions(params)
    where_clause = [""]

    if params["question_id"].present?
      where_clause[0] = "questions.id IN (?)"
      where_clause.push(params["question_id"].split(","))
    end

    if params["question_label"].present?
      clause = "UPPER(label) like UPPER(?)"
      where_clause[0] = where_clause[0].blank? ? clause : "#{where_clause[0]} AND #{clause}"
      where_clause.push("%#{params["question_label"]}%")
    end

    if params["active_question"].present?
      clause = "active = (?)"
      where_clause[0] = where_clause[0].blank? ? clause : "#{where_clause[0]} AND #{clause}"
      active = params["active_question"].to_s === "true" ? true : false
      where_clause.push(active)
    end

    where_clause.length > 1  ? self.questions.where(where_clause) : self.questions
  end

  # It returns the answers for a group of questions and match with the provided params
  #   @param question_ids, [integer,integer,...], to look the answers for these questions
  #   @param answer, string, to search by answer
  def get_answers_from_questions(question_ids, params)
    where_clause = ["question_id IN (?)"]
    where_clause.push(question_ids)
    
    if params["answer"].present?
      clause = "UPPER(answer) like UPPER(?)"
      where_clause[0] = "#{where_clause[0]} AND #{clause}"
      where_clause.push("%#{params["answer"]}%")
    end

    self.answers.where(where_clause)
  end
end