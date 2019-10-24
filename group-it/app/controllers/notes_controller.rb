class NotesController < ApplicationController

    def index
        @current_user = User.find(session[:user_id])
        @current_group = Group.find(params[:group_id])
        # @notes = Note.select{|n| n.group == @current_group}
        @notes = @current_user.notes
    end

    def show
        @note = Note.find(params[:id])
        @comments = @note.comments
    end

    def new
        @note = Note.new
    end

    def create
        @note = Note.new(note_params)
        @user_id = session[:user_id]
        @group_members = GroupMember.select{|gm| gm.user_id == @user_id}
        @group_member = @group_members.select{|gm| gm.group_id == params[:group_id].to_i}
        @note.group_member_id = @group_member.first.id
        @note.save
        redirect_to group_note_path(id: @note.id)
    end

    def edit
        @note = Note.find(params[:id])
    end

    def update
        @note = Note.find(params[:id])
        @note.update(note_params)
        redirect_to group_note_path(id: params[:id])
    end

    def delete
    end

    private

    def note_params
        params.require(:note).permit(:title, :content)
    end
end
