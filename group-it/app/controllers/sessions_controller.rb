class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:username])

        if @user
            session[:user_id] = @user.id
            if Group.first == nil
                session[:group_id] = 1    
            else
                session[:group_id] = Group.first.id
            end
            
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