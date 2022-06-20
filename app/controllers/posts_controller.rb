class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :game_data, only: [:result,:edit,:destroy,:score_create,:edit_score,:update,:update_score,:show,:Calculation]
  before_action :score_data, only: [:edit_score,:update_score,:show]


  def game_data
    @id = params[:id].to_i
    @game = Game.find_by(id: @id)
  end

  def score_data
    @scores_1 = Score.where(gameID: @id,playerID: @game.player1)
    @scores_2 = Score.where(gameID: @id,playerID: @game.player2)
    @scores_3 = Score.where(gameID: @id,playerID: @game.player3)
    @scores_4 = Score.where(gameID: @id,playerID: @game.player4)  
  end

  def index
    @games = Game.where(authorID: @current_user.id)
  end

  def edit
  end

  def update
    @game.name = params[:name]
    @game.uma = params[:uma]
    @game.rate = params[:rate]
    @game.tip = params[:tip]
    @game.player1 = params[:player1]
    @game.player2 = params[:player2]
    @game.player3 = params[:player3]
    @game.player4 = params[:player4]
    @game.save
    redirect_to("/index/#{@current_user.id}")
  end 

  def destroy
    @game.destroy
    redirect_to("/index/#{@current_user.id}")
  end

  def result
  end

  def score_create
    @score_1 = Score.new(
      gameID: params[:id],
      playerID: params[:playerID_1],
      score: params[:score_1],
      ranking: params[:ranking_1],
      game_num: params[:game_num] )
    @score_1.save

    @score_2 = Score.new(
      gameID: params[:id],
      playerID: params[:playerID_2],
      score: params[:score_2],
      ranking: params[:ranking_2],
      game_num: params[:game_num] )
    @score_2.save

    @score_3 = Score.new(
      gameID: params[:id],
      playerID: params[:playerID_3],
      score: params[:score_3],
      ranking: params[:ranking_3],
      game_num: params[:game_num] )
    @score_3.save

    @score_4 = Score.new(
      gameID: params[:id],
      playerID: params[:playerID_4],
      score: params[:score_4],
      ranking: params[:ranking_4],
      game_num: params[:game_num] )
    @score_4.save

    redirect_to("/game/#{@game.id}")
  end

  def edit_score
  end

  def update_score
    redirect_to("/game/#{@game.id}")
  end

  def game
  end

  def game_create
    @game = Game.new(
      uma: params[:uma],
      rate: params[:rate],
      tip: params[:tip],
      name: params[:name],
      player1: params[:player1],
      player2: params[:player2],
      player3: params[:player3],
      player4: params[:player4],
      authorID: @current_user.id) 
    @game.save
    redirect_to("/index/#{@current_user.id}")
  end

  def show
    @score_player1 = Calculation(@scores_1)
    @score_player2 = Calculation(@scores_2)
    @score_player3 = Calculation(@scores_3)
    @score_player4 = Calculation(@scores_4)
  end

  def Calculation(scores)
    if @game.uma == "10-20"
      uma_1 = 20
      uma_2 = 10
    else
      uma_1 = 30
      uma_2 = 10
    end

    sample = []
    scores.each do |score|
      if score.score % 1000 > 500
        point = (score.score.ceil(-3) - 30000)/1000
      else
        point = (score.score.floor(-3) - 30000)/1000
      end

      if score.ranking == 1 
        point = point + uma_1
      elsif score.ranking == 2
        point = point + uma_2 
      elsif score.ranking == 3
        point = point - uma_2  
      else
        point = point - uma_1
      end
      sample.push(point)
    end
    return  sample 
  end

end
