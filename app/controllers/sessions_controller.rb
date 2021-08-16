class SessionsController < ApplicationController
  def new
  end

  def create
    #user = User.find_by(email: params[:session][:email])
    user = User.find_by(email: session_params[:email])
    # authenticateメソッドは、引数に指定したパスワードの値と、userテーブルに登録されているpasswordと一致しているかを検証する
    #if user && user.authenticate(params[:session][:password])
    if user && user.authenticate(session_params[:password])
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  private
  def log_in(user)
      session[:user_id] = user.id
  end
  
  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
