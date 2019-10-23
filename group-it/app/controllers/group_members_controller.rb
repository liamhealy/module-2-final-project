class GroupMembersController < ApplicationController

    def new
        @group_member = GroupMember.new
        @group = Group.find(session[:group_id])
        # redirect_to create_group_member_path
    end

    def create
        @group_member = GroupMember.new(user_id: session[:user_id], group_id: session[:group_id])
        
        if @group_member.save
            flash[:notice] = "Successfully joined this group!"
            redirect_to group_path(@group_member.group_id)
        else
            flash[:notice] = "Unable to join group."
            redirect_to groups_path
        end
    end

end
