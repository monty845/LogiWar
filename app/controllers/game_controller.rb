class GameController < ApplicationController
  def gameview
    @mapitems = Mapitem.all
    if session[:lgin]
      @buildpts = User.find_by_username(session[:usrname]).buildpts
    else
      @buildpts = 0
    end
  end
  def getState
    @mapitems = Mapitem.all
    respond_to do |format|
      format.json {render json: @people}
    end

  end
  def place
    check = Mapitem.where(x: params[:x]).where(y: params[:y])
    if check.length == 0
      item = Mapitem.new
      player = User.find_by_username(session[:usrname])
      if player.buildpts > 0
        item.user = player
        item.x = params[:x]
        item.y = params[:y]
        item.save
        player.buildpts = player.buildpts - 1
        player.save
        render text: 'OK'
      else
        render text: 'ERROR'
      end
    end
  end
  def remove
    if session[:lgin]
      player = User.find_by_username(session[:usrname])
      items = Mapitem.where(x: params[:x], y: params[:y])
      if items.length == 1
        item = items[0]
        if item.user.username == session[:usrname]
          item.destroy
          player.buildpts = player.buildpts + 1
          player.save
          render text: 'OK'
        else
          render text: "ERROR"
        end
      else
        render text: "ERROR"
      end
    else
      render text: "ERROR"
    end
  end
  def game
  end
end
