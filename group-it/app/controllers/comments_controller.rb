class CommentsController < ApplicationController

    def new
        @note = Note.find(params[:note_id])
        @comment = Comment.new

    end

    def create
        @comment = Comment.new(comment_params)
        @note = Note.find(params[:note_id].to_i)
        @comment.note_id = @note.id
        @comment.author_id = session[:user_id]
        @comment.save
        redirect_to group_note_path(id: @note.id)
    end

    def index
        @comments = Comment.select {|c| c.note.id == params[:note_id]}
        @note = Note.find(params[:note_id])
    end


private

def comment_params
    params.require(:comment).permit(:content)
end

end
