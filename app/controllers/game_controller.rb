class GameController < ApplicationController
  def gameview
    @mapitems = Mapitem.all
    if session[:lgin]
      @buildpts = User.find_by_username(session[:usrname]).buildpts
      @userid = User.find_by_username(session[:usrname]).id
    else
      @buildpts = 0
    end
  end
  def getState
    @mapitems = Mapitem.all
    respond_to do |format|
      format.json {render json: @mapitems}
    end
  end
  def getbuildpts
    if session[:lgin]
      @buildpts = User.find_by_username(session[:usrname]).buildpts
    else
      @buildpts = 0
    end
    respond_to do |format|
      format.json {render json: @buildpts}
    end
  end
  def placeconnector
    check = Mapitem.where(x: params[:x]).where(y: params[:y])
    if check.length == 0
      itemtype = Itemtype.find_by_id(params[:t])
      item = Mapitem.new
      player = User.find_by_username(session[:usrname])
      if player.buildpts >= itemtype.cost
        item.user = player
        item.x = params[:x]
        item.y = params[:y]
        item.itemtype = itemtype
        item.save
        player.buildpts = player.buildpts - itemtype.cost
        player.save
        render text: 'OK'
      else
        render text: 'ERROR'
      end
    end
  end
  def placebase

  end

  def remove
    if session[:lgin]
      player = User.find_by_username(session[:usrname])
      items = Mapitem.where(x: params[:x], y: params[:y])
      if items.length == 1
        item = items[0]
        if item.user.username == session[:usrname]
          item.destroy
          player.buildpts = player.buildpts + item.itemtype.cost
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
