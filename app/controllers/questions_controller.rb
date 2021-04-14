class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :question_set, only: [:edit, :update, :destroy]
  before_action :current_user_check, only: [:edit, :update, :destroy]

  def index
    @max10_questions = Question.order("RAND()").limit(10)
    if current_user.present?
      @user_record = Game.find_by(user_id: current_user.id)
    end
    @error_text = []
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @question = Question.includes(:user).find(params[:id])
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question.id)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to user_question_path(current_user.id)
  end

  def user
    @user = User.find(params[:id])
    @game = Game.find_by(user_id: params[:id])
    @questions = Question.where(user_id: params[:id]).order(id: :DESC)
  end


  ##############プライベートメソッド##############
  private
  def question_params
    params.require(:question).permit(:user_id, :title, :answer, :commentary, :question_level_id).merge(user_id: current_user.id)
  end

  def question_set
    @question = Question.find(params[:id])
  end

  def current_user_check
    redirect_to action: :index unless current_user.id == @question.user_id
  end
end
