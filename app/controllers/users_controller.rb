class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "新規登録が完了しました。"
            redirect_to "/users/#{@user.id}/dashboard"
        else
            flash.now[:alert] = "入力内容に不備があります。もう一度確認してください。"
            render :new
        end
    end

    def edit

    end

    def update

    end

    def destroy
        session_delete
        redirect_to new_session_path
    end

    def dashboard
        @user = User.find(session[:user_id])
    end



    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
