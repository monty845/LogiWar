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
  def fire
    hit = 0
    @mapitems = Mapitem.all
    @mapitems.each do |item|
      if (item.itemtype_id == 4 || item.itemtype_id == 1)
        user = item.user
        extra = 0
        if item.itemtype_id == 4
          search = Mapitem.where("x <= ?", item.x + 100).where("x >= ?", item.x - 100)
          search = search.where("y <= ?", item.y + 100).where("y >= ?", item.y - 100)
          search = search.where("itemtype_id = ?", 1).where("user_id = ?", item.user_id)
          search2 = Mapitem.where("x <= ?", item.x + 100).where("x >= ?", item.x - 100)
          search2 = search.where("y <= ?", item.y + 100).where("y >= ?", item.y - 100)
          search2 = search.where("itemtype_id = ?", 1).where("user_id = ?", item.user_id)
          if search.length > 0
            extra = 10
          end
        else
          extra = 1
        end
        user.buildpts = user.buildpts + extra
        user.save
      end
      if item.itemtype_id == 3
        search = Mapitem.where("x <= ?", item.x + 100).where("x >= ?", item.x - 100)
        search = search.where("y <= ?", item.y + 100).where("y >= ?", item.y - 100)
        search = search.where("itemtype_id = ?", 1).where("user_id = ?", item.user_id)
        if search.length > 0
          @mapitems2 = Mapitem.all
          @mapitems2.each do |target|
            if !target.user.nil? && (item.x - target.x)^2 + (item.y - target.y)^2 < 10000 && item.user.id != target.user.id
              target.health = target.health - 25
              target.save
              hit+=1
            end
          end
        end
      end
    end
    @mapitems = Mapitem.all
    @mapitems.each do |item|
      if !item.user.nil? && item.health <= 0
        item.delete
      end
    end
    render text: 'Fired' + hit.to_s
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
    if (check.length == 0 && params[:t] != "4") || (check.length == 1 && check[0].itemtype_id == 5 && params[:t] == "4")
      itemtype = Itemtype.find_by_id(params[:t])
      item = Mapitem.new
      player = User.find_by_username(session[:usrname])
      if player.buildpts >= itemtype.cost
        item.user = player
        item.x = params[:x]
        item.y = params[:y]
        item.itemtype = itemtype
        item.health = item.itemtype.basehealth
        item.save
        player.buildpts = player.buildpts - itemtype.cost
        player.save
        render text: 'OK'
      else
        render text: 'ERROR'
      end
    else
      render text: 'Error 2'
    end
  end
  def placebase

  end

  def remove
    if session[:lgin]
      player = User.find_by_username(session[:usrname])
      items = Mapitem.where(x: params[:x], y: params[:y])
      if items.length > 0
        items.each do |item|
          if !item.user.nil? && item.user.username == session[:usrname]
            item.destroy
            player.buildpts = player.buildpts + (item.itemtype.cost * item.health / item.itemtype.basehealth)
            player.save
            render text: 'OK'
          else
          end
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
