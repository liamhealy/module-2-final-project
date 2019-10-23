class GroupsController < ApplicationController

    def index
        @groups = Group.all
    end

    def show
        @group = Group.find(params[:id])
        @notes = @group.notes
        @members = @group.users
    end

    def new
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)

        if @group.save
            redirect_to group_path(@group)
        else
            flash[:errors] = @group.errors.full_messages
            redirect_to new_group_path
        end
    end

    def edit
        @group = Group.find(params[:id])
    end

    def update
        @group = Group.find(params[:id])

        if @group.update(group_params)
            redirect_to group_path(@group)
        else
            flash[:errors] = @group.errors.full_messages
            redirect_to edit_group_path
        end
    end

    private

    def group_params
        params.require(:group).permit(:title, :theme, :description)
    end

end
