class SessionsController < ApplicationController
    #ログインフォーム表示
    def new
    end

    def create
        user = User.find_by(name: params[:session][:name], email: params[:session][:email])
        #パスワード確認
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Welcom back #{user.name}!!"
            redirect_to "/users/#{user.id}/dashboard"
        else
            render :new
        end
    end

    def destroy
        reset_session
        flash[:notice] = "See you again !"
        redirect_to new_session_path
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
