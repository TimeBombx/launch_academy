class QuestionsController < ApplicationController
  layout "layout"

  def index
    @questions = Question.order('updated_at DESC')
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def create_answer
  end

  def edit
  end

  def show
    @question = Question.find(params['id'])
  end

  def destroy
  end

  private
    def question_params
      params.permit(:title, :body, :user_id)
    end
end
