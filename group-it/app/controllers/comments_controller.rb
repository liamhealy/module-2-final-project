class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        @note = Note.find(params[:note_id])
        @comment.note_id = @note.id
        @comment.save
    end


private

def comment_params
    params.require(:comment).permit(:content)
end

end
