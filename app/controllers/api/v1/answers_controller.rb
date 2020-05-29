module Api
  module V1
    class AnswersController < ApplicationController
      before_action :set_answer, only: [:show, :destroy]

      # Get answers
      def index
        @answers = Answer.order('created_at DESC')
        json_response({status: 'SUCCESS', message: 'Loaded answers', data: @answers})
      end

      # Get specific Answer by id
      def show
        json_response({status: 'SUCCESS', message: 'Loaded answer', data: @answer})
      end

      # Create a new answer, if answer already exists 
      # for a particular user/question, then updates
      # the answer
      def create
        answer = Answer.find_or_create_by({ user_id: answer_params["user_id"].to_i, question_id: answer_params["question_id"].to_i })

        if answer.update(answer: answer_params["answer"])
          json_response({status: 'SUCCESS', message: 'Saved answer', data: answer}, :created)
        else
          json_response({status: 'ERROR', message: 'Answer not saved', data: answer.errors}, :unprocessable_entity)
        end
      end

      # Search answers
      def search
        # Pending implementation ...
        json_response({status: 'SUCCESS', message: 'Answers', data: []}, :created)
      end

      # Deletes specific Answer by id
      def destroy
        @answer.destroy
        json_response({status: 'SUCCESS', message: 'Deleted answer'}, :no_content)
      end

      private
      def answer_params
        params.permit(:question_id, :answer, :user_id)
      end

      def set_answer
        @answer = Answer.find(params[:id])
      end

      def default_search?
        if params["question_id"].present? ||
            params["question_label"].present? ||
            params["active_question"].present? ||
            params["answer"].present? ||
            params["user_id"].present? ||
            params["user_name"].present? ||
            params["user_email"].present?
          return false
        else
          return true
        end
      end
    end
  end
end