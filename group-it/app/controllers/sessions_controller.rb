class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:username])

        if @user
            session[:user_id] = @user.id
            session[:group_id] = Group.first.id
            redirect_to user_path(@user)
        else
            flash[:errors] = "Username does not exist, try again"
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to login_path
    end

end