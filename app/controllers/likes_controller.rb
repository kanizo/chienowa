class LikesController < ApplicationController
  def create
    @editor = Editor.find(params[:editor_id])
    @like = current_user.likes.find_by(editor: @editor)
    toggle
  end

  private

    def toggle
      if @like
        return head :unprocessable_entity unless @like.destroy
      else
        @like = current_user.likes.build(editor: @editor)
        return head :unprocessable_entity unless @like.save
      end
      head :ok
    end
end