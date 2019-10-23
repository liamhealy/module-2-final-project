class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])    
    end

    def create
        @user = User.new(params_user)

        if @user.save
            flash[:notice] = "Account successfully created"
            redirect_to login_path
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to signup_path
        end
        # @user = User.create(params_user)
        # redirect_to login_path(@user)
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(params_user)
        redirect_to user_path(@user)    
    end



    private

    def params_user
        params.require(:user).permit(:username, :age, :location, :bio)
    end

end
