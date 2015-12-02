class CreateAccountController < ApplicationController
  #before_filter :login
  def start

  end

  def update
    user = User.find_by_username(session[:usrname])
    user.email = params[:email]
    user.display_name = params[:display_name]
    user.location = params[:location]
    user.gender = params[:gender]
    user.org_id = params[:org_id]
    user.title = params[:title]
    user.orgtype = params[:orgtype]
    user.alignment_id = params[:alignment_id]
    user.save
    redirect_to '/Profile'
  end

  def profile
    @activeuser = User.where(username: session[:usrname])
    if @activeuser.length > 0
      @friends = @activeuser[0].users
    else
      @friends = nil
    end
  end

  def edit
    @orgs = Org.all
    @alignments = Alignment.all
    @currentuser = User.where(username: session[:usrname])
  end

  def subscribe
    puts params[:email]

    render text: 'OK'
  end

  def student_json
    respond_to do |format|
      format.json { render :json => User.first}
    end
  end

  def create
    testuser = User.where(username: params[:username])
    flash[:user] = params[:username]
    flash[:email] = params[:email]
    if testuser.length == 0
      if params[:password].length > 0
        require 'digest/sha2'
        temphash = Digest::SHA2.new(512).hexdigest(params[:password] + params[:username])
        new_user = User.new
        new_user.username = params[:username]
        new_user.email = params[:email]
        new_user.password = temphash
	new_user.buildpts = 15

        if new_user.save
          redirect_to '/Profile'
        else
          flash[:error] = true;
          redirect_to '/CreateAccount/'
        end
      else
        flash[:errorpass] = true;
        redirect_to '/CreateAccount/'
      end
    else
      flash[:erroruser] = true;
      redirect_to '/CreateAccount/'
    end
  end
  def login
    @login = true
    if !session[:lgin]
      if cookies[:username]
        @user = User.where(username: cookies[:username])
        if @user.length > 0
          if cookies[:token] == @user[0].token
            session[:lgin] = true
            session[:usrname] = @user[0].username
            flash[:autologin] = true
          end
        end
      end
    end
  end
  def logout
    session[:lgin] = false
    session[:usrname] = ""
    cookies.delete :username
    cookies.delete :token
    redirect_to '/Accounts'
  end
  def verify
    @user = User.where(username: params[:username])
    require 'digest/sha2'
    @temphash = Digest::SHA2.new(512).hexdigest(params[:password] + params[:username])
    if @user.length > 0
      if @user[0].password == @temphash
        @user[0].token = Digest::SHA2.new(512).hexdigest(params[:username] + Time.new.inspect)
        cookies.permanent[:username] = params[:username]
        cookies.permanent[:token] = @user[0].token
        session[:lgin] = true
        session[:usrname] = params[:username]
        redirect_to '/Profile'
        @user[0].save
      else
        flash[:user] = params[:username]
        flash[:error] = true;
        redirect_to '/Login/'
      end
    else
      flash[:user] = params[:username]
      flash[:error] = true;
      redirect_to '/Login/'
    end
  end
end
