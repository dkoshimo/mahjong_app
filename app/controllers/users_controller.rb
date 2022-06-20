class UsersController < ApplicationController
  def login_form
  end

  def login
    @user = User.find_by(
      email: params[:email],
      password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/index/#{@user.id}")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("/users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password])
      
    @user.save
    redirect_to("/index/#{@user.id}")
  end

end
