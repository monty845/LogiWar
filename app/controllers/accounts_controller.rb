class AccountsController < ApplicationController
  def all
    @Accounts = User.all
  end
  def home
  end
  def all2
    render :json => User.all
  end

end
