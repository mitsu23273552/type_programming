class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :count, :create]

  def index
    @question1 = Question.where(question_level_id: 1).order("RAND()").first
    @question2 = Question.where(question_level_id: 2).order("RAND()").first
    @question3 = Question.where(question_level_id: 3).order("RAND()").first
    @question4 = Question.where(question_level_id: 4).order("RAND()").first
    @question5 = Question.where(question_level_id: 5).order("RAND()").first
    @question_answers = [@question1.answer, @question2.answer, @question3.answer, @question4.answer, @question5.answer]
    @question_titles = [@question1.title, @question2.title, @question3.title, @question4.title, @question5.title]
    gon.answers = @question_answers
    gon.titles = @question_titles
    @game = Game.new
    user_record = Game.find_by(user_id: current_user.id)
    user_records = [user_record.record_1st, user_record.record_2nd, user_record.record_3rd]
    gon.user_records = user_records
  end

  def create
    game = Game.find_by(user_id: current_user.id)
    game.update(game_params)
    redirect_to root_path
  end

  def ranking
      @games = Game.includes(:user).order(record_1st: :desc).first(10)
  end

  def count
    @error_text = []
    error_count = 0
    5.times do |i|
      i += 1
      if Question.where(question_level_id: i).empty?
        @error_text.push("LEVEL#{i}の問題がありません")
        error_count += 1
      end
    end
    if error_count > 0
      @max10_questions = Question.order("RAND()").limit(10)
      if current_user.present?
        @user_record = Game.find_by(user_id: current_user.id)
      end
      render template: "questions/index"
    end
    unless Game.exists?(user_id: current_user.id)
      game_default
    end
  end


  private
  def game_params
    params.permit(:user_id, :record_1st, :record_2nd, :record_3rd).merge(user_id: current_user.id)
  end

  def game_default
    @game = Game.create(user_id: current_user.id, record_1st: 0, record_2nd: 0, record_3rd: 0)
  end
end
