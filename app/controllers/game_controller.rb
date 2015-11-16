class GameController < ApplicationController
  def gameview
    @mapitems = Mapitem.all
  end

  def place
    item = Mapitem.new
    item.user = User.find_by_username(session[:usrname])
    item.x = params[:x]
    item.y = params[:y]
    item.save
    render text: 'OK'
  end

end
