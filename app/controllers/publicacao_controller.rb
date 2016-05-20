class PublicacaoController < ApplicationController
  before_action :authenticate_user!

  def create
    @publicacao = Publicacao.new(publicacao_params)
    @publicacao.user = current_user

    if @publicacao.save
      redirect_to action: :index
    else
      redirect_to action: :edit
    end
  end

  def update
    @publicacao = Publicacao.find_by(id: id_params)
    @publicacao.update_attributes(publicacao_params)
  end

  def index
    @publicacoes = Publicacao.where(user_id: current_user.id)
  end

  def destroy

  end

  def show
    @publicacao = Publicacao.find_by(id: id_params, user_id: current_user.id)
  end

  def new
    @publicacao = Publicacao.new
  end

  def edit
    @publicacao = Publicacao.find_by(id: id_params)
  end

  private

  def publicacao_params
    params.require(:publicacao).permit(:text)
  end

  def id_params
    params.require(:id)
  end
end
