class ProfilesController < ApplicationController

  before_action :authenticate_user!

  def create

    @profile = Profile.new(profile_parms)
    #@profile.user = current_user
    if @profile.save
      current_user.profile = @profile
      current_user.save
      redirect_to action: :show, id: @profile.id
    else
      redirect_to action: :edit
    end

  end

  def update

    @profile = Profile.find_by(id: id_params)
    @profile.update_attributes(profile_parms)

  end

  def show
    @profile = Profile.find_by(id: id_params, user_id: current_user)
  end

  def new
    @profile = Profile.new
  end

  def edit
    @profile = Profile.find_by(id: id_params)
  end

  def profile_parms

    params.require(:profile).permit(:nome, :data_nascimento, :partido, :cidade,
    :estado, :nivel_de_treta, :estado_civil, :formacao)

  end

  def id_params
    params.require(:id)
  end

end
