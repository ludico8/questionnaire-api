module Api
  module V1
    class QuestionsController < ApplicationController
      before_action :set_question, only: [:show, :update, :destroy]

      # Get questions
      def index
        @questions = Question.order('created_at DESC')
        json_response({status: 'SUCCESS', message: 'Loaded questions', data: @questions})
      end

      # Get specific Question by id
      def show
        json_response({status: 'SUCCESS', message: 'Loaded question', data: @question})
      end

      # Create new question
      def create
        question = Question.new({ label: question_params["label"], active: question_params["active"].to_s == "true"})
        if question.save
          json_response({status: 'SUCCESS', message: 'Saved question', data: question}, :created)
        else
          json_response({status: 'ERROR', message: 'Question not saved', data: question.errors}, :unprocessable_entity)
        end
      end

      # Updates specific Question by id
      def update
        if @question.update(question_params)
          json_response({status: 'SUCCESS', message: 'Updated question'}, :no_content)
        else
          json_response({status: 'ERROR', message: 'Question not updated', data: @question.errors}, :unprocessable_entity)
        end
      end

      # Deletes specific Question by id
      def destroy
        @question.destroy
        json_response({status: 'SUCCESS', message: 'Deleted question'}, :no_content)
      end

      private
      def question_params
        params.permit(:label, :active)
      end

      def set_question
        @question = Question.find(params[:id])
      end
    end
  end
end