class AnswersController < ApplicationController
  def create
    a = Answer.create(answers_params)

    if a.save!
      redirect_to question_path(params['question_id'])
    end
  end

  private
    def answers_params
      params.permit(:body, :question_id, :user_id)
    end
end
