class QuestionsController < ApplicationController
  layout "layout"

  skip_before_action :verify_authenticity_token

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

  def edit
    @question = Question.find(params['id'])
  end

  def update
    @question = Question.find(params['id'])
    if @question.update_attributes(question_params)
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end

  def show
    @question = Question.find(params['id'])
  end

  def destroy
    question = Question.find(params['id'])
    if question.delete
      redirect_to questions_path
    end
  end

  private
    def question_params
      params.permit(:title, :body, :user_id)
    end
end
