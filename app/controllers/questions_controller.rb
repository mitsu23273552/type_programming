class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @max10_questions = Question.order("RAND()").limit(10)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path
    else
      render 'new'
    end
  end


  ##############プライベートメソッド##############
  private

  def question_params
    params.require(:question).permit(:user_id, :title, :answer, :commentary, :question_level_id).merge(user_id: current_user.id)
  end

end
