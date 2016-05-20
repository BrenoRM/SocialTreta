class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_parms)
    @publicacao = Publicacao.find_by id: id_publicacao_params

    @comment.user = current_user
    @comment.publicacao = @publicacao

    if @comment.save
      redirect_to controller: :profiles, action: :show, id: current_user.profile.id
    else
      redirect_to action: :edit
    end

  end

  def new
    @comment = Comment.new
  end

  def destroy
    @comment = Comment.find_by(id: id_params, user_id: current_user.id, publicacao_id: @publicacao.id)
    @comment.destroy
  end

  def show
    @comment = Comment.find_by(id: id_params, user_id: current_user.id, publicacao_id: @publicacao.id)
  end

  def index
    @comments = Comment.find_by(user_id: current_user.id, publicacao_id: id_publicacao_params)
  end

  def update
    @comment = Comment.find_by(id: id_params, user_id: current_user.id,
                               publicacao_id: @publicacao.id)
    @comment.update_attribute(comment_parms)
  end

  def edit
    @comment = Comment.find_by(id: id_params, user_id: curren_user.id,
                               publicacao_id: @publicacao.id)
  end

  def comment_parms
    params.require(:comment).permit(:text)
  end

  def id_params
    params.require(:id)
  end

  def id_publicacao_params
    params.require(:publicacao_id)
  end
end
